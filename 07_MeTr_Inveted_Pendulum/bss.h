/* Bss.h */

// Serial.c
extern COMPACKET compacket;
extern RESPACKET respacket;
extern char tmp_string[SIZE_OF_RESPACKET];

// Interrupt.c
extern unsigned int TFlag;

// Main.c
extern unsigned int TINTCnt;
extern unsigned int t;
extern float overshoot;
extern float pend_R; // reference pos
extern float cart_R; // reference pos
