/* Interupt.c */

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
#include "interrupt.h"
#include "USBMon.h"


interrupt void ISRNMI()
{
}

interrupt void ISRextint6()
{
	volatile unsigned int tmp;

	while((tmp = *intid_fifo & 0x0F) != 1) {
		if(tmp == 0x04) {
			while(*linestatus&0x01) {
				*(compacket.wr_ptr) = *txrx_divl & 0xFF;
				SendByte(*(compacket.wr_ptr));
				if(compacket.wr_ptr == (compacket.packet+SIZE_OF_COMPACKET-1)) {
					compacket.wr_ptr = compacket.packet;
				}
				else {
					compacket.wr_ptr++;
				}
			}
		}
		else if(tmp == 0x02) {
			if(respacket.char_num-- > 0) {
				*txrx_divl = respacket.string[respacket.char_to_send++];
			}
			else {
				*inten_divh = 0x01;			
				respacket.flag = 0;
			}
		}
		else if(tmp == 0x0C) {
			while(*linestatus & 0x01) {
				*(compacket.wr_ptr) = *txrx_divl & 0xFF;
				if(compacket.wr_ptr == (compacket.packet+SIZE_OF_COMPACKET-1)) {
					compacket.wr_ptr = compacket.packet;
				}
				else {
					compacket.wr_ptr++;
				}
			}
		}
	}
}

// flag variable for timer0
unsigned int TFlag = 0; 

// PID gain tuning
#define Kp 0.35f
#define Kd 4.5f
#define Ki 0.0f
#define Kff 0.01f

// PID compute variables
float prevErr = 0.0f, sumErr = 0.0f;

// interrupt Frequancy : 1kHz
interrupt void ISRtimer0()
{
	float y, err, u_fb, uSat;
	float u, u_ff;

	// Get current angle from the encoder
	y = GetAngle();

	// Compute error between reference angle and current angle
	err = pos_t - y;

	// Compute PID control input
	sumErr += err;
	u_fb = (Kp * err) + (Ki * sumErr) + (Kd * (err-prevErr)); 
	prevErr = err;

	// Compute Feedforward Control Input
	u_ff = Kff * vel_t;
	u = u_ff + u_fb;

	uSat = PWMOut(u); // This part sends the PWM signal to the motor for actual operation

	// Print data to USB monitor
	UMAddData(pos_t, err, vel_t, uSat);

	// Increment timer interrupt count and set flag
	TINTCnt++;
	TFlag = 1;
}
