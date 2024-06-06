		.global	_start
;		.global	_c_int00
		.global _ISRNMI
		.global	_ISRextint4
		.global	_ISRextint5
		.global	_ISRextint6
		.global	_c_int08
		.global	_c_int09
		.global	_ISRtimer0
		.text

		.sect	".vector"
RESET:	MVKL	_start,B0
		MVKH	_start,B0
		B		.S2	B0
		NOP
		NOP
		NOP
		NOP
		NOP

NMI:	B		_ISRNMI
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
RSVD:
		.space	64

INT4:	B		_ISRextint4
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP

INT5:	B		_ISRextint5
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP

INT6:	B		_ISRextint6
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP

INT7:
		.space	32
INT8:	B		_c_int08
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP

INT9:	B		_c_int09
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP

INT10:	
		.space 	32
INT11:
		.space	32
INT12:
		.space	32
INT13:
		.space	32
		
INT14:	B		_ISRtimer0
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP

INT15:			
		.space	32

