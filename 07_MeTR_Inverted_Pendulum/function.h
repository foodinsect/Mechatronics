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

// PWM convert Logic
extern float PWMOut(float dutyratio);

// Encoder Logic (ENCPOS to deg)
extern float GetPendulumAngle();
extern float GetCartPos();

// extern float GetPendulumAngularVelocity();   // Energy-Based Swing-Up

/// SwingUp Logic
extern void SwingUpControl();

