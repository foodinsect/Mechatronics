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

float PWMOut(float dutyratio)
{
	/*
        1. Generate a PWM waveform corresponding to -50.0 <= dutyratio <= 50.0, which results in 0-100% duty cycle.
        2. The output PWM duty cycle should be saturated at 0% or 100%.
    */

	float duty; 		
	
	// Saturation (Safety margin 0.5)
	if (dutyratio < -49.5) {
		dutyratio = -49.5;		// Limit minimum duty ratio
	}

	if (dutyratio> 49.5) {	
		dutyratio = 49.5;		// Limit maximum duty ratio
	}

	// Conversion from duty ratio to PWM value
	duty = (dutyratio + 50) * 0xfff/100.0;

	*PWMLEFT = duty;	// Set PWM value to hardware register

	return dutyratio;  	// Return the saturated duty ratio
}

#define ENCPULSE 1024.0

float GetCartPos(){
	short encbit;
	signed int signed_encbit;
	float rotationDeg;

	// Masking: keep only the last 16 bits
	encbit = *ENCPOSR & 0xFFFF;

	// Convert into a signed decimal number
	signed_encbit = (encbit <= 0x7FFF) ? encbit : encbit - 65536;

	// Calculate rotation degree based on encoder resolution
	rotationDeg = signed_encbit * (360.0 / (ENCPULSE)); // 1024 pulses per wheel rotationpulse
	return rotationDeg;	// Return the calculated rotation in degrees
}

float GetPendulumAngle(){
	short encbit;
	signed int signed_encbit;
	float rotationDeg;

	// Masking: keep only the last 16 bits
	encbit = *ENCPOSL & 0xFFFF;

	// Convert into a signed decimal number
	signed_encbit = (encbit <= 0x7FFF) ? encbit : encbit - 65536;

	// Calculate rotation degree based on encoder resolution
	rotationDeg = signed_encbit * (360.0 / (ENCPULSE)); // 1024 pulses per wheel rotationpulse

	// Restrict rotation degree to the range 0.0~360.0
	rotationDeg = fmod(rotationDeg, 360.0f);
    if (rotationDeg < 0.0f) {
        rotationDeg += 360.0f;
    }

	return rotationDeg;	// Return the calculated rotation in degrees
}


/*

// < Energy Based Swing Up Logic >

// System parameters
#define M_PI 3.14159265358979323846
#define L 0.3  
#define g 9.81 
#define m 0.28
#define Kp -50

float GetPendulumAngularVelocity() {
    static float prev_angle = 0.0;
    float curr_angle;
    float angular_velocity;
    float delta_time = 0.001;  // Timer period (1 ms)

    // Get the current angle (in degrees)
    curr_angle = GetPendulumAngle();

    // Convert angle to radians
    curr_angle = curr_angle * M_PI / 180.0;

    // Calculate angular velocity
    angular_velocity = (curr_angle - prev_angle) / delta_time;

    // Update previous angle to current angle
    prev_angle = curr_angle;

    return angular_velocity;
}

void SwingUpControl() {
    float pend_angle, theta_dot, total_energy, desired_energy, energy_error;
    float kinetic_energy, potential_energy;
    float u;
    float cart_position;
    static int control_duration = 0; // Variable to manage control input duration
    const float angle_scale = 0.05; // Proportional coefficient for control input based on angle

    // Get the current pendulum angle (in degrees)
    pend_angle = GetPendulumAngle();

    // Convert angle to radians
    pend_angle = pend_angle * M_PI / 180.0;

    // Get the current pendulum angular velocity
    theta_dot = GetPendulumAngularVelocity();

    // Get the current cart position
    cart_position = GetCartPos();

    // Calculate current energy
    kinetic_energy = 0.5 * m * pow(L * theta_dot, 2); // Kinetic energy: 1/2 * m * (L * theta_dot)^2
    potential_energy = m * g * L * (1 - cos(pend_angle)); // Potential energy: m * g * L * (1 - cos(angle))

    // Total energy
    total_energy = kinetic_energy + potential_energy;

    // Desired energy
    desired_energy = m * g * L;  // Energy when the pendulum is in the upright position

    // Energy error
    energy_error = desired_energy - total_energy;

    if (control_duration > 0) {
        // Maintain control signal during control input duration
        control_duration--;
        if (cart_position > 1000) {
            PWMOut(-50);
        } else if (cart_position < -1000) {
            PWMOut(50);
        }
    } else {
        // Set control input duration based on cart position
        if (cart_position > 1000) {
            control_duration = 150; // Maintain control input for 150 TINTCnt
            PWMOut(-30);
        } else if (cart_position < -1000) {
            control_duration = 150; // Maintain control input for 150 TINTCnt
            PWMOut(30);
        } else {
            // Adjust control input based on pendulum angle
            u = Kp * energy_error;
            PWMOut(u);
        }
    }
}

*/


int swingUpDirection = 1; // If true, use control Input : -30, if false, use control Input : 30
int WaitCnt = 400;
float u = 30.0;

void SwingUpControl(){
	float pend_angle;
	pend_angle = GetPendulumAngle();	// Get the current pendulum angle

	if (TINTCnt < WaitCnt){
		if (swingUpDirection) {
			// Check if the pendulum angle is within specified ranges
			if (pend_angle > 140 && pend_angle < 180 || pend_angle < 220 && pend_angle > 180){
				u = 35;		// Set control Input to 35
				PWMOut(u);	
			} else{
				u = 30;		// Set control Input to 30
				PWMOut(-u);
			}
		}
		else{
			// Check if the pendulum angle is within specified ranges
			if (pend_angle > 140 && pend_angle < 180 || pend_angle < 220 && pend_angle > 180){
				u = 35;
				PWMOut(-u);
			} else{
				u = 30;
				PWMOut(u);
			}
		}
	} 
	else{
		TINTCnt = 0;		// Reset timer interrupt counter
		swingUpDirection = !swingUpDirection;		// Toggle swing up direction

		// Check if the pendulum angle is within the balancing range
		if(pend_angle < 190 && pend_angle > 170){
			WaitCnt = 400;	// Reset wait counter if within balancing range
		}
		WaitCnt += 20;		// Increment wait counter to Swing Up
	}

}

// timer var
unsigned int TINTCnt;
int timerCheckCnt = 0;

// reference pos of pendulum and cart
float R_pend = 180.0;
float R_cart = 0.0;

// mode control variable
enum MODE mode;


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

	GIE();
	*FPGALED = 1;			// FPGA LED 1 : ON, 0 : OFF
	*PWMDRVEN = 1;			// PWMENABLE 1 : ON, 0 : 0FF
	*ENCPOSCLR = 1;			// Clear Encoder Counter to 0

	WaitTFlagCnt(1000);


	TINTCnt = 0;	// timer varable init
	
	
	while (1) {
		*FPGALED ^= 1;

		// if the pendulum is located within balancing range, change the mode
		if(y_pend >= 160 && y_pend <= 200){
			mode = BALANCING;
		}
		else{
			mode = SWINGUP; // start with swing-up
		}

		// timer check
		if(TINTCnt > 1000){

			timerCheckCnt++;
			MACRO_PRINT((tmp_string, "==== Timer Check: %d ====\r\n", timerCheckCnt));

			MACRO_PRINT((tmp_string, "pendulum pos: %6.2f \r\n", GetPendulumAngle() ));

			MACRO_PRINT((tmp_string, "cart encoder: %6.2f \r\n", GetCartPos())); 
			MACRO_PRINT((tmp_string, "\r\n"));
			TINTCnt = 0;
		}
	}
}

