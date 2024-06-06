// USBMon.c

#include <c6x.h>
#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "USBMon.h"

#pragma DATA_SECTION(USBMonStuff, ".USBMON");
USBMONSTUFF USBMonStuff;

void InitUSBMon()
{
	USBMonStuff.Flag = 0;
	USBMonStuff.CrtCnt = 0;
	USBMonStuff.CrtBank = 0;
}

void UMAddData(float ch0D, float ch1D, float ch2D, float ch3D)
{
	unsigned int crtCnt;
	unsigned int bank;

	crtCnt = USBMonStuff.CrtCnt;
	bank = USBMonStuff.CrtBank;

	USBMonStuff.CH0Buff[bank][crtCnt] = ch0D;
	USBMonStuff.CH1Buff[bank][crtCnt] = ch1D;
	USBMonStuff.CH2Buff[bank][crtCnt] = ch2D;
	USBMonStuff.CH3Buff[bank][crtCnt] = ch3D;

	USBMonStuff.CrtCnt++;

	if (USBMonStuff.CrtCnt >= DEF_TRANSFER_SIZE) {
		USBMonStuff.CrtCnt = 0;
		if (bank) {
			USBMonStuff.CrtBank = 0;
		}
		else {
			USBMonStuff.CrtBank = 1;
		}
		USBMonStuff.Flag = DEF_TRANSFER_SIZE * 4;
	}
}


