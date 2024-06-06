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

// PID gain tuning
#define Kp 5.0f
#define Kd 0.0f
#define Ki 0.0f

// PID Control Variables
float prevErr = 0.0f, sumErr = 0.0f;
float uControlInput;

interrupt void ISRtimer0()
{
    /*
        BLDC Motor
        BLDC motors can be controlled similarly to DC motors after initial drive setup.
    */

    float y, err;

    // Get current angle from hall counter
    y = currAngle;

    // Compute error
    err = refAngle - y;

    // Compute PID control input
    sumErr += err;
    uControlInput = (Kp * err) + (Ki * sumErr) + (Kd * (err - prevErr)); 
    prevErr = err;

    // Print to USB monitor
    UMAddData(refAngle, y, uControlInput, uSat);

    // Timer variable handling
    TFlag = 1;
}
