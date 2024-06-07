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

#define ENCPULSE 1024.0

// timer varriable
unsigned int TINTCnt;
unsigned int timerCheckCnt;


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
		1. -50.0 <= dutyratio <= 50.0, 이에 해당하는 0~100% PWM 파형 발생시킨다. 
		2. 출력 파형의 PWM duty는 0 또는 100% duty로 saturation 되어야 함.
	*/

	float duty; 		
	
	//saturation
	if (dutyratio < -49.5) {
		dutyratio = -49.5;
	}

	if (dutyratio> 49.5) {	
		dutyratio = 49.5;
	}

	// dutyratio <-> PWM conversion
	duty = (dutyratio + 50) * 0xfff/100.0;

	*PWMLEFT = duty;

	return dutyratio;  
}

float GetCartPos(){
	short encbit;
	signed int signed_encbit;
	float rotationDeg;

	// masking: left only the last 16bits
	encbit = *ENCPOSR & 0xFFFF;

	// converse into signed decimal number
	if (encbit <= 0x7FFF) signed_encbit = encbit;
	else signed_encbit = encbit - 65536;

	// calc rotation degree depends on the resolution
	rotationDeg = signed_encbit * (360.0 / (ENCPULSE)); // 바퀴 1회전당 1024 pulse
	return rotationDeg;
}

float GetPendulumAngle(){
	short encbit;
	signed int signed_encbit;
	float rotationDeg;

	// masking: left only the last 16bits
	encbit = *ENCPOSL & 0xFFFF;

	// converse into signed decimal number
	if (encbit <= 0x7FFF) signed_encbit = encbit;
	else signed_encbit = encbit - 65536;

	// calc rotation degree depends on the resolution
	rotationDeg = signed_encbit * (360.0 / (ENCPULSE)); // 바퀴 1회전당 1024 pulse
	/*
	// rotation degree를 0.0~360.0 범위로 제한

	*/
	rotationDeg = fmod(rotationDeg, 360.0f);
    if (rotationDeg < 0.0f) {
        rotationDeg += 360.0f;
    }

	return rotationDeg;
}

// 시스템 매개변수
#define M_PI 3.14159265358979323846
#define L 0.3  
#define g 9.81 
#define m 0.28
#define Kp -50
float GetPendulumAngularVelocity() {
    static float prev_angle = 0.0;
    float curr_angle;
    float angular_velocity;
    float delta_time = 0.001;  // 타이머 주기 (1ms)

    // 현재 각도 가져오기 (도 단위)
    curr_angle = GetPendulumAngle();

    // 각도를 라디안으로 변환
    curr_angle = curr_angle * M_PI / 180.0;

    // 각속도 계산
    angular_velocity = (curr_angle - prev_angle) / delta_time;

    // 이전 각도를 현재 각도로 업데이트
    prev_angle = curr_angle;

    return angular_velocity;
}


void SwingUpControl() {
    float pend_angle, theta_dot, total_energy, desired_energy, energy_error;
    float kinetic_energy, potential_energy;
    float u;
    float cart_position;
    static int control_duration = 0; // 제어 입력 유지 시간을 관리하는 변수
    const float angle_scale = 0.05; // 각도에 따른 제어 입력 비례 계수

    // 현재 펜듈럼 각도 가져오기 (도 단위)
    pend_angle = GetPendulumAngle();

    // 각도를 라디안으로 변환
    pend_angle = pend_angle * M_PI / 180.0;

    // 현재 펜듈럼 각속도 가져오기
    theta_dot = GetPendulumAngularVelocity();

    // 현재 카트 위치 가져오기
    cart_position = GetCartPos();

    // 현재 에너지 계산
    kinetic_energy = 0.5 * m * pow(L * theta_dot, 2); // 운동에너지: 1/2 * m * (L * theta_dot)^2
    potential_energy = m * g * L * (1 - cos(pend_angle)); // 위치에너지: m * g * L * (1 - cos(각도))

    // 전체 에너지
    total_energy = kinetic_energy + potential_energy;

    // 원하는 에너지
    desired_energy = m * g * L;  // 펜듈럼이 수직 위치에 있을 때의 에너지

    // 에너지 오차
    energy_error = desired_energy - total_energy;

    if (control_duration > 0) {
        // 제어 입력 유지 시간 동안 제어 신호를 유지합니다.
        control_duration--;
        if (cart_position > 1000) {
            PWMOut(-50);
        } else if (cart_position < -1000) {
            PWMOut(50);
        }
    } else {
        // 카트 위치에 따라 제어 입력 유지 시간을 설정합니다.
        if (cart_position > 1000) {
            control_duration = 150; // TINTCnt 150 동안 제어 입력 유지
            PWMOut(-30);
        } else if (cart_position < -1000) {
            control_duration = 150; // TINTCnt 150 동안 제어 입력 유지
            PWMOut(30);
        } else {
            // 펜듈럼 각도에 따라 제어 입력을 조정
            u = Kp * energy_error;
            PWMOut(u);
        }
    }
}

// timer var
unsigned int TINTCnt;
unsigned int INTRR_cnt;

// tracking var
float R = 180.0f; // reference pos
float vel_max = 1500.0f, accel = 10000.0f;

float cart_R = 0.0;
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
	*ENCPOSCLR = 1;			// Encoder position initialization

	WaitTFlagCnt(1000);	// execute program after waiting 1 sec

	TINTCnt = 0;	// timer varable init
	
	while (1) {
		*FPGALED ^= 1;

		// debugging
		if(TINTCnt > 500){

			timerCheckCnt++;
			MACRO_PRINT((tmp_string, "==== Timer Check: %d ====\r\n", timerCheckCnt));

			// check current pendulum position
			MACRO_PRINT((tmp_string, "pendulum pos: %6.2f \r\n", GetPendulumAngle() ));

			// check current cart position
			MACRO_PRINT((tmp_string, "cart encoder: %6.2f \r\n", GetCartPos())); 
			
			MACRO_PRINT((tmp_string, "\r\n"));
			TINTCnt = 0;
		}
	}
}

