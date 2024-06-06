/* Bss.h */

// Serial.c
extern COMPACKET compacket;
extern RESPACKET respacket;
extern char tmp_string[SIZE_OF_RESPACKET];

// Interrupt.c
extern unsigned int TFlag;
extern float USB_pos;
extern float USB_vel;
extern float USB_prevVel;
extern float USB_CurrVel;
extern float USB_acc;
extern unsigned int USB_delayCnt;

