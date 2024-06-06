/* interupt.h */

#define INT06
#define INT14

extern interrupt void ISRNMI();			// NMI handler declaration

#ifdef INT04
extern interrupt void ISRextint4();		// external interrupt 4 handler declaration
#else
interrupt void ISRextint4(){}			// external interrupt 4 handler definition
#endif

#ifdef INT05
extern interrupt void ISRextint5();		// external interrupt 5 handler declaration
#else
interrupt void ISRextint5(){}			// external interrupt 5 handler declaration
#endif

#ifdef INT06
extern interrupt void ISRextint6();		// external interrupt 6 handler declaration
#else
interrupt void ISRextint6(){}			// external interrupt 6 handler declaration
#endif

#ifdef INT08
extern interrupt void c_int08();			// DMA0 interrupt handler declaration
#else
interrupt void c_int08(){}				// DMA0 interrupt handler declaration
#endif

#ifdef INT09
extern interrupt void c_int09();			// DMA1 interrupt handler declaration
#else
interrupt void c_int09(){}				// DMA1 interrupt handler definition
#endif

#ifdef INT14
extern interrupt void ISRtimer0();		// timer 0 interrupt handler declaration
#else
interrupt void ISRtimer0(){}			// timer 0 interrupt handler definition
#endif

