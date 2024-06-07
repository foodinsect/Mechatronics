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


// pendulum PID controller
#define Kp 20.0f
#define Kd 10.0f
#define Ki 0.14f
float prevErr_pend = 0.0f, sumErr_pend = -200.0f;

// cart PID controller
#define Kp_cart -0.20f
#define Kd_cart -0.05f
#define Ki_cart -0.0002f
float prevErr_cart = 0.0f, sumErr_cart = 0.0f;

unsigned int TFlag = 0; // flag variable for timer0

// variable for pendulum
float y_pend, err_pend, u_pend;

// variable for cart
float y_cart, err_cart, u_cart;

interrupt void ISRtimer0()
{
	float u, uSat;


	// PID ctrl: get u_fb
	y_pend = GetPendulumAngle();
	y_cart = GetCartPos();

	// compute err
	err_pend = R_pend - y_pend;
	err_cart = R_cart - y_cart;	


	// BALANCING MODE: within +-10 pos range
	if(mode == BALANCING){
		if(err_pend <= 20 && err_pend >= -20){
			// compute PID
			sumErr_pend += err_pend;
			u_pend = (Kp * err_pend) + (Ki * sumErr_pend) + (Kd * (err_pend - prevErr_pend)); 
			prevErr_pend = err_pend;

			// compute cart PID
			sumErr_cart += err_cart;
			u_cart = (Kp_cart * err_cart) + (Ki_cart * sumErr_cart) + (Kd_cart * (err_cart - prevErr_cart)); 
			prevErr_cart = err_cart;

			// PWM out: drive the motor
			u = u_pend + u_cart;
			uSat = PWMOut(u); 
		} 
	}
	
	// SWINGUP MODE
	if(mode == SWINGUP){
		SwingUpControl();
		sumErr_pend = 0.0f;
		err_pend = 0.0f;
		prevErr_pend = 0.0f;
		sumErr_cart = 0.0f;
		err_cart = 0.0f;
		prevErr_cart = 0.0f;
	}

	// print usb monotor
	UMAddData(R_pend, err_cart, err_pend, uSat);

	// timer var handling
	TINTCnt++;
	TFlag = 1;
}

