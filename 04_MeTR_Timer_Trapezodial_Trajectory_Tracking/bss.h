/* Bss.h */

// Serial.c
extern COMPACKET compacket;
extern RESPACKET respacket;
extern char tmp_string[SIZE_OF_RESPACKET];

// Interrupt.c
extern unsigned int TFlag;

// Main.c
extern unsigned int TINTCnt;
extern unsigned int INTRR_cnt;
extern unsigned int t;
extern float overshoot;
extern float R; // reference pos
extern float pos_t; // ref. pos.
extern float vel_t; // ref. vel.
