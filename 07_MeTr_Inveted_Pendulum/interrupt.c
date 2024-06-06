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


unsigned int TFlag = 0; // flag variable for timer0

// Pendulum PID gain
#define Kp_pend 20.0f
#define Kd_pend 10.0f
#define Ki_pend 0.14f

// Cart PID gain
#define Kp_cart -0.20f
#define Kd_cart -0.05f
#define Ki_cart -0.0002f

// PID control Variables
float pend_prevErr = 0.0f, pend_sumErr = 0.0f;
float cart_prevErr = 0.0f, cart_sumErr = 0.0f;

interrupt void ISRtimer0()
{
	float pend_deg, pend_err, u_pend;
	float cart_pos, cart_err, u_cart;
	float u;

	// PID ctrl: get u_fb
	pend_deg = GetPendulumAngle();
	cart_pos = GetCartPos();

	// compute err
	pend_err = pend_R - pend_deg;
	cart_err = cart_R - cart_pos;


	if(fabs(pend_err) > 15){
		SwingUpControl();
	} 
	else {
		// compute PID
		pend_sumErr += pend_err;
		u_pend = (Kp_pend * pend_err) + (Ki_pend * pend_sumErr) + (Kd_pend * (pend_err-pend_prevErr)); 
		pend_prevErr = pend_err;

		// compute cart PID
		cart_sumErr += cart_err;
		u_cart = (Kp_cart * cart_err) + (Ki_cart * cart_sumErr) + (Kd_cart * (cart_err-cart_prevErr)); 
		cart_prevErr = cart_err;

		// PWM out: drive the motor
		u = u_pend + u_cart;
		PWMOut(u); 
	}

	// print usb monotor
	UMAddData(pend_err, cart_err, u_pend, u_cart);

	// timer var handling
	TINTCnt++;
	TFlag = 1;
}

