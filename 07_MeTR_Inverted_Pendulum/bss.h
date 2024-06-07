/* Bss.h */

// Serial.c
extern COMPACKET compacket;
extern RESPACKET respacket;
extern char tmp_string[SIZE_OF_RESPACKET];

// Interrupt.c
extern unsigned int TFlag;
extern float y_pend;
extern float y_cart;
// debugging var inside of Ineterrupt.c
extern float mostPlusPos;
extern float mostMinusPos;
extern float prevPendPos;
extern float remainedAngleToTheGoal;

// Main.c
extern unsigned int TINTCnt;
extern float R_pend; // pendulum reference pos
extern float R_cart; // cart reference pos
enum MODE {SWINGUP, BALANCING}; // MODE
extern enum MODE mode;

