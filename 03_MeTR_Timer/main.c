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
	float duty; 		// return할 hex 단위의 dutyratio
	
	if (dutyratio < -50.0) {
		dutyratio = -50.0;	 // Saturation
	}

	if (dutyratio> 50.0) {	
		dutyratio = 50.0;
	}
	duty = (dutyratio + 50) * 0xfff/100.0;

	*PWMRIGHT = duty;

	return dutyratio;  
}

float GetAngle(){
	int encbit;
	signed int signed_encbit;
	float rotationDeg;

	// masking: left only the last 16bits
	encbit = *ENCPOSR & 0xFFFF;

	// converse into signed number
	if (encbit <= 0x7FFF) signed_encbit = encbit;
	else signed_encbit = encbit - 65536;

	// calc rotattion degree depends on the resolution
	rotationDeg = signed_encbit * (360.0 / 3840.0); // 바퀴 1회전당 3840 pulse
	return rotationDeg;
}

unsigned int TINTCnt;
int timerCheckCnt = 0;
float overshoot = 0.0f; // to track overshoot
float overshootPercent = 0.0f;
float currPos;
float R = 180.0f; // reference pos

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
	*ENCPOSCLR = 1;			// 위치 초기화
	*PWMDRVEN = 1;			// PWMENABLE 1 : ON, 0 : 0FF
	//*PWMRIGHT = 0x800;		// PWM : 0x000 ~ 0x800 ~ 0xFFF

	TINTCnt = 0;	

	while (1) {
		*FPGALED ^= 1;

		// for degugging
		currPos = GetAngle();
		overshootPercent = (overshoot - R) / R * 100;

		
		// timer check
		timerCheckCnt++;
		MACRO_PRINT((tmp_string, "==== Timer Check: %d ====\r\n", timerCheckCnt));

		MACRO_PRINT((tmp_string, "current pos: %6.2f \r\n", GetAngle() ));

		MACRO_PRINT((tmp_string, "Encoder bit: 0x%04x \r\n", *ENCPOSR & 0xFFFF)); 
		
		// repeat move deg 0 to deg 180, deg 180 to deg 0
		if(R == 180.0){
			R = 0.0;
			MACRO_PRINT((tmp_string, "Overshoot: %6.2f ( %.2f%% ) \r\n", overshoot, overshootPercent));
		} 
		else if(R == 0.0) R = 180.0;
		
		MACRO_PRINT((tmp_string, "\r\n"));
		WaitTFlagCnt(2000); // Wait 2 sec, TFlag is interrupt Cnt (interrupt FRQ : 1kHz)

	}
}
