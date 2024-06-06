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

interrupt void ISRtimer0()
{
	static unsigned int cnt=0;
	static float mmag = 0.2f;

	float sig0, sig1, sig2, sig3;

	TFlag = 1;


	// Example code to use USBMonitor
	sig0 = mmag*sinf(2.0f*3.141592f/5000.0f*cnt);
	sig1 = mmag*cosf(2.0f*3.141592f/2000.0f*cnt);
	sig2 = mmag*sinf(2.0f*3.141592f/2500.0f*cnt);
	sig3 = mmag*cosf(2.0f*3.141592f/25000.0f*cnt);

	cnt++;
	if ((cnt%5000) == 0) {
		mmag += 0.01f;
		if (mmag > 2.0f) {
			mmag = 0.2f;
		}
	}

	UMAddData(sig0, sig1, sig2, sig3);	// Add 4 data set to USBMon
}

