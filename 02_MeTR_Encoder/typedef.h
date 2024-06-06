/* Typedef.h */

#include "constant.h"

// Data Structure for Control
typedef struct 
{
	char packet[SIZE_OF_COMPACKET];
	char ul[5], vl[5], ur[5], vr[5];
	char* rd_ptr;
	char* wr_ptr;
	char buffer[SIZE_OF_COMPACKET];
	char* buffer_ptr;
	int flag;
} COMPACKET;

typedef struct 
{
	char string[SIZE_OF_RESPACKET];
	int char_num;
	int char_to_send;
	int flag;
} RESPACKET;

#define MACRO_PRINT(_x_)		sprintf _x_ ;	\
								Report()

