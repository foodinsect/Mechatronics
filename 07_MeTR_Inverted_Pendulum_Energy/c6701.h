/* C6701.h */

// EXINTF
#define GBLCTL			(volatile unsigned int*)0x01800000
#define CECTL0			(volatile unsigned int*)0x01800008
#define CECTL1			(volatile unsigned int*)0x01800004
#define CECTL2			(volatile unsigned int*)0x01800010
#define CECTL3			(volatile unsigned int*)0x01800014
#define SDCTL			(volatile unsigned int*)0x01800018
#define SDTIM			(volatile unsigned int*)0x0180001C

// TIMER0
#define T0CTL			(volatile unsigned int*)0x01940000
#define T0PRD			(volatile unsigned int*)0x01940004
#define T0CNT			(volatile unsigned int*)0x01940008

// TIMER1
#define T1CTL			(volatile unsigned int*)0x01980000
#define T1PRD			(volatile unsigned int*)0x01980004
#define T1CNT			(volatile unsigned int*)0x01980008

// UARTA
#define txrx_divl		(volatile unsigned int*)0x02000000
#define inten_divh		(volatile unsigned int*)0x02000004
#define intid_fifo		(volatile unsigned int*)0x02000008
#define linecon			(volatile unsigned int*)0x0200000C
#define modemcon		(volatile unsigned int*)0x02000010
#define linestatus		(volatile unsigned int*)0x02000014
#define modemstatus		(volatile unsigned int*)0x02000018
#define scratch			(volatile unsigned int*)0x0200001C

// DSP => FPGA 
#define FPGABASE		0x02000000
#define ADDR_SHIFT(A)	(volatile unsigned int*)(FPGABASE + (A << 2))
#define DOUT0			ADDR_SHIFT(0x010)
#define DOUT1			ADDR_SHIFT(0x011)
#define DOUT2			ADDR_SHIFT(0x012)

#define FPGALED			ADDR_SHIFT(0x013)

#define PWMDRVEN		ADDR_SHIFT(0x020)
#define PWMRIGHT		ADDR_SHIFT(0x021)
#define PWMLEFT			ADDR_SHIFT(0x022)
#define ENCPOSCLR		ADDR_SHIFT(0x023)
#define STEPPER			ADDR_SHIFT(0x024)
#define BLDCEN			ADDR_SHIFT(0x025)
#define BLDC0			ADDR_SHIFT(0x026)
#define BLDC1			ADDR_SHIFT(0x027)
#define BLDC2			ADDR_SHIFT(0x028)

#define ADCMUX			ADDR_SHIFT(0x030)

#define DAC0			ADDR_SHIFT(0x032)
#define DAC1			ADDR_SHIFT(0x033)
#define DAC2			ADDR_SHIFT(0x034)
#define DAC3			ADDR_SHIFT(0x035)
#define DAC4			ADDR_SHIFT(0x036)
#define DAC5			ADDR_SHIFT(0x037)
#define DAC6			ADDR_SHIFT(0x038)
#define DAC7			ADDR_SHIFT(0x039)

// FPGA => DSP
#define FPGAVER			ADDR_SHIFT(0x0FF)

#define ADCRD			ADDR_SHIFT(0x03A)
#define BLDCHALL		ADDR_SHIFT(0x082)
#define ENCPOSR			ADDR_SHIFT(0x083)
#define ENCPOSL			ADDR_SHIFT(0x084)
#define ENCVELR			ADDR_SHIFT(0x085)
#define ENCVELL			ADDR_SHIFT(0x086)


