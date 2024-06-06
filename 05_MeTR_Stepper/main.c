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
    *CECTL0 =   (0x00 << 28)    |   // (4-bit) WriteSetup[31:28]
                (0x03 << 22)    |   // (6-bit) WriteStrobe[27:22]
                (0x01 << 20)    |   // (2-bit) WriteHold[21:20]
                (0x00 << 16)    |   // (4-bit) ReadSetup[19:16]
                (0x00 << 14)    |   // (2-bit) Rsvd[15:14]
                (0x03 <<  8)    |   // (6-bit) ReadStrobe[13:8]
                (0x00 <<  7)    |   // (1-bit) Rsvd[7]
                (0x02 <<  4)    |   // (3-bit) MType[6:4]
                (0x00 <<  2)    |   // (2-bit) Rsvd[3:2]
                (0x01 <<  0)    ;   // (2-bit) ReadHold[1:0]

    // IOCS2: Async 32bit Mode, Setup 2 and Strobe 5, Hold 1
    *CECTL2 =   (0x02 << 28)    |   // (4-bit) WriteSetup[31:28]
                (0x05 << 22)    |   // (6-bit) WriteStrobe[27:22]
                (0x01 << 20)    |   // (2-bit) WriteHold[21:20]
                (0x02 << 16)    |   // (4-bit) ReadSetup[19:16]
                (0x00 << 14)    |   // (2-bit) Rsvd[15:14]
                (0x05 <<  8)    |   // (6-bit) ReadStrobe[13:8]
                (0x00 <<  7)    |   // (1-bit) Rsvd[7]
                (0x02 <<  4)    |   // (3-bit) MType[6:4]
                (0x00 <<  2)    |   // (2-bit) Rsvd[3:2]
                (0x01 <<  0)    ;   // (2-bit) ReadHold[1:0]
}

void InitTimer()
{
    // Hold 0 and Go 0, Internal Clock Source (160Mhz/4), Clock Mode   
    *T0CTL |= 0x00000300;

    // Timer Period
    *T0PRD = (CPU_FRQ/4.0f)/(2.0f*TIMER_FRQ);   // f = 40Mhz/2*Period 

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

// Waits until a timer interrupt occurs
void WaitTFlag()
{
    while (!TFlag) ;    // TFlag is set to 1 when an interrupt occurs
    TFlag = 0;          // Waits until an interrupt occurs and then terminates the function
}

// Waits for the specified number of timer interrupts
// Waiting time = (Timer Period) * cnt
void WaitTFlagCnt(unsigned int cnt)
{
    unsigned int i;

    TFlag = 0;

    for (i = 0; i < cnt; i++) {
        WaitTFlag();    // Waits until an interrupt occurs before returning
    } // Waits for the specified number of interrupts
}




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// @brief Function to rotate the stepper motor one step in either forward or reverse direction
/// @param dir          If dir = 0, rotate forward; if dir = 1, rotate backward
/// @param tDelayCnt    Wait until the timer interrupt occurs tDelayCnt times before returning from the function

int currentPhaseIndex;
unsigned int currentDir, previousDir;

void OneStepMove(unsigned int dir, unsigned int tDelayCnt) {
    int phase[4] = {0x2, 0x8, 0x1, 0x4}; // Stepping motor phases: A, B, /A, /B
    int index;
    int setPhase; 

    currentDir = dir;
    index = currentPhaseIndex;

    // CW: A, B, /A, /B
    if (dir == 0) { 
        if (currentDir != previousDir) {
            if (index == 3) index = -1;
            index++;
        } else {
            setPhase = phase[index];
            if (index == 3) index = -1;
            index++;
        } // Adjust index when reversing rotation direction
    }
    
    // CCW: A, /B, /A, B
    else if (dir == 1) {
        if (currentDir != previousDir) {
            if (index == 0) index = 4;
            index--;
        } else {
            setPhase = phase[index];
            if (index == 0) index = 4;
            index--;
        } // Adjust index when reversing rotation direction
    }

    // Update phase
    currentPhaseIndex = index;
    previousDir = dir;
    
    // Drive the motor
    *STEPPER = setPhase;
    WaitTFlagCnt(tDelayCnt);    
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// @brief          Applies a trapezoidal velocity profile with constant angular acceleration.
///                 Stores the delay time between steps as the number of timer interrupts.
/// @param maxVel   Used as an absolute value.
/// @param accel    Used as an absolute value.
/// @return         Number of steps during the acceleration phase.

#define STEP_ANGLE 1.8f // step angle = 1.8 deg
unsigned int delayCntArr[200]; // Lookup table for delay counts

unsigned int MakeVelProfile(float maxVel, float accel) {
    unsigned int    step;               // Current step index
    float           s1AccelAngle;       // Angle covered during acceleration
    unsigned int    accelTotalSteps;    // Total steps during acceleration phase
    float           stepDelayTime;      // Delay time for each step
    float           delayCnt;           // Timer interrupt count from delay time

    step = 1;

    // Calculate the angle covered during acceleration (s1)
    s1AccelAngle = (maxVel * maxVel) / (2.0 * accel); 
    // Calculate total steps during acceleration phase
    accelTotalSteps = s1AccelAngle / STEP_ANGLE; 

    // Populate the delay count array starting from index 1
    for (step = 1; step <= accelTotalSteps; step++) {
        stepDelayTime = sqrt((float)STEP_ANGLE / (2.0 * accel * step));
        delayCnt = TIMER_FRQ * stepDelayTime; // Calculate interrupt count from delay time
        delayCntArr[step] = (unsigned int)delayCnt;
    }    

    return accelTotalSteps;
}




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// @brief Rotates the motor by the specified number of steps, with the direction determined by the sign of the angle. Applies a trapezoidal velocity profile.
/// @param angle    The angle to rotate, in degrees. The direction is determined by the sign.
/// @param maxVel   Maximum velocity, used as an absolute value.
/// @param accel    Acceleration, used as an absolute value.

// USB Variables for Debugging
float USB_pos;
float USB_vel;
float USB_prevVel = 0.0;
float USB_currVel;
float USB_acc;
unsigned int USB_delayCnt;

int totalSteps; // Total number of steps

void StepMoveVP(float angle, float maxVel, float accel){
    int dir; // Direction
    float s1AccelAngle; // s1
    unsigned int accelSteps; // Total steps in the trapezoidal acceleration phase
    unsigned int accelStepsTri; // Steps in the triangular acceleration phase
    unsigned int delayCnt;
    unsigned int arrIdx;
    int i;

    dir = (angle > 0) ? 0 : 1; // If angle is positive: CW (0), if negative: CCW (1)
    angle = fabs(angle); 

    totalSteps = (float)angle / STEP_ANGLE; // Calculate total integer steps

    // Calculate total steps and generate step delay lookup table
    s1AccelAngle = (maxVel * maxVel) / (2.0 * accel); // Calculate s1
    accelSteps = MakeVelProfile(maxVel, accel);

    // Rotate the motor by the input angle
    arrIdx = 1;
    if (angle <= 2 * s1AccelAngle) { // Triangular profile
        accelStepsTri = (angle / 2.0) / STEP_ANGLE;
        for (i = 1; i <= totalSteps; i++) {
            // Acceleration zone
            if (i <= accelStepsTri) {
                delayCnt = delayCntArr[arrIdx];
                arrIdx++;
            }
            // Deceleration zone
            else {
                arrIdx--;
                delayCnt = delayCntArr[arrIdx];                
            }
            // Drive the motor
            OneStepMove(dir, delayCnt);

            // Print out on USB monitor for debugging
            if (dir == 0) USB_pos = STEP_ANGLE * i;
            else USB_pos = -1 * STEP_ANGLE * i;
            USB_vel = STEP_ANGLE / (delayCnt / TIMER_FRQ);
            USB_acc = (USB_vel - USB_prevVel) / (delayCnt / TIMER_FRQ);
            USB_prevVel = USB_vel;
            USB_delayCnt = delayCnt;
        }
    } else { // Trapezoidal profile       
        for (i = 1; i <= totalSteps; i++) {
            // Acceleration zone
            if (i <= accelSteps) {
                delayCnt = delayCntArr[arrIdx];
                arrIdx++;
            }
            // Constant velocity zone
            else if (i > accelSteps && i <= totalSteps - accelSteps) {
                arrIdx = accelSteps;
                delayCnt = delayCntArr[arrIdx];
            }
            // Deceleration zone
            else if (i > totalSteps - accelSteps && i <= totalSteps) {
                delayCnt = delayCntArr[arrIdx];
                arrIdx--;
            }
            // Drive the motor
            OneStepMove(dir, delayCnt);

            // Print out on USB monitor for debugging
            if (dir == 0) USB_pos = STEP_ANGLE * i;
            else USB_pos = -1 * STEP_ANGLE * i;
            USB_vel = STEP_ANGLE / (delayCnt / TIMER_FRQ);
            USB_acc = (USB_vel - USB_prevVel) / (delayCnt / TIMER_FRQ);
            USB_prevVel = USB_vel;
            USB_delayCnt = delayCnt;
        }
    } 

    // Initialize debugging variables
    USB_pos = 0;
    USB_acc = 0;
    USB_prevVel = 0;
    USB_delayCnt = 0;
}



void main()
{
    int pos;
    int vel;
    int acc;

    InitEXINTF();   // Asynchronous Bus Initialization
    InitTimer();    // Timer Initialization
    InitUART();     // UART Initialization
    InitINT();      // Interrupt Enable(External INT and Timer INT)
    InitUSBMon();   // USB Monitor Initialization

    MACRO_PRINT((tmp_string, "\r\n\r\n"));
    MACRO_PRINT((tmp_string, "Mechatronics Course %d\r\n", 2024));
    MACRO_PRINT((tmp_string, "FPGA Ver%2x.%02x\r\n", ((*FPGAVER>>8) & 0xFF), (*FPGAVER & 0xFF)));

    TFlag = 0;
    GIE();

    *FPGALED = 1;           // FPGA LED 1 : ON, 0 : OFF

    currentPhaseIndex = 1;       // set the initial phase: A
    // init dir
    currentDir = 0; 
    previousDir = 0;            

    WaitTFlagCnt(10000); // start program after 1sec   
////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // verify OneStepMove by running the motor 3 steps in CW with 1 sec delay 
    pos = -360, vel = 3000, acc = 20000;
    if(pos > 0) currentPhaseIndex = 0;
    else currentPhaseIndex = 1;

    StepMoveVP(pos, vel, acc);

    while (1) {} // block to terminate
}
