/* Serial.c */

#include <c6x.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "c6701.h"
#include "constant.h"
#include "typedef.h"
#include "bss.h"
#include "function.h"
#include "USBMon.h"

COMPACKET compacket;
RESPACKET respacket;
char tmp_string[SIZE_OF_RESPACKET];

void InitUART()
{
	volatile unsigned int tmp;

	compacket.rd_ptr = compacket.packet;
	compacket.wr_ptr = compacket.packet;
	compacket.flag = 0;
	respacket.flag = 0;

	*linecon = 0x80;
	*txrx_divl = 6;
	*inten_divh = 0x00;

	*linecon = 0x03;
	*intid_fifo = 0x01;
	*intid_fifo = 0x07;
	*inten_divh = 0x01;
	*modemcon = 0x08;

	tmp = *txrx_divl;
}

char ReceiveByte()
{
	return (char)(*txrx_divl & 0xFF);
}

void SendByte(char data)
{
	while ((*linestatus & 0x60) == 0) ;
	
	*txrx_divl = data;
}

int CheckSum()
{
	int sum=0;
	int i;
	
	for(i=0;i<(int)(compacket.buffer_ptr-compacket.buffer-2);i++) {
		sum += (int)compacket.buffer[i];
	}
	sum = sum % 100;
	
	*compacket.buffer_ptr = NULL;
	if(atoi(compacket.buffer_ptr-2) == sum) {
		return 1;
	}
	else {
		return 0;
	}
}

void SendData()
{
	respacket.flag = 1;
	respacket.char_num = strlen(respacket.string)-1;
	respacket.char_to_send = 1;
	SendByte(respacket.string[0]);
	*inten_divh = 0x03;		
}

void Report()
{
	unsigned int i, j;

	strcpy(respacket.string, tmp_string);
	
	for(i=0; i<strlen(respacket.string); i++) {
		SendByte(respacket.string[i]);
		for(j=0;j<5e2;j++);
	}
}

