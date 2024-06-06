		.ref	cinitstrt
		.ref	cinitsize
		.ref	idaddr
		.ref	_c_int00
		.def	_start

		.text
_start:
		mvkl	cinitstrt, a4
		mvkh	cinitstrt, a4
		mvkl	idaddr, a6
		mvkh	idaddr, a6
		mvk		cinitsize, a1
		mvkh	cinitsize, a1

loop:
 [!a1]	b		done
		ldw		*a4++, b3
		nop		4
		; branch occurs
		stw		b3, *a6++
		sub		a1, 4, a1
		b		loop
		nop		5
		; branch occurs

done:
		MVKL	_c_int00,B0
		MVKH	_c_int00,B0
		B		.S2	B0
		nop		5
		
