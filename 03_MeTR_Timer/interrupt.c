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

unsigned int TFlag = 0;

#define Kp 0.35f
#define Kd 4.5f
#define Ki 0.000001f

float prevErr = 0.0f, sumErr = 0.0f;

interrupt void ISRtimer0()
{
	//PID controller
	/*
		1. get angle
		2. err compute
		3. PID compute
		4. PWM out
	*/
	float y, err, u, uSat;

	// get angle
	y = GetAngle();

	// compute err
	err = R - y;

	// compute PID
	sumErr += err;
	u = (Kp * err) + (Ki * sumErr) + (Kd * (err-prevErr)); 
	prevErr = err;

	// PWM out
	uSat = PWMOut(u); // 모터에 PWM을 주어 실제로 동작하게 되는 부분

	// calc overshoot
	if(y > overshoot) overshoot = y;

	// print usb monitor
	UMAddData(R, y, u, uSat);

	TINTCnt++;
	TFlag = 1;
}
