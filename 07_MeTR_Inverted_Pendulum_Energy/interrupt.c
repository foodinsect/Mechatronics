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

//PID controller
#define Kp 20.0f
#define Kd 10.0f
#define Ki 0.14f

#define Kp_cart -0.20f
#define Kd_cart -0.05f
#define Ki_cart -0.0002f


float prevErr = 0.0f, sumErr = 0.0f;
float cart_prevErr = 0.0f, cart_sumErr = 0.0f;
unsigned int TFlag = 0; // flag variable for timer0

interrupt void ISRtimer0()
{
	float y, err, u_pendulum;
	float cart_pos, cart_err, u_cart;
	float u, uSat;

	// PID ctrl: get u_fb
	y = GetPendulumAngle();
	cart_pos = GetCartPos();

	// compute err
	err = R - y;
	cart_err = cart_R - cart_pos;


	if(fabs(err) > 10){
		SwingUpControl();
		// sumErr = -500.0f;
		sumErr = 0.0f;
		cart_sumErr = 0.0f;
		cart_prevErr = 0.0;
		prevErr = 0.0f;
	} 
	else {
		// compute PID
		sumErr += err;
		u_pendulum = (Kp * err) + (Ki * sumErr) + (Kd * (err-prevErr)); 
		prevErr = err;

		// compute cart PID
		cart_sumErr += cart_err;
		u_cart = (Kp_cart * cart_err) + (Ki_cart * cart_sumErr) + (Kd_cart * (cart_err-cart_prevErr)); 
		cart_prevErr = cart_err;

		// PWM out: drive the motor
		u = u_pendulum + u_cart;
		uSat = PWMOut(u); 
	}



	// print usb monotor
	UMAddData(R, cart_err, err, uSat);

	// timer var handling
	TINTCnt++;
	INTRR_cnt++;
	TFlag = 1;
}