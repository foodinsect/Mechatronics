// USBMon.h

#define DEF_TRANSFER_SIZE	(1000)

typedef struct _USBMONSTUFF
{
	unsigned int Flag;		// 0x8000_8000	Handshake flag
	unsigned int CrtCnt;	// 0x8000_8004	Number of samples in Buff
	unsigned int CrtBank;	// Double Buffer Index
	float CH0Buff[2][1024];	// 0x8000_8008	Channel 0 buffer, double buffer
	float CH1Buff[2][1024];	// 0x8000_9008	Channel 1 buffer, double buffer
	float CH2Buff[2][1024];	// 0x8000_A008	Channel 2 buffer, double buffer
	float CH3Buff[2][1024];	// 0x8000_B008	Channel 3 buffer, double buffer
} USBMONSTUFF;

typedef enum _BOOL {FALSE = 0, TRUE} BOOL;

extern USBMONSTUFF USBMonStuff;


extern void InitUSBMon();
extern void UMAddData(float ch0D, float ch1D, float ch2D, float ch3D);


