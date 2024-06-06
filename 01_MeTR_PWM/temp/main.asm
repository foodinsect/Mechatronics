;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Wed Jun 05 15:56:50 2024                                *
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

;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\opqrs\AppData\Local\Temp\TI22392_2 --template_info_file C:\Users\opqrs\AppData\Local\Temp\TI22392_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
	.sect	".text"
	.global	_InitEXINTF

;******************************************************************************
;* FUNCTION NAME: _InitEXINTF                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,B4,B5,B6                                    *
;*   Regs Used         : A0,A3,A4,B3,B4,B5,B6                                 *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_InitEXINTF:
;** --------------------------------------------------------------------------*
           ZERO    .D1     A0                ; |18| 
           MVKH    .S1     0x1800000,A0      ; |18| 
           LDW     .D1T1   *A0,A4            ; |18| 
           MVKL    .S2     0x1800008,B5      ; |21| 
           MVKL    .S2     0x21520521,B6     ; |33| 
           B       .S2     B3                ; |43| 

           MVKL    .S2     0x1800010,B4      ; |33| 
||         MVKL    .S1     0xd00321,A3       ; |21| 

           CLR     .S1     A4,3,5,A4         ; |18| 
||         MVKH    .S2     0x1800008,B5      ; |21| 

           STW     .D1T1   A4,*A0            ; |18| 
||         MVKH    .S2     0x21520521,B6     ; |33| 
||         MVKH    .S1     0xd00321,A3       ; |21| 

           STW     .D2T1   A3,*B5            ; |21| 
||         MVKH    .S2     0x1800010,B4      ; |33| 

           STW     .D2T2   B6,*B4            ; |33| 
           ; BRANCH OCCURS                   ; |43| 


	.sect	".text"
	.global	_InitTimer

;******************************************************************************
;* FUNCTION NAME: _InitTimer                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A3,B4,B5                                          *
;*   Regs Used         : A0,A3,B3,B4,B5                                       *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_InitTimer:
;** --------------------------------------------------------------------------*
           ZERO    .D2     B4                ; |48| 
           MVKH    .S2     0x1940000,B4      ; |48| 
           LDW     .D2T2   *B4,B5            ; |48| 
           MVKL    .S1     0x1940004,A0      ; |51| 
           MVKH    .S1     0x1940004,A0      ; |51| 
           ZERO    .D1     A3                ; |54| 
           MVKH    .S1     0x1940000,A3      ; |54| 
           SET     .S2     B5,8,9,B5         ; |48| 

           MVK     .S2     20000,B4          ; |51| 
||         STW     .D2T2   B5,*B4            ; |48| 

           STW     .D1T2   B4,*A0            ; |51| 
           LDW     .D1T1   *A3,A0            ; |54| 
           B       .S2     B3                ; |55| 
           NOP             3
           SET     .S1     A0,6,7,A0         ; |54| 
           STW     .D1T1   A0,*A3            ; |54| 
           ; BRANCH OCCURS                   ; |55| 


	.sect	".text"
	.global	_InitINT

;******************************************************************************
;* FUNCTION NAME: _InitINT                                                    *
;*                                                                            *
;*   Regs Modified     : A0,B4                                                *
;*   Regs Used         : A0,B3,B4                                             *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_InitINT:
;** --------------------------------------------------------------------------*
           MVC     .S2     IER,B4            ; |60| 
           MVK     .S1     16450,A0          ; |60| 
           OR      .S2X    A0,B4,B4          ; |60| 
           MVC     .S2     B4,IER            ; |60| 
           B       .S2     B3                ; |61| 
           NOP             5
           ; BRANCH OCCURS                   ; |61| 


	.sect	".text"
	.global	_GIE

;******************************************************************************
;* FUNCTION NAME: _GIE                                                        *
;*                                                                            *
;*   Regs Modified     : B4                                                   *
;*   Regs Used         : B3,B4                                                *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_GIE:
;** --------------------------------------------------------------------------*
           MVC     .S2     CSR,B4            ; |66| 
           OR      .S2     1,B4,B4           ; |66| 
           MVC     .S2     B4,CSR            ; |66| 
           B       .S2     B3                ; |67| 
           NOP             5
           ; BRANCH OCCURS                   ; |67| 


	.sect	".text"
	.global	_delay_us

;******************************************************************************
;* FUNCTION NAME: _delay_us                                                   *
;*                                                                            *
;*   Regs Modified     : B0,B4,B5,B6,SP                                       *
;*   Regs Used         : A4,B0,B3,B4,B5,B6,SP                                 *
;*   Local Frame Size  : 0 Args + 4 Auto + 0 Save = 4 byte                    *
;******************************************************************************
_delay_us:
;** --------------------------------------------------------------------------*
           MV      .S2X    A4,B4             ; |71| 
           SHL     .S2     B4,4,B5           ; |74| 

           ZERO    .S2     B4                ; |74| 
||         SUBAH   .D2     B5,B4,B5          ; |74| 

           CMPLTU  .L2     B4,B5,B0          ; |74| 
   [!B0]   B       .S1     L2                ; |74| 
           SUB     .D2     SP,8,SP           ; |71| 
           STW     .D2T1   A4,*+SP(4)        ; |71| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |74| 
           NOP             2
           ; BRANCH OCCURS                   ; |74| 
;** --------------------------------------------------------------------------*
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
           SHL     .S2     B5,4,B6           ; |74| 

           SUBAH   .D2     B6,B5,B5          ; |74| 
||         ADD     .S2     1,B4,B4           ; |74| 

           CMPLTU  .L2     B4,B5,B0          ; |74| 
   [ B0]   B       .S1     L1                ; |74| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |74| 
           NOP             4
           ; BRANCH OCCURS                   ; |74| 
;** --------------------------------------------------------------------------*
L2:    
           B       .S2     B3                ; |75| 
           ADD     .D2     8,SP,SP           ; |75| 
           NOP             4
           ; BRANCH OCCURS                   ; |75| 


	.sect	".text"
	.global	_delay_ms

;******************************************************************************
;* FUNCTION NAME: _delay_ms                                                   *
;*                                                                            *
;*   Regs Modified     : A4,B0,B3,B4,B5,B6,B7,B9,SP                           *
;*   Regs Used         : A4,B0,B3,B4,B5,B6,B7,B9,SP                           *
;*   Local Frame Size  : 0 Args + 4 Auto + 0 Save = 4 byte                    *
;******************************************************************************
_delay_ms:
;** --------------------------------------------------------------------------*
           ZERO    .D2     B7                ; |82| 
           CMPLTU  .L2X    B7,A4,B0
   [!B0]   B       .S1     L4                ; |82| 
           SUB     .D2     SP,8,SP           ; |79| 
           STW     .D2T1   A4,*+SP(4)        ; |79| 
           MV      .L2     B3,B9             ; |79| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |83| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |83| 
           ; BRANCH OCCURS                   ; |82| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L3:    
           B       .S2     B4                ; |83| 
           MVKL    .S2     RL0,B3            ; |83| 
           MVKH    .S2     RL0,B3            ; |83| 
           MVK     .S1     0x3e8,A4          ; |83| 
           NOP             2
RL0:       ; CALL OCCURS                     ; |83| 
           LDW     .D2T2   *+SP(4),B4        ; |84| 
           ADD     .D2     1,B7,B7           ; |84| 
           NOP             3
           CMPLTU  .L2     B7,B4,B0          ; |84| 
   [ B0]   B       .S1     L3                ; |84| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |83| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |83| 
           NOP             3
           ; BRANCH OCCURS                   ; |84| 
;** --------------------------------------------------------------------------*
L4:    
           B       .S2     B9                ; |85| 
           ADD     .D2     8,SP,SP           ; |85| 
           NOP             4
           ; BRANCH OCCURS                   ; |85| 


	.sect	".text"
	.global	_WaitTFlag

;******************************************************************************
;* FUNCTION NAME: _WaitTFlag                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3                                             *
;*   Regs Used         : A0,A1,A3,B3                                          *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_WaitTFlag:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _TFlag,A0         ; |90| 
           MVKH    .S1     _TFlag,A0         ; |90| 
           LDW     .D1T1   *A0,A1            ; |90| 
           NOP             4
   [ A1]   B       .S1     L6                ; |90| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |90| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |90| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |90| 
           NOP             2
           ; BRANCH OCCURS                   ; |90| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    
           NOP             2
   [!A1]   B       .S1     L5                ; |90| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |90| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |90| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |90| 
           NOP             2
           ; BRANCH OCCURS                   ; |90| 
;** --------------------------------------------------------------------------*
L6:    
           B       .S2     B3                ; |92| 
           MVKL    .S1     _TFlag,A0         ; |91| 
           MVKH    .S1     _TFlag,A0         ; |91| 
           ZERO    .D1     A3                ; |91| 
           STW     .D1T1   A3,*A0            ; |91| 
           NOP             1
           ; BRANCH OCCURS                   ; |92| 


	.sect	".text"
	.global	_WaitTFlagCnt

;******************************************************************************
;* FUNCTION NAME: _WaitTFlagCnt                                               *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,B0,B3,B4,B5,B9,SP                           *
;*   Regs Used         : A0,A1,A3,A4,B0,B3,B4,B5,B9,SP                        *
;*   Local Frame Size  : 0 Args + 8 Auto + 0 Save = 8 byte                    *
;******************************************************************************
_WaitTFlagCnt:
;** --------------------------------------------------------------------------*

           SUB     .D2     SP,8,SP           ; |96| 
||         MVKL    .S1     _TFlag,A0         ; |99| 

           STW     .D2T1   A4,*+SP(4)        ; |96| 
||         MVKH    .S1     _TFlag,A0         ; |99| 
||         ZERO    .D1     A3                ; |99| 

           STW     .D1T1   A3,*A0            ; |99| 
           LDW     .D2T2   *+SP(4),B5        ; |101| 
           ZERO    .D2     B4                ; |101| 
           STW     .D2T2   B4,*+SP(8)        ; |101| 
           MV      .S2     B3,B9             ; |96| 
           NOP             1
           CMPLTU  .L2     B4,B5,B0          ; |101| 
   [!B0]   B       .S1     L8                ; |101| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |102| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |102| 
           NOP             3
           ; BRANCH OCCURS                   ; |101| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
           B       .S2X    A0                ; |102| 
           MVKL    .S2     RL2,B3            ; |102| 
           MVKH    .S2     RL2,B3            ; |102| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |102| 
           LDW     .D2T2   *+SP(8),B4        ; |103| 
           LDW     .D2T2   *+SP(4),B5        ; |103| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |103| 
           CMPLTU  .L2     B4,B5,B0          ; |103| 
   [ B0]   B       .S1     L7                ; |103| 
           STW     .D2T2   B4,*+SP(8)        ; |103| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |102| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |102| 
           NOP             2
           ; BRANCH OCCURS                   ; |103| 
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B9                ; |104| 
           ADD     .D2     8,SP,SP           ; |104| 
           NOP             4
           ; BRANCH OCCURS                   ; |104| 


	.sect	".text"
	.global	_PWMOut

;******************************************************************************
;* FUNCTION NAME: _PWMOut                                                     *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 8 Auto + 4 Save = 12 byte                   *
;******************************************************************************
_PWMOut:
;** --------------------------------------------------------------------------*
           MV      .S2X    A4,B4             ; |114| 
           SPDP    .S2     B4,B5:B4          ; |133| 
           ZERO    .D2     B6                ; |133| 
           MVKL    .S2     0xc048c000,B7     ; |133| 
           MVKH    .S2     0xc048c000,B7     ; |133| 

           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |133| 
||         ZERO    .D1     A0                ; |134| 
||         STW     .D2T2   B3,*SP--(16)      ; |114| 

           STW     .D2T1   A4,*+SP(4)        ; |114| 
||         MVKH    .S1     0xc2460000,A0     ; |134| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |134| 
           LDW     .D2T2   *+SP(4),B4        ; |136| 
           MVKL    .S1     0x4048c000,A1     ; |136| 
           ZERO    .D1     A0                ; |136| 
           MVKL    .S2     RL4,B3            ; |141| 
           MVKH    .S2     RL4,B3            ; |141| 
           SPDP    .S2     B4,B5:B4          ; |136| 
           MVKH    .S1     0x4048c000,A1     ; |136| 
           CMPGTDP .S1X    B5:B4,A1:A0,A1    ; |136| 
           MVKL    .S2     __divd,B8         ; |141| 
           MVKH    .S1     0x42460000,A0     ; |137| 
   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |137| 
           LDW     .D2T2   *+SP(4),B4        ; |141| 
           ZERO    .D1     A0                ; |141| 
           MVKH    .S1     0x42480000,A0     ; |141| 
           MVKH    .S2     __divd,B8         ; |141| 
           NOP             1
           ADDSP   .L2X    A0,B4,B5          ; |141| 
           MVKL    .S2     0x457ff000,B4     ; |141| 
           MVKH    .S2     0x457ff000,B4     ; |141| 
           NOP             1
           MPYSP   .M2     B4,B5,B4          ; |141| 
           ZERO    .D2     B5                ; |141| 
           MVKH    .S2     0x40590000,B5     ; |141| 
           B       .S2     B8                ; |141| 
           SPDP    .S2     B4,B7:B6          ; |141| 
           ZERO    .D2     B4                ; |141| 
           MV      .S1X    B6,A4             ; |141| 
           NOP             1
           MV      .S1X    B7,A5             ; |141| 
RL4:       ; CALL OCCURS                     ; |141| 
           DPSP    .L1     A5:A4,A0          ; |141| 
           NOP             3
           MV      .S2X    A0,B4             ; |141| 
           SPTRUNC .L2     B4,B4             ; |143| 
           STW     .D2T1   A0,*+SP(8)        ; |141| 
           MVKL    .S1     0x2000084,A0      ; |143| 
           MVKH    .S1     0x2000084,A0      ; |143| 
           STW     .D1T2   B4,*A0            ; |143| 
           LDW     .D2T1   *+SP(4),A4        ; |145| 
           LDW     .D2T2   *++SP(16),B3      ; |146| 
           NOP             4
           B       .S2     B3                ; |146| 
           NOP             5
           ; BRANCH OCCURS                   ; |146| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 16 Args + 0 Auto + 4 Save = 20 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |154| 
           MVKH    .S1     _InitEXINTF,A0    ; |154| 
           B       .S2X    A0                ; |154| 
           STW     .D2T2   B3,*SP--(24)      ; |153| 
           MVKL    .S2     RL6,B3            ; |154| 
           MVKH    .S2     RL6,B3            ; |154| 
           NOP             2
RL6:       ; CALL OCCURS                     ; |154| 
           MVKL    .S1     _InitTimer,A0     ; |155| 
           MVKH    .S1     _InitTimer,A0     ; |155| 
           B       .S2X    A0                ; |155| 
           MVKL    .S2     RL8,B3            ; |155| 
           MVKH    .S2     RL8,B3            ; |155| 
           NOP             3
RL8:       ; CALL OCCURS                     ; |155| 
           MVKL    .S2     _InitUART,B4      ; |156| 
           MVKH    .S2     _InitUART,B4      ; |156| 
           B       .S2     B4                ; |156| 
           MVKL    .S2     RL10,B3           ; |156| 
           MVKH    .S2     RL10,B3           ; |156| 
           NOP             3
RL10:      ; CALL OCCURS                     ; |156| 
           MVKL    .S1     _InitINT,A0       ; |157| 
           MVKH    .S1     _InitINT,A0       ; |157| 
           B       .S2X    A0                ; |157| 
           MVKL    .S2     RL12,B3           ; |157| 
           MVKH    .S2     RL12,B3           ; |157| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |157| 
           MVKL    .S1     _InitUSBMon,A0    ; |158| 
           MVKH    .S1     _InitUSBMon,A0    ; |158| 
           B       .S2X    A0                ; |158| 
           MVKL    .S2     RL14,B3           ; |158| 
           MVKH    .S2     RL14,B3           ; |158| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |158| 
           MVKL    .S1     _sprintf,A0       ; |160| 

           MVKH    .S1     _sprintf,A0       ; |160| 
||         MVKL    .S2     SL1+0,B5          ; |160| 

           B       .S2X    A0                ; |160| 
           MVKL    .S2     RL16,B3           ; |160| 
           MVKH    .S2     SL1+0,B5          ; |160| 
           MVKL    .S2     _tmp_string,B4    ; |160| 
           MVKH    .S2     _tmp_string,B4    ; |160| 

           MVKH    .S2     RL16,B3           ; |160| 
||         STW     .D2T2   B5,*+SP(4)        ; |160| 
||         MV      .S1X    B4,A4             ; |160| 

RL16:      ; CALL OCCURS                     ; |160| 
           MVKL    .S1     _Report,A0        ; |160| 
           MVKH    .S1     _Report,A0        ; |160| 
           B       .S2X    A0                ; |160| 
           MVKL    .S2     RL18,B3           ; |160| 
           MVKH    .S2     RL18,B3           ; |160| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |160| 
           MVK     .S1     2024,A0           ; |161| 

           MVKL    .S1     _sprintf,A0       ; |161| 
||         STW     .D2T1   A0,*+SP(8)        ; |161| 

           MVKH    .S1     _sprintf,A0       ; |161| 
||         MVKL    .S2     _tmp_string,B5    ; |161| 

           B       .S2X    A0                ; |161| 
           MVKL    .S2     SL2+0,B4          ; |161| 
           MVKH    .S2     _tmp_string,B5    ; |161| 
           MVKH    .S2     SL2+0,B4          ; |161| 
           MVKL    .S2     RL20,B3           ; |161| 

           MVKH    .S2     RL20,B3           ; |161| 
||         STW     .D2T2   B4,*+SP(4)        ; |161| 
||         MV      .S1X    B5,A4             ; |161| 

RL20:      ; CALL OCCURS                     ; |161| 
           MVKL    .S1     _Report,A0        ; |161| 
           MVKH    .S1     _Report,A0        ; |161| 
           B       .S2X    A0                ; |161| 
           MVKL    .S2     RL22,B3           ; |161| 
           MVKH    .S2     RL22,B3           ; |161| 
           NOP             3
RL22:      ; CALL OCCURS                     ; |161| 
           MVKL    .S2     SL3+0,B4          ; |162| 
           MVKL    .S2     0x20003fc,B5      ; |162| 
           MVKH    .S2     SL3+0,B4          ; |162| 

           STW     .D2T2   B4,*+SP(4)        ; |162| 
||         MVKH    .S2     0x20003fc,B5      ; |162| 

           LDW     .D2T2   *B5,B4            ; |162| 
           MVKL    .S1     0x20003fc,A0      ; |162| 
           MVKH    .S1     0x20003fc,A0      ; |162| 
           MVKL    .S1     _tmp_string,A4    ; |162| 
           MVKL    .S2     RL24,B3           ; |162| 
           EXTU    .S2     B4,16,24,B4       ; |162| 
           STW     .D2T2   B4,*+SP(8)        ; |162| 

           MVKL    .S1     _sprintf,A0       ; |162| 
||         LDW     .D1T1   *A0,A3            ; |162| 

           MVKH    .S1     _sprintf,A0       ; |162| 
           B       .S2X    A0                ; |162| 
           MVKH    .S1     _tmp_string,A4    ; |162| 
           MVKH    .S2     RL24,B3           ; |162| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |162| 
           STW     .D2T1   A3,*+SP(12)       ; |162| 
RL24:      ; CALL OCCURS                     ; |162| 
           MVKL    .S1     _Report,A0        ; |162| 
           MVKH    .S1     _Report,A0        ; |162| 
           B       .S2X    A0                ; |162| 
           MVKL    .S2     RL26,B3           ; |162| 
           MVKH    .S2     RL26,B3           ; |162| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |162| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |166| 
           MVKH    .S1     _GIE,A0           ; |166| 
           B       .S2X    A0                ; |166| 
           MVKL    .S2     _TFlag,B4         ; |164| 
           MVKL    .S2     RL28,B3           ; |166| 
           MVKH    .S2     _TFlag,B4         ; |164| 
           ZERO    .D2     B5                ; |164| 

           STW     .D2T2   B5,*B4            ; |164| 
||         MVKH    .S2     RL28,B3           ; |166| 

RL28:      ; CALL OCCURS                     ; |166| 

           MVKL    .S1     _WaitTFlagCnt,A0  ; |172| 
||         MVK     .S2     1,B6              ; |169| 

           MVKL    .S2     0x200004c,B5      ; |168| 
||         MVKH    .S1     _WaitTFlagCnt,A0  ; |172| 

           B       .S2X    A0                ; |172| 

           MVKH    .S2     0x200004c,B5      ; |168| 
||         MVK     .S1     1,A5              ; |168| 

           MVKL    .S2     0x2000084,B4      ; |170| 
||         MVKL    .S1     0x2000080,A4      ; |169| 

           MVKL    .S2     RL30,B3           ; |172| 
||         STW     .D2T1   A5,*B5            ; |168| 
||         MVKH    .S1     0x2000080,A4      ; |169| 

           STW     .D1T2   B6,*A4            ; |169| 
||         MVKH    .S2     0x2000084,B4      ; |170| 
||         MVK     .S1     2048,A3           ; |170| 

           STW     .D2T1   A3,*B4            ; |170| 
||         MVK     .S1     0x64,A4           ; |172| 
||         MVKH    .S2     RL30,B3           ; |172| 

RL30:      ; CALL OCCURS                     ; |172| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L9:    
           B       .S1     L9                ; |176| 
           NOP             5
           ; BRANCH OCCURS                   ; |176| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	__divd
