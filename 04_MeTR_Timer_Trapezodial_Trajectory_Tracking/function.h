/* Function.h */

// Serial.c
extern void InitUART();
extern char ReceiveByte();
extern void SendByte(char data);
extern int CheckSum();
extern void SendData();
extern void Report();

// Main.c
extern void delay_us(unsigned int time_us);
extern void delay_ms(unsigned int time_ms);
extern void WaitTFlag();
extern void WaitTFlagCnt(unsigned int cnt);
extern float PWMOut(float dutyratio);
extern float GetAngle();
extern void GetRefAngleVel(float sref, float vmax, float acc);

