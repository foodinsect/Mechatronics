/* TMS320C6701 Linker Command file */
	initvec_flash.obj
	copyinit.obj
	main.obj
	interrupt.obj
	serial.obj
	USBMon.obj
	
	cinitstrt = 01400000h + ___etext__;
	cinitsize = 0x1000;
	idaddr = ___cinit__;

	-m flash_main.map
	-o flash_main.out
	-c
	-l rts6701.lib
	-stack 0x1000
	-heap 0x1000

MEMORY
{
	VECT  		:	origin = 00000000h, 	length = 00000200h
	IPRAM 		:	origin = 00000200h, 	length = 0000FE00h
	EXRAM 		:	origin = 00400000h, 	length = 00040000h
	CE1VECS		: 	origin = 01400000h, 	length = 00000200h
	CE1MEM		:	origin = 01400200h, 	length = 0000FE00h
	IOCE2 		:	origin = 02000000h, 	length = 00010000h
	IDRAM 		:	origin = 80000000h, 	length = 00010000h
}

SECTIONS
{
	.vector		:	load=CE1VECS,	run=VECT
	.text		:	load=CE1MEM,	run=IPRAM
	.cinit		:	load=CE1MEM,	run=IDRAM
	.const		:	load=CE1MEM,	run=IDRAM
	.switch		:	>	IDRAM
	.bss		:	>	IDRAM
	.cio		:	>	IDRAM
	.data		:	>	IDRAM
	.far		:	>	IDRAM
	.stack		:	>	IDRAM
	.sysmem		:	>	IDRAM
	.USBMON		:	>	EXRAM
}

