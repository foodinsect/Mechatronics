/* Main.c */

#include <c6x.h>
#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "c6701.h"
#include "constant.h"
#include "typedef.h"
#include "bss.h"
#include "function.h"
#include "USBMon.h"

void InitEXINTF()
{
	// Disable SSCEN(bit#5), CLK1EN(bit#4), CLK2EN(bit#3)
	*GBLCTL &= 0xFFFFFFC7;

	// IOCS0: Async 32bit Mode, Setup 0 and Strobe 3, Hold 1  
	*CECTL0 = 	(0x00 << 28)	|	// (4-bit) WriteSetup[31:28]
				(0x03 << 22)	|	// (6-bit) WriteStrobe[27:22]
				(0x01 << 20)	|	// (2-bit) WriteHold[21:20]
				(0x00 << 16)	|	// (4-bit) ReadSetup[19:16]
				(0x00 << 14)	|	// (2-bit) Rsvd[15:14]
				(0x03 <<  8)	|	// (6-bit) ReadStrobe[13:8]
				(0x00 <<  7)	|	// (1-bit) Rsvd[7]
				(0x02 <<  4)	|	// (3-bit) MType[6:4]
				(0x00 <<  2)	|	// (2-bit) Rsvd[3:2]
				(0x01 <<  0)	;	// (2-bit) ReadHold[1:0]

	// IOCS2: Async 32bit Mode, Setup 2 and Strobe 5, Hold 1
	*CECTL2 =	(0x02 << 28)	|	// (4-bit) WriteSetup[31:28]
				(0x05 << 22)	|	// (6-bit) WriteStrobe[27:22]
				(0x01 << 20)	|	// (2-bit) WriteHold[21:20]
				(0x02 << 16)	|	// (4-bit) ReadSetup[19:16]
				(0x00 << 14)	|	// (2-bit) Rsvd[15:14]
				(0x05 <<  8)	|	// (6-bit) ReadStrobe[13:8]
				(0x00 <<  7)	|	// (1-bit) Rsvd[7]
				(0x02 <<  4)	|	// (3-bit) MType[6:4]
				(0x00 <<  2)	|	// (2-bit) Rsvd[3:2]
				(0x01 <<  0)	;	// (2-bit) ReadHold[1:0]
}

void InitTimer()
{
	// Hold 0 and Go 0, Internal Clock Source (160Mhz/4), Clock Mode   
	*T0CTL |= 0x00000300;

	// Timer Period
	*T0PRD = (CPU_FRQ/4.0f)/(2.0f*TIMER_FRQ);	// f = 40Mhz/2*Period 

	// Hold 1 and Go 1   
	*T0CTL |= 0x000000C0;
}

void InitINT()
{
	// Enable CPU Interrupt INT06(EXTINT6), INT14(TINT0) and NMI
	IER |= 0x00004042;
}

void GIE()
{
	// Global Interrupt Enable
	CSR |= 0x00000001;
}

// Caution: The delayed time is not exact.
void delay_us(unsigned int time_us)
{
	register unsigned int i;

	for (i = 0; i < (time_us * 14); i++) ;
}

// Caution: The delayed time is not exact.
void delay_ms(unsigned int time_ms)
{
	register unsigned int i;

	for (i = 0; i < time_ms; i++) {
		delay_us(1000);
	}
}

// Wait until timer interrupt
void WaitTFlag()
{
	while (!TFlag) ;
	TFlag = 0;
}

// Waiting time = (Timer Period) * cnt
void WaitTFlagCnt(unsigned int cnt)
{
	unsigned int i;

	TFlag = 0;

	for (i=0; i<cnt; i++) {
		WaitTFlag();
	}
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// @brief Generates symmetric PWMH and PWML values based on the duty ratio
/// @param dutyratio Duty ratio, expected range: -100.0 <= dutyratio <= 100.0

int PWMD;       // Value converted from input integer range of -100 to 100 to PWM input value
int PWMH;       // High PWM value
int PWML;       // Low PWM value
float uSat;     // Saturation value

#define PWMZ 0x800  // Hi-z implemented as 0% duty cycle

void PWMOut(float dutyratio) // Generates symmetric PWMH and PWML values for -100.0 <= dutyratio <= 100.0
{
    float PWMduty;  
    
    // Saturation: constrain dutyratio to -99.5 <= dutyratio <= 99.5 (0.5 as a safety margin)
    if(dutyratio > 99.5) dutyratio = 99.5;
    if(dutyratio < -99.5) dutyratio = -99.5;

    // Convert dutyratio to PWM value
    PWMduty = dutyratio * 0x7FF / 100.0;    

    // Calculate PWMH and PWML
    PWMD = PWMduty;
    PWMH = PWMZ + PWMD;
    PWML = PWMZ - PWMD;

    uSat = dutyratio;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// @brief Converts hall sensor count to an angle in degrees
/// @param hallCnt The hall sensor count
/// @return The corresponding angle in degrees

#define GearRatio 27.0
#define Hall 12.0

float angleFromHallCount(int hallCnt){
    return hallCnt * 360.0 / (GearRatio * Hall);  // Gear ratio 27:1, 12 hall sensors = 324 counts per revolution
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// @brief Controls the BLDC motor based on the provided duty cycle and updates the angle based on Hall sensor readings
/// @param duty The duty cycle for PWM control

int hallCount = 0;           // Hall sensor count
unsigned int prevHall = 0;   // Previous Hall sensor value
unsigned int currHall;       // Current Hall sensor value
float currAngle;             // Current angle in degrees

void BLDCDrive(float duty) {
    // Set PWM value based on the duty cycle
    PWMOut(duty);

    // Read the current Hall sensor value
    currHall = *BLDCHALL & 0x7;

    // Set the phase considering the current Hall sensor value
    switch (currHall) {
        case 2:     // Hall Phase 1 (ZLH) : Hall sensor value = 2
            *BLDC2 = PWMZ;
            *BLDC1 = PWML;
            *BLDC0 = PWMH;
            if (prevHall == 6) hallCount++;
            if (prevHall == 3) hallCount--;
            break;
        case 3:     // Hall Phase 2 (HLZ) : Hall sensor value = 3
            *BLDC2 = PWMH;
            *BLDC1 = PWML;
            *BLDC0 = PWMZ;
            if (prevHall == 2) hallCount++;
            if (prevHall == 1) hallCount--;
            break;
        case 1:     // Hall Phase 3 (HZL) : Hall sensor value = 1
            *BLDC2 = PWMH;
            *BLDC1 = PWMZ;
            *BLDC0 = PWML;
            if (prevHall == 3) hallCount++;
            if (prevHall == 5) hallCount--;
            break;
        case 5:     // Hall Phase 4 (ZHL) : Hall sensor value = 5
            *BLDC2 = PWMZ;
            *BLDC1 = PWMH;
            *BLDC0 = PWML;
            if (prevHall == 1) hallCount++;
            if (prevHall == 4) hallCount--;
            break;
        case 4:     // Hall Phase 5 (LHZ) : Hall sensor value = 4
            *BLDC2 = PWML;
            *BLDC1 = PWMH;
            *BLDC0 = PWMZ;
            if (prevHall == 5) hallCount++;
            if (prevHall == 6) hallCount--;
            break;
        case 6:     // Hall Phase 6 (LZH) : Hall sensor value = 6
            *BLDC2 = PWML;
            *BLDC1 = PWMZ;
            *BLDC0 = PWMH;
            if (prevHall == 4) hallCount++;
            if (prevHall == 2) hallCount--;
            break;
    }

    // Update the previous Hall sensor value
    prevHall = currHall;

    // Calculate the current angle from the Hall sensor count
    currAngle = angleFromHallCount(hallCount);
}


// Practical exercises 1 ~ 3
// #define DEF_LOW		0x000
// #define DEF_HIZ		0x800
// #define DEF_HIGH	0xFFF
// #define DELAY		200

float refAngle;
void main()
{
	int i;
	InitEXINTF();	// Asynchronous Bus Initialization
	InitTimer();	// Timer Initialization
	InitUART();		// UART Initialization
	InitINT();		// Interrupt Enable(External INT and Timer INT)
	InitUSBMon();	// USB Monitor Initialization

	MACRO_PRINT((tmp_string, "\r\n\r\n"));
	MACRO_PRINT((tmp_string, "Mechatronics Course %d\r\n", 2024));
	MACRO_PRINT((tmp_string, "FPGA Ver%2x.%02x\r\n", ((*FPGAVER>>8) & 0xFF), (*FPGAVER & 0xFF)));

	TFlag = 0;

	GIE(); GIE(); 	// Global Interrupt Enable

    *BLDCEN = 1; 	// BLDC Motor Driver Enable

    WaitTFlagCnt(100);
    refAngle = 360.0;

    // Drive motor by reference angle
    while (1) {
        for(i = 0; i < 10000; i++){
            BLDCDrive(uControlInput);
        }
        MACRO_PRINT((tmp_string, "currAngle: %.2f\r\n\r\n", currAngle));
    }

    /*
        // Practical exercise 1: Basic skeleton operation
        while (0) {
            *BLDC2 = DEF_LOW;
            *BLDC1 = DEF_HIZ;
            *BLDC0 = DEF_HIGH;
            WaitTFlagCnt(DELAY);

            *BLDC2 = DEF_HIZ;
            *BLDC1 = DEF_LOW;
            *BLDC0 = DEF_HIGH;
            WaitTFlagCnt(DELAY);

            *BLDC2 = DEF_HIGH;
            *BLDC1 = DEF_LOW;
            *BLDC0 = DEF_HIZ;
            WaitTFlagCnt(DELAY);

            *BLDC2 = DEF_HIGH;
            *BLDC1 = DEF_HIZ;
            *BLDC0 = DEF_LOW;
            WaitTFlagCnt(DELAY);

            *BLDC2 = DEF_HIZ;
            *BLDC1 = DEF_HIGH;
            *BLDC0 = DEF_LOW;
            WaitTFlagCnt(DELAY);

            *BLDC2 = DEF_LOW;
            *BLDC1 = DEF_HIGH;
            *BLDC0 = DEF_HIZ;
            WaitTFlagCnt(DELAY);
        }
        
        // Practical exercise 2: Fill out table to determine Hall sensor values
        while (0) {
            *BLDC2 = DEF_LOW;
            *BLDC1 = DEF_HIGH;
            *BLDC0 = DEF_HIGH;
            WaitTFlagCnt(DELAY);
            hall = *BLDCHALL & 0x7;
            MACRO_PRINT((tmp_string, "LHH: %d\n", hall));

            *BLDC2 = DEF_LOW;
            *BLDC1 = DEF_LOW;
            *BLDC0 = DEF_HIGH;
            WaitTFlagCnt(DELAY);
            hall = *BLDCHALL & 0x7;
            MACRO_PRINT((tmp_string, "LLH: %d\n", hall));

            *BLDC2 = DEF_HIGH;
            *BLDC1 = DEF_LOW;
            *BLDC0 = DEF_HIGH;
            WaitTFlagCnt(DELAY);
            hall = *BLDCHALL & 0x7;
            MACRO_PRINT((tmp_string, "HLH: %d\n", hall));

            *BLDC2 = DEF_HIGH;
            *BLDC1 = DEF_LOW;
            *BLDC0 = DEF_LOW;
            WaitTFlagCnt(DELAY);
            hall = *BLDCHALL & 0x7;
            MACRO_PRINT((tmp_string, "HLL: %d\n", hall));

            *BLDC2 = DEF_HIGH;
            *BLDC1 = DEF_HIGH;
            *BLDC0 = DEF_LOW;
            WaitTFlagCnt(DELAY);
            hall = *BLDCHALL & 0x7;
            MACRO_PRINT((tmp_string, "HHL: %d\n", hall));

            *BLDC2 = DEF_LOW;
            *BLDC1 = DEF_HIGH;
            *BLDC0 = DEF_LOW;
            WaitTFlagCnt(DELAY);
            hall = *BLDCHALL & 0x7;
            MACRO_PRINT((tmp_string, "LHL: %d\n", hall));
        }

        // Practical exercise 3: Open-loop control with BLDCDrive()
        while (0) {
            duty = 100;
            BLDCDrive(duty);
        }
    */
}
