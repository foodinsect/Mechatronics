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

	// IOCS_2: Async 32bit Mode, Setup 2 and Strobe 5, Hold 1
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
/// @brief 	Generates a PWM signal based on the User Input 
/// @param 	dutyratio Duty ratio ranging from -50.0 to 50.0
/// @return The final adjusted dutyratio value

float PWMOut(float dutyratio)
{
    /*
        Goal
        1. Generates a 0~100% PWM waveform corresponding to -50.0 <= dutyratio <= 50.0.
        2. The PWM duty of the output waveform must be saturated to 0% or 100%.
        
            User Input   |  Conversion to PWM Value (hex) |    	Direction     	|  	   Speed
			ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
            0 %          |              0x000             |   Reverse rotation  |  -100% (max)
            25 %         |              0x400             |   Reverse rotation  |  -50%  (half)
            50 %         |              0x800             |       Stop         	|   0%   (stop)
            75 %         |              0x000             |   Forward rotation  |   50%	 (half)
            100 %        |              0x400             |   Forward rotation  |   100% (max) 
    */

	float duty; 				// PWM duty variable
	
	// Saturation (Safety margin 0.5)
	if (dutyratio < -49.5) {
		dutyratio = -49.5;
	}
	if (dutyratio > 49.5) {	
		dutyratio = 49.5;
	}

	// Conversion of dutyratio to PWM value
	duty = (dutyratio + 50) * 0xfff/100.0;

	*PWMRIGHT = duty;			// Set value to the PWM register

	return dutyratio;  			// Return the final adjusted dutyratio
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
/// @brief Reads the encoder position and calculates the rotation angle in degrees.
/// @return The rotation angle in degrees.

#define MOTOR_TURNS_PER_WHEEL 7.5
#define PULSES_PER_MOTOR_TURN 512.0

float GetAngle(){
    int encbit;  // Variable to store the encoder position bits
    signed int signed_encbit;  // Variable to store the signed encoder position
    float rotationDeg;  // Variable to store the calculated rotation angle

    // Masking: keep only the last 16 bits
    encbit = *ENCPOSR & 0xFFFF;

    // Convert into signed decimal number
    signed_encbit = (encbit <= 0x7FFF) ? encbit : encbit - 65536;

    // Calculate rotation degree depending on the resolution
    // 1 wheel rotation = 3840 pulses
    rotationDeg = signed_encbit * (360.0 / (MOTOR_TURNS_PER_WHEEL * PULSES_PER_MOTOR_TURN));
    return rotationDeg;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
/// @brief Function to generate position references for trapezoidal trajectory tracking
/// @param S_ref Reference distance
/// @param V_max Maximum velocity
/// @param a Acceleration

void GetRefAngleVel(float S_ref, float V_max, float a) {
    /*
    For tracking control:
    1. Set the reference position to 0.0f
    2. A simple implementation like if(R < 720.0f) R = R + 1.0f;
       will result in the reference rising linearly, providing smoother motion compared to before.
    3. For even smoother motion, use GetRefAngleVel(float S_ref, float V_max, float a) for trapezoidal trajectory tracking.
    4. Feedforward can be easily implemented by multiplying the velocity (vel_t) calculated in this function with the feedforward gain.
*/

    /*
    For feedforward control:
    1. If implementing feedforward (C_ff) as the inverse transfer function of the DC motor system:
    2. Convenience 1) Use the 'velocity' trajectory, the derivative form of the trapezoidal position trajectory, as C_ff.
    3. Convenience 2) Approximate at low frequencies (s->0) to apply C_ff = b/K.
*/

    float t = TINTCnt * 0.001; // Calculate current time t based on interrupt period
    float t1, t2, t3;
    float S_1, S_2;

    // Acceleration phase (t <= t1)
    t1 = V_max / a;
    S_1 = (V_max * V_max) / (2.0 * a);

    // Constant velocity phase (t1 <= t <= t2)
    t2 = S_ref / V_max;
    S_2 = S_ref - S_1;

    // Deceleration phase (t2 <= t <= t3)
    t3 = t2 + t1;

    // Exceptional case (triangular trajectory profile)
    if (S_ref <= 2 * S_1) { // Condition: total distance < sum of acceleration and deceleration distances
        // Acceleration phase (t <= t1)
        t1 = sqrt(S_ref / a);
        S_1 = S_ref / 2;

        V_max = a * t1;

        // Deceleration phase (t2 <= t <= t3)
        t2 = 2 * t1;

        // Acceleration phase
        if (t <= t1) {
            vel_t = a * t;
            pos_t = 0.5 * a * t * t;		// Deceleration phase
        } else if (t1 < t && t <= t2) {
            vel_t = V_max - a * (t - t1);
            pos_t = S_1 + V_max * (t - t1) - 0.5 * a * (t - t1) * (t - t1);
        } else {
            vel_t = 0;
            pos_t = S_ref;
        }
    } else { // Trapezoidal trajectory profile
        // Acceleration phase
        if (t <= t1) {
            vel_t = a * t;
            pos_t = 0.5 * a * (t * t); 		// Constant velocity phase
        } else if (t1 < t && t <= t2) {
            vel_t = V_max;
            pos_t = S_1 + V_max * (t - t1);	// Deceleration phase
        } else if (t2 < t && t <= t3) {
            vel_t = V_max - a * (t - t2);
            pos_t = S_2 + V_max * (t - t2) - 0.5 * a * (t - t2) * (t - t2);
        } else {
            vel_t = 0;
            pos_t = S_ref;
        }
    }
}

// timer variables
unsigned int TINTCnt;
int timerCheckCnt = 0;

// tracking variables
float R = 720.0f; 			// reference position
float vel_max = 1500.0f, accel = 10000.0f; 	// set the MAX velocity and Accelation
float pos_t = 0.0f; 			// Trajectory Traking position
float vel_t = 0.0f; 			// Trajectory Traking velocity

void main()
{
	InitEXINTF();	// Asynchronous Bus Initialization
	InitTimer();	// Timer Initialization
	InitUART();		// UART Initialization
	InitINT();		// Interrupt Enable(External INT and Timer INT)
	InitUSBMon();	// USB Monitor Initialization

	MACRO_PRINT((tmp_string, "\r\n\r\n"));
	MACRO_PRINT((tmp_string, "Mechatronics Course %d\r\n", 2024));
	MACRO_PRINT((tmp_string, "FPGA Ver%2x.%02x\r\n", ((*FPGAVER>>8) & 0xFF), (*FPGAVER & 0xFF)));

	TFlag = 0;

	GIE();						// Global Interrupt Enable !!

	*FPGALED = 1;				// FPGA LED 1 : ON, 0 : OFF
	*PWMDRVEN = 1;				// PWMENABLE 1 : ON, 0 : 0FF
	*ENCPOSCLR = 1;				// Clear Encoder Counter to 0
	//*PWMRIGHT = 0x800;		// PWM : 0x000 ~ 0x800 ~ 0xFFF

	WaitTFlagCnt(1000);

	TINTCnt = 0;

	while (1) {
		*FPGALED ^= 1;

		// generate position references for trapezoidal trajectory tracking
		GetRefAngleVel(R, vel_max, accel);
		
		if(TINTCnt > 2000){

			timerCheckCnt++;
			MACRO_PRINT((tmp_string, "==== Timer Check: %d ====\r\n", timerCheckCnt));

			MACRO_PRINT((tmp_string, "current pos: %6.2f \r\n", GetAngle() ));

			MACRO_PRINT((tmp_string, "Encoder bit: 0x%04x \r\n", *ENCPOSR & 0xFFFF)); 

			MACRO_PRINT((tmp_string, "\r\n"));
			TINTCnt = 0;
		}
		
	}
}
