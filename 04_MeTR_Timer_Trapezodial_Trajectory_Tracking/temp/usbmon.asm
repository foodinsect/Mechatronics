;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Thu Jun 06 13:47:20 2024                                *
;******************************************************************************

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C670x                                          *
;*   Optimization      : Disabled                                             *
;*   Optimizing for    : Compile time, Ease of Development                    *
;*                       Based on options: no -o, no -ms                      *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Memory Model      : Large                                                *
;*   Calls to RTS      : Far                                                  *
;*   Pipelining        : Disabled                                             *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : No Debug Info                                        *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss

	.global	_USBMonStuff
_USBMonStuff:	.usect	".USBMON",32780,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\opqrs\AppData\Local\Temp\TI7716_2 --template_info_file C:\Users\opqrs\AppData\Local\Temp\TI7716_3 --object_file usbmon.obj --opt_shell 9 usbmon.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 usbmon.c 
	.sect	".text"
	.global	_InitUSBMon

;******************************************************************************
;* FUNCTION NAME: _InitUSBMon                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A3,B4,B5                                          *
;*   Regs Used         : A0,A3,B3,B4,B5                                       *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_InitUSBMon:
;** --------------------------------------------------------------------------*
           B       .S2     B3                ; |18| 
           MVKL    .S1     _USBMonStuff,A0   ; |15| 

           MVKH    .S1     _USBMonStuff,A0   ; |15| 
||         MVKL    .S2     _USBMonStuff+4,B4 ; |16| 
||         ZERO    .D1     A3                ; |15| 

           MVKL    .S1     _USBMonStuff+8,A0 ; |17| 
||         STW     .D1T1   A3,*A0            ; |15| 
||         MVKH    .S2     _USBMonStuff+4,B4 ; |16| 
||         ZERO    .D2     B5                ; |16| 

           STW     .D2T2   B5,*B4            ; |16| 
||         MVKH    .S1     _USBMonStuff+8,A0 ; |17| 

           STW     .D1T1   A3,*A0            ; |17| 
           ; BRANCH OCCURS                   ; |18| 


	.sect	".text"
	.global	_UMAddData

;******************************************************************************
;* FUNCTION NAME: _UMAddData                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,B0,B4,B5,B6,B7,SP                           *
;*   Regs Used         : A0,A3,A4,A6,B0,B3,B4,B5,B6,B7,SP                     *
;*   Local Frame Size  : 0 Args + 24 Auto + 0 Save = 24 byte                  *
;******************************************************************************
_UMAddData:
;** --------------------------------------------------------------------------*
           SUB     .D2     SP,24,SP          ; |21| 
           STW     .D2T2   B6,*+SP(16)       ; |21| 

           STW     .D2T1   A6,*+SP(12)       ; |21| 
||         MV      .S1X    B4,A0             ; |21| 

           MVKL    .S1     _USBMonStuff+4,A0 ; |25| 
||         STW     .D2T1   A0,*+SP(8)        ; |21| 
||         MV      .S2X    A4,B4             ; |21| 

           MVKH    .S1     _USBMonStuff+4,A0 ; |25| 
||         STW     .D2T2   B4,*+SP(4)        ; |21| 

           LDW     .D1T1   *A0,A3            ; |25| 
           MVKL    .S1     _USBMonStuff+8,A0 ; |26| 
           MVKH    .S1     _USBMonStuff+8,A0 ; |26| 
           NOP             2
           STW     .D2T1   A3,*+SP(20)       ; |25| 
           LDW     .D1T1   *A0,A0            ; |26| 
           LDW     .D2T1   *+SP(20),A3       ; |28| 
           NOP             3
           STW     .D2T1   A0,*+SP(24)       ; |26| 
           LDW     .D2T2   *+SP(24),B5       ; |28| 
           MVKL    .S1     _USBMonStuff+12,A0 ; |28| 
           MVKH    .S1     _USBMonStuff+12,A0 ; |28| 
           NOP             2
           SHL     .S1X    B5,12,A4          ; |28| 
           ADDAW   .D1     A4,A3,A3          ; |28| 
           ADD     .D1     A0,A3,A0          ; |28| 
           STW     .D1T2   B4,*A0            ; |28| 
           LDW     .D2T2   *+SP(24),B4       ; |29| 
           LDW     .D2T1   *+SP(20),A0       ; |29| 
           LDW     .D2T2   *+SP(8),B5        ; |29| 
           NOP             2

           MVKL    .S2     _USBMonStuff+8204,B4 ; |29| 
||         SHL     .S1X    B4,12,A3          ; |29| 

           ADDAW   .D1     A3,A0,A0          ; |29| 
||         MVKH    .S2     _USBMonStuff+8204,B4 ; |29| 

           ADD     .S1X    B4,A0,A0          ; |29| 
           STW     .D1T2   B5,*A0            ; |29| 
           LDW     .D2T2   *+SP(24),B4       ; |30| 
           LDW     .D2T1   *+SP(20),A4       ; |30| 
           LDW     .D2T2   *+SP(12),B5       ; |30| 
           MVKL    .S1     _USBMonStuff+16396,A3 ; |30| 
           MVKH    .S1     _USBMonStuff+16396,A3 ; |30| 
           SHL     .S1X    B4,12,A0          ; |30| 
           ADDAW   .D1     A0,A4,A0          ; |30| 
           ADD     .D1     A3,A0,A0          ; |30| 
           STW     .D1T2   B5,*A0            ; |30| 
           LDW     .D2T2   *+SP(24),B6       ; |31| 
           LDW     .D2T2   *+SP(20),B5       ; |31| 
           LDW     .D2T2   *+SP(16),B7       ; |31| 
           MVKL    .S2     _USBMonStuff+24588,B4 ; |31| 
           MVKH    .S2     _USBMonStuff+24588,B4 ; |31| 
           SHL     .S2     B6,12,B6          ; |31| 
           ADDAW   .D2     B6,B5,B5          ; |31| 

           ADD     .D2     B4,B5,B4          ; |31| 
||         MVKL    .S1     _USBMonStuff+4,A0 ; |33| 

           MVKH    .S1     _USBMonStuff+4,A0 ; |33| 
||         STW     .D2T2   B7,*B4            ; |31| 

           LDW     .D1T1   *A0,A3            ; |33| 
           MVK     .S2     1000,B4           ; |35| 
           NOP             3

           MVKL    .S1     _USBMonStuff+4,A3 ; |35| 
||         ADD     .D1     1,A3,A4           ; |33| 

           STW     .D1T1   A4,*A0            ; |33| 
||         MVKH    .S1     _USBMonStuff+4,A3 ; |35| 

           LDW     .D1T1   *A3,A0            ; |35| 
           NOP             4
           CMPLTU  .L2X    A0,B4,B0          ; |35| 
   [ B0]   B       .S1     L1                ; |35| 
           MVKL    .S1     _USBMonStuff+4,A3 ; |36| 

           ZERO    .D1     A0                ; |36| 
||         MVKH    .S1     _USBMonStuff+4,A3 ; |36| 

   [!B0]   STW     .D1T1   A0,*A3            ; |36| 
   [!B0]   LDW     .D2T2   *+SP(24),B0       ; |37| 
           NOP             1
           ; BRANCH OCCURS                   ; |35| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _USBMonStuff+8,B5 ; |38| 
           MVKL    .S2     _USBMonStuff+8,B4 ; |41| 

           MVK     .S1     1,A3              ; |41| 
||         MVKH    .S2     _USBMonStuff+8,B5 ; |38| 
||         ZERO    .D2     B6                ; |38| 

   [ B0]   STW     .D2T2   B6,*B5            ; |38| 
||         MVKH    .S2     _USBMonStuff+8,B4 ; |41| 
||         MVKL    .S1     _USBMonStuff,A0   ; |43| 

           MVK     .S2     4000,B4           ; |43| 
|| [!B0]   STW     .D2T1   A3,*B4            ; |41| 
||         MVKH    .S1     _USBMonStuff,A0   ; |43| 

           STW     .D1T2   B4,*A0            ; |43| 
;** --------------------------------------------------------------------------*
L1:    
           B       .S2     B3                ; |45| 
           ADDK    .S2     24,SP             ; |45| 
           NOP             4
           ; BRANCH OCCURS                   ; |45| 


