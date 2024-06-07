flash_main.out			/* Input COFF file(.out) for Hex Conversion Utility */
-o flash_main.hex		/* Output hex file(.hex) from Hex Conversion Utility */
-i						/* Intel Hex Format Input */
-byte					/* Byte Count in Hex file */
-image					/* Image Mode, No Addr. Break in Hex File */
-zero					/* In Image Mode, Hex File starts at address "org" shown in ROMS directive */
-memwidth 8				/* System Memory Width of the ROM region */
-romwidth 8				/* ROM Physical Width */
-order L				/* Little Endian */

ROMS
{
	EPROM:	org = 0x01400000, length = 0x10000,
			files = {flash_main.hex}
}

