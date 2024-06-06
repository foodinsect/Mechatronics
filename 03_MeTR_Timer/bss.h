/* Bss.h */

// Serial.c
extern COMPACKET compacket;
extern RESPACKET respacket;
extern char tmp_string[SIZE_OF_RESPACKET];

// Interrupt.c
extern unsigned int TFlag;

// Main.c
extern unsigned int TINTCnt;
extern float overshoot;         // overshoot for debug
extern float R;                 // reference pos

