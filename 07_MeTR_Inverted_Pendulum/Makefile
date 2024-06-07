HEADERS = c6701.h constant.h typedef.h bss.h function.h USBMon.h Makefile
RAM_OBJS = initvec.obj
FLASH_OBJS = initvec_flash.obj copyinit.obj
COMMON_OBJS = main.obj interrupt.obj serial.obj USBMon.obj

CC_OPTION = -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 

ALL : ram
ram : temp ram_main.out
flash : temp flash_main.hex

temp :
	@mkdir temp

flash_main.hex : flash_main.out out2hex.cmd
	hex6x -q out2hex.cmd

ram_main.out : $(RAM_OBJS) $(COMMON_OBJS) RAM_lnk.cmd
	lnk6x RAM_lnk.cmd

flash_main.out : $(FLASH_OBJS) $(COMMON_OBJS) FLASH_lnk.cmd
	lnk6x FLASH_lnk.cmd

initvec.obj : initvec.asm
	cl6x -g -as -mv6701 initvec.asm

initvec_flash.obj : initvec_flash.asm
	cl6x -g -as -mv6701 initvec_flash.asm

copyinit.obj : copyinit.asm
	cl6x -g -as -mv6701 copyinit.asm

main.obj : main.c $(HEADERS)
	cl6x $(CC_OPTION) main.c

interrupt.obj : interrupt.c $(HEADERS) interrupt.h
	cl6x $(CC_OPTION) interrupt.c

serial.obj : serial.c $(HEADERS)
	cl6x $(CC_OPTION) serial.c

USBMon.obj : USBMon.c $(HEADERS)
	cl6x $(CC_OPTION) USBMon.c

clean : 
	rm -rf *.bak *.obj *.map *.out *.hex *.bin temp


