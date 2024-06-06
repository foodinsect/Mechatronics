;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Fri Apr 05 16:22:05 2024                                *
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

	.global	_TINTCnt
_TINTCnt:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_timerCheckCnt+0,32
	.field  	0,32			; _timerCheckCnt @ 0
	.sect	".text"
	.global	_timerCheckCnt
_timerCheckCnt:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_overshoot+0,32
	.word	000000000h		; _overshoot @ 0
	.sect	".text"
	.global	_overshoot
_overshoot:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_overshootPercent+0,32
	.word	000000000h		; _overshootPercent @ 0
	.sect	".text"
	.global	_overshootPercent
_overshootPercent:	.usect	.far,4,4
	.global	_currPos
_currPos:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_R+0,32
	.word	043340000h		; _R @ 0
	.sect	".text"
	.global	_R
_R:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\user\AppData\Local\Temp\TI2468_2 --template_info_file C:\Users\user\AppData\Local\Temp\TI2468_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           MV      .S2X    A4,B4             ; |107| 
           SPDP    .S2     B4,B5:B4          ; |110| 
           ZERO    .D2     B7                ; |110| 

           MVKH    .S2     0xc0490000,B7     ; |110| 
||         ZERO    .D2     B6                ; |110| 

           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |110| 
           STW     .D2T2   B3,*SP--(16)      ; |107| 
           ZERO    .S2     B4                ; |111| 

           MVKH    .S2     0xc2480000,B4     ; |111| 
||         STW     .D2T1   A4,*+SP(4)        ; |107| 

   [ B0]   STW     .D2T2   B4,*+SP(4)        ; |111| 
           LDW     .D2T2   *+SP(4),B4        ; |114| 
           ZERO    .D1     A1                ; |114| 
           MVKH    .S1     0x40490000,A1     ; |114| 
           MVKL    .S2     RL4,B3            ; |117| 
           MVKH    .S2     RL4,B3            ; |117| 
           SPDP    .S2     B4,B5:B4          ; |114| 
           ZERO    .D1     A0                ; |114| 
           CMPGTDP .S1X    B5:B4,A1:A0,A1    ; |114| 
           MVKH    .S2     0x42480000,B6     ; |115| 
   [ A1]   STW     .D2T2   B6,*+SP(4)        ; |115| 
           LDW     .D2T2   *+SP(4),B4        ; |117| 
           MVKH    .S1     0x42480000,A0     ; |117| 
           NOP             3
           ADDSP   .L2X    A0,B4,B5          ; |117| 
           MVKL    .S2     0x457ff000,B4     ; |117| 
           MVKH    .S2     0x457ff000,B4     ; |117| 
           MVKL    .S1     __divd,A0         ; |117| 
           MPYSP   .M2     B4,B5,B4          ; |117| 
           MVKH    .S1     __divd,A0         ; |117| 
           ZERO    .D2     B5                ; |117| 
           B       .S2X    A0                ; |117| 
           SPDP    .S2     B4,B7:B6          ; |117| 
           ZERO    .D2     B4                ; |117| 
           NOP             1
           MV      .S1X    B7,A5             ; |117| 

           MVKH    .S2     0x40590000,B5     ; |117| 
||         MV      .S1X    B6,A4             ; |117| 

RL4:       ; CALL OCCURS                     ; |117| 
           DPSP    .L1     A5:A4,A0          ; |117| 
           NOP             3
           MV      .S2X    A0,B4             ; |117| 
           SPTRUNC .L2     B4,B4             ; |119| 
           STW     .D2T1   A0,*+SP(8)        ; |117| 
           MVKL    .S1     0x2000084,A0      ; |119| 
           MVKH    .S1     0x2000084,A0      ; |119| 
           STW     .D1T2   B4,*A0            ; |119| 
           LDW     .D2T1   *+SP(4),A4        ; |121| 
           LDW     .D2T2   *++SP(16),B3      ; |122| 
           NOP             4
           B       .S2     B3                ; |122| 
           NOP             5
           ; BRANCH OCCURS                   ; |122| 


	.sect	".text"
	.global	_GetAngle

;******************************************************************************
;* FUNCTION NAME: _GetAngle                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,B4,B5,B6,SP                              *
;*   Regs Used         : A0,A1,A3,A4,B3,B4,B5,B6,SP                           *
;*   Local Frame Size  : 0 Args + 12 Auto + 0 Save = 12 byte                  *
;******************************************************************************
_GetAngle:
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x200020c,B4      ; |130| 
           MVKH    .S2     0x200020c,B4      ; |130| 
           LDW     .D2T2   *B4,B4            ; |130| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |130| 
||         ZERO    .D1     A0                ; |134| 
||         MVK     .S1     32767,A3          ; |133| 
||         SUB     .D2     SP,16,SP          ; |124| 

           STW     .D2T2   B4,*+SP(4)        ; |130| 
||         CMPGT   .L1X    B4,A3,A1
||         MV      .S2     B4,B6             ; |130| 
||         MVKH    .S1     0x10000,A0        ; |134| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |133| 
||         SUB     .L2X    B4,A0,B4          ; |134| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |134| 
           LDW     .D2T2   *+SP(8),B4        ; |137| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |137| 
           NOP             2
           ZERO    .D1     A1                ; |137| 

           MVKH    .S1     0x3fb80000,A1     ; |137| 
||         ZERO    .D1     A0                ; |137| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |137| 
           NOP             8
           B       .S2     B3                ; |139| 
           DPSP    .L1     A1:A0,A0          ; |137| 
           NOP             3

           ADDK    .S2     16,SP             ; |139| 
||         STW     .D2T1   A0,*+SP(12)       ; |137| 
||         MV      .D1     A0,A4             ; |137| 

           ; BRANCH OCCURS                   ; |139| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 24 Args + 0 Auto + 4 Save = 28 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |150| 
           MVKH    .S1     _InitEXINTF,A0    ; |150| 
           B       .S2X    A0                ; |150| 
           STW     .D2T2   B3,*SP--(32)      ; |149| 
           MVKL    .S2     RL8,B3            ; |150| 
           MVKH    .S2     RL8,B3            ; |150| 
           NOP             2
RL8:       ; CALL OCCURS                     ; |150| 
           MVKL    .S1     _InitTimer,A0     ; |151| 
           MVKH    .S1     _InitTimer,A0     ; |151| 
           B       .S2X    A0                ; |151| 
           MVKL    .S2     RL10,B3           ; |151| 
           MVKH    .S2     RL10,B3           ; |151| 
           NOP             3
RL10:      ; CALL OCCURS                     ; |151| 
           MVKL    .S2     _InitUART,B4      ; |152| 
           MVKH    .S2     _InitUART,B4      ; |152| 
           B       .S2     B4                ; |152| 
           MVKL    .S2     RL12,B3           ; |152| 
           MVKH    .S2     RL12,B3           ; |152| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |152| 
           MVKL    .S1     _InitINT,A0       ; |153| 
           MVKH    .S1     _InitINT,A0       ; |153| 
           B       .S2X    A0                ; |153| 
           MVKL    .S2     RL14,B3           ; |153| 
           MVKH    .S2     RL14,B3           ; |153| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |153| 
           MVKL    .S1     _InitUSBMon,A0    ; |154| 
           MVKH    .S1     _InitUSBMon,A0    ; |154| 
           B       .S2X    A0                ; |154| 
           MVKL    .S2     RL16,B3           ; |154| 
           MVKH    .S2     RL16,B3           ; |154| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |154| 
           MVKL    .S1     _sprintf,A0       ; |156| 

           MVKH    .S1     _sprintf,A0       ; |156| 
||         MVKL    .S2     _tmp_string,B5    ; |156| 

           B       .S2X    A0                ; |156| 
           MVKL    .S2     RL18,B3           ; |156| 
           MVKH    .S2     _tmp_string,B5    ; |156| 
           MVKL    .S2     SL1+0,B4          ; |156| 
           MVKH    .S2     SL1+0,B4          ; |156| 

           MVKH    .S2     RL18,B3           ; |156| 
||         MV      .S1X    B5,A4             ; |156| 
||         STW     .D2T2   B4,*+SP(4)        ; |156| 

RL18:      ; CALL OCCURS                     ; |156| 
           MVKL    .S1     _Report,A0        ; |156| 
           MVKH    .S1     _Report,A0        ; |156| 
           B       .S2X    A0                ; |156| 
           MVKL    .S2     RL20,B3           ; |156| 
           MVKH    .S2     RL20,B3           ; |156| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |156| 
           MVK     .S1     2024,A0           ; |157| 

           MVKL    .S1     _sprintf,A0       ; |157| 
||         STW     .D2T1   A0,*+SP(8)        ; |157| 

           MVKH    .S1     _sprintf,A0       ; |157| 
||         MVKL    .S2     SL2+0,B4          ; |157| 

           B       .S2X    A0                ; |157| 
           MVKH    .S2     SL2+0,B4          ; |157| 
           MVKL    .S2     _tmp_string,B5    ; |157| 
           MVKH    .S2     _tmp_string,B5    ; |157| 
           MVKL    .S2     RL22,B3           ; |157| 

           STW     .D2T2   B4,*+SP(4)        ; |157| 
||         MVKH    .S2     RL22,B3           ; |157| 
||         MV      .S1X    B5,A4             ; |157| 

RL22:      ; CALL OCCURS                     ; |157| 
           MVKL    .S1     _Report,A0        ; |157| 
           MVKH    .S1     _Report,A0        ; |157| 
           B       .S2X    A0                ; |157| 
           MVKL    .S2     RL24,B3           ; |157| 
           MVKH    .S2     RL24,B3           ; |157| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |157| 
           MVKL    .S2     SL3+0,B5          ; |158| 
           MVKH    .S2     SL3+0,B5          ; |158| 
           MVKL    .S2     0x20003fc,B4      ; |158| 

           MVKH    .S2     0x20003fc,B4      ; |158| 
||         STW     .D2T2   B5,*+SP(4)        ; |158| 

           LDW     .D2T2   *B4,B4            ; |158| 
           MVKL    .S1     0x20003fc,A0      ; |158| 
           MVKH    .S1     0x20003fc,A0      ; |158| 
           MVKL    .S2     RL26,B3           ; |158| 
           MVKL    .S1     _tmp_string,A4    ; |158| 
           EXTU    .S2     B4,16,24,B4       ; |158| 
           STW     .D2T2   B4,*+SP(8)        ; |158| 

           MVKL    .S1     _sprintf,A0       ; |158| 
||         LDW     .D1T1   *A0,A3            ; |158| 

           MVKH    .S1     _sprintf,A0       ; |158| 
           B       .S2X    A0                ; |158| 
           MVKH    .S2     RL26,B3           ; |158| 
           MVKH    .S1     _tmp_string,A4    ; |158| 
           EXTU    .S1     A3,24,24,A3       ; |158| 
           STW     .D2T1   A3,*+SP(12)       ; |158| 
           NOP             1
RL26:      ; CALL OCCURS                     ; |158| 
           MVKL    .S1     _Report,A0        ; |158| 
           MVKH    .S1     _Report,A0        ; |158| 
           B       .S2X    A0                ; |158| 
           MVKL    .S2     RL28,B3           ; |158| 
           MVKH    .S2     RL28,B3           ; |158| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |158| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |162| 
           MVKH    .S1     _GIE,A0           ; |162| 
           B       .S2X    A0                ; |162| 
           MVKL    .S2     _TFlag,B4         ; |160| 
           MVKL    .S2     RL30,B3           ; |162| 
           MVKH    .S2     _TFlag,B4         ; |160| 
           ZERO    .D2     B5                ; |160| 

           STW     .D2T2   B5,*B4            ; |160| 
||         MVKH    .S2     RL30,B3           ; |162| 

RL30:      ; CALL OCCURS                     ; |162| 
           MVKL    .S2     0x2000080,B6      ; |166| 
           MVK     .S2     1,B7              ; |166| 
           MVKL    .S2     0x200004c,B5      ; |164| 
           MVKH    .S2     0x200004c,B5      ; |164| 

           MVKL    .S2     0x200008c,B4      ; |165| 
||         MVK     .S1     1,A0              ; |164| 

           STW     .D2T1   A0,*B5            ; |164| 
||         MVKH    .S2     0x200008c,B4      ; |165| 

           MVKL    .S1     _TINTCnt,A0       ; |169| 
||         STW     .D2T1   A0,*B4            ; |165| 
||         MVKH    .S2     0x2000080,B6      ; |166| 

           STW     .D2T2   B7,*B6            ; |166| 
||         MVKH    .S1     _TINTCnt,A0       ; |169| 
||         ZERO    .D1     A3                ; |169| 

           STW     .D1T1   A3,*A0            ; |169| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L9:    
           MVKL    .S2     0x200004c,B4      ; |172| 

           MVKH    .S2     0x200004c,B4      ; |172| 
||         MVKL    .S1     _GetAngle,A0      ; |173| 

           LDW     .D2T2   *B4,B5            ; |172| 
||         MVKH    .S1     _GetAngle,A0      ; |173| 

           B       .S2X    A0                ; |173| 
           MVKL    .S2     RL32,B3           ; |173| 
           MVKH    .S2     RL32,B3           ; |173| 
           NOP             1
           XOR     .S1X    1,B5,A3           ; |172| 
           STW     .D2T1   A3,*B4            ; |172| 
RL32:      ; CALL OCCURS                     ; |173| 
           MVKL    .S1     _currPos,A0       ; |173| 
           MVKH    .S1     _currPos,A0       ; |173| 

           MVKL    .S1     _R,A3             ; |175| 
||         MVKL    .S2     _overshoot,B4     ; |175| 

           MVKH    .S1     _R,A3             ; |175| 
||         MVKH    .S2     _overshoot,B4     ; |175| 
||         STW     .D1T1   A4,*A0            ; |173| 

           MVKL    .S2     __divf,B5         ; |175| 
||         LDW     .D2T2   *B4,B4            ; |175| 
||         LDW     .D1T1   *A3,A0            ; |175| 

           MVKL    .S2     _R,B6             ; |175| 
           MVKH    .S2     __divf,B5         ; |175| 
           MVKH    .S2     _R,B6             ; |175| 
           B       .S2     B5                ; |175| 

           LDW     .D2T2   *B6,B4            ; |175| 
||         SUBSP   .L1X    B4,A0,A4          ; |175| 

           MVKL    .S2     RL34,B3           ; |175| 
           MVKH    .S2     RL34,B3           ; |175| 
           NOP             2
RL34:      ; CALL OCCURS                     ; |175| 
           ZERO    .D1     A0                ; |175| 
           MVKH    .S1     0x42c80000,A0     ; |175| 
           MPYSP   .M1     A0,A4,A3          ; |175| 
           MVKL    .S1     _overshootPercent,A0 ; |175| 
           MVKL    .S2     _timerCheckCnt,B4 ; |179| 
           MVKH    .S1     _overshootPercent,A0 ; |175| 

           MVKH    .S2     _timerCheckCnt,B4 ; |179| 
||         STW     .D1T1   A3,*A0            ; |175| 

           LDW     .D2T2   *B4,B5            ; |179| 
           MVKL    .S1     SL4+0,A0          ; |180| 
           MVKH    .S1     SL4+0,A0          ; |180| 
           MVKL    .S1     _tmp_string,A4    ; |180| 
           MVKL    .S2     RL36,B3           ; |180| 
           ADD     .D2     1,B5,B5           ; |179| 
           STW     .D2T2   B5,*B4            ; |179| 
           STW     .D2T1   A0,*+SP(4)        ; |180| 

           MVKL    .S1     _sprintf,A0       ; |180| 
||         MVKL    .S2     _timerCheckCnt,B4 ; |180| 

           MVKH    .S1     _sprintf,A0       ; |180| 
||         MVKH    .S2     _timerCheckCnt,B4 ; |180| 

           LDW     .D2T2   *B4,B4            ; |180| 
||         B       .S2X    A0                ; |180| 

           MVKH    .S1     _tmp_string,A4    ; |180| 
           MVKH    .S2     RL36,B3           ; |180| 
           NOP             2
           STW     .D2T2   B4,*+SP(8)        ; |180| 
RL36:      ; CALL OCCURS                     ; |180| 
           MVKL    .S1     _Report,A0        ; |180| 
           MVKH    .S1     _Report,A0        ; |180| 
           B       .S2X    A0                ; |180| 
           MVKL    .S2     RL38,B3           ; |180| 
           MVKH    .S2     RL38,B3           ; |180| 
           NOP             3
RL38:      ; CALL OCCURS                     ; |180| 
           MVKL    .S2     _GetAngle,B4      ; |182| 
           MVKH    .S2     _GetAngle,B4      ; |182| 
           B       .S2     B4                ; |182| 
           MVKL    .S2     RL42,B3           ; |182| 
           MVKH    .S2     RL42,B3           ; |182| 
           NOP             3
RL42:      ; CALL OCCURS                     ; |182| 
           SPDP    .S1     A4,A7:A6          ; |182| 
           MVKL    .S2     RL44,B3           ; |182| 
           MV      .D1     A6,A3             ; |182| 

           MVKL    .S1     _sprintf,A3       ; |182| 
||         STW     .D2T1   A3,*+SP(8)        ; |182| 

           MVKH    .S1     _sprintf,A3       ; |182| 
           B       .S2X    A3                ; |182| 
           MVKL    .S1     _tmp_string,A4    ; |182| 
           MV      .D1     A7,A0             ; |182| 
           MVKL    .S1     SL5+0,A5          ; |182| 

           MVKH    .S1     SL5+0,A5          ; |182| 
||         STW     .D2T1   A0,*+SP(12)       ; |182| 

           MVKH    .S1     _tmp_string,A4    ; |182| 
||         MVKH    .S2     RL44,B3           ; |182| 
||         STW     .D2T1   A5,*+SP(4)        ; |182| 

RL44:      ; CALL OCCURS                     ; |182| 
           MVKL    .S2     _Report,B4        ; |182| 
           MVKH    .S2     _Report,B4        ; |182| 
           B       .S2     B4                ; |182| 
           MVKL    .S2     RL46,B3           ; |182| 
           MVKH    .S2     RL46,B3           ; |182| 
           NOP             3
RL46:      ; CALL OCCURS                     ; |182| 
           MVKL    .S1     0x200020c,A0      ; |185| 
           MVKL    .S1     SL6+0,A3          ; |185| 
           MVKH    .S1     SL6+0,A3          ; |185| 

           STW     .D2T1   A3,*+SP(4)        ; |185| 
||         MVKH    .S1     0x200020c,A0      ; |185| 

           MVKL    .S1     _sprintf,A0       ; |185| 
||         LDW     .D1T1   *A0,A3            ; |185| 

           MVKH    .S1     _sprintf,A0       ; |185| 
           B       .S2X    A0                ; |185| 
           MVKL    .S2     _tmp_string,B4    ; |185| 
           MVKH    .S2     _tmp_string,B4    ; |185| 
           EXTU    .S1     A3,16,16,A3       ; |185| 
           MVKL    .S2     RL48,B3           ; |185| 

           MVKH    .S2     RL48,B3           ; |185| 
||         MV      .S1X    B4,A4             ; |185| 
||         STW     .D2T1   A3,*+SP(8)        ; |185| 

RL48:      ; CALL OCCURS                     ; |185| 
           MVKL    .S2     _Report,B4        ; |185| 
           MVKH    .S2     _Report,B4        ; |185| 
           B       .S2     B4                ; |185| 
           MVKL    .S2     RL50,B3           ; |185| 
           MVKH    .S2     RL50,B3           ; |185| 
           NOP             3
RL50:      ; CALL OCCURS                     ; |185| 
           MVKL    .S2     _R,B4             ; |188| 
           MVKH    .S2     _R,B4             ; |188| 
           LDW     .D2T2   *B4,B4            ; |188| 
           MVKL    .S1     0x40668000,A1     ; |188| 
           MVKH    .S1     0x40668000,A1     ; |188| 
           NOP             2
           SPDP    .S2     B4,B5:B4          ; |188| 
           ZERO    .D1     A0                ; |188| 
           CMPEQDP .S2X    B5:B4,A1:A0,B0    ; |188| 
           NOP             1
   [!B0]   B       .S1     L10               ; |188| 

   [ B0]   MVKL    .S1     _R,A0             ; |189| 
|| [ B0]   MVKL    .S2     SL7+0,B5          ; |190| 

   [ B0]   ZERO    .D2     B6                ; |189| 
|| [ B0]   MVKL    .S2     _overshoot,B4     ; |190| 
|| [ B0]   MVKH    .S1     _R,A0             ; |189| 

   [!B0]   MVKL    .S1     _R,A0             ; |192| 
|| [ B0]   MVKH    .S2     SL7+0,B5          ; |190| 
|| [ B0]   STW     .D1T2   B6,*A0            ; |189| 

   [!B0]   MVKH    .S1     _R,A0             ; |192| 
|| [ B0]   MVKH    .S2     _overshoot,B4     ; |190| 
|| [ B0]   STW     .D2T2   B5,*+SP(4)        ; |190| 

   [!B0]   LDW     .D1T1   *A0,A0            ; |192| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |190| 

           ; BRANCH OCCURS                   ; |188| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     RL52,B3           ; |190| 
           MVKL    .S1     _tmp_string,A4    ; |190| 
           MVKH    .S2     RL52,B3           ; |190| 
           MVKH    .S1     _tmp_string,A4    ; |190| 
           SPDP    .S2     B4,B5:B4          ; |190| 
           MVKL    .S1     _overshootPercent,A0 ; |190| 
           STW     .D2T2   B4,*+SP(8)        ; |190| 

           MVKH    .S1     _overshootPercent,A0 ; |190| 
||         STW     .D2T2   B5,*+SP(12)       ; |190| 

           LDW     .D1T1   *A0,A0            ; |190| 
           NOP             4
           SPDP    .S1     A0,A1:A0          ; |190| 
           NOP             1

           MVKL    .S1     _sprintf,A0       ; |190| 
||         STW     .D2T1   A0,*+SP(16)       ; |190| 

           MVKH    .S1     _sprintf,A0       ; |190| 
           B       .S2X    A0                ; |190| 
           STW     .D2T1   A1,*+SP(20)       ; |190| 
           NOP             4
RL52:      ; CALL OCCURS                     ; |190| 
           MVKL    .S2     _Report,B4        ; |190| 
           MVKH    .S2     _Report,B4        ; |190| 
           B       .S2     B4                ; |190| 
           MVKL    .S2     RL54,B3           ; |190| 
           MVKH    .S2     RL54,B3           ; |190| 
           NOP             3
RL54:      ; CALL OCCURS                     ; |190| 
           B       .S1     L11               ; |191| 
           NOP             5
           ; BRANCH OCCURS                   ; |191| 
;** --------------------------------------------------------------------------*
L10:    
           NOP             4
           SPDP    .S1     A0,A1:A0          ; |192| 
           ZERO    .L1     A5:A4             ; |192| 
           CMPEQDP .S1     A1:A0,A5:A4,A1    ; |192| 
           NOP             1
   [ A1]   MVKL    .S2     _R,B4             ; |192| 

   [ A1]   MVKH    .S2     _R,B4             ; |192| 
|| [ A1]   ZERO    .D2     B5                ; |192| 

   [ A1]   MVKH    .S2     0x43340000,B5     ; |192| 
   [ A1]   STW     .D2T2   B5,*B4            ; |192| 
;** --------------------------------------------------------------------------*
L11:    
           MVKL    .S2     _sprintf,B4       ; |194| 
           MVKH    .S2     _sprintf,B4       ; |194| 
           B       .S2     B4                ; |194| 
           MVKL    .S1     SL8+0,A0          ; |194| 
           MVKL    .S1     _tmp_string,A4    ; |194| 
           MVKH    .S1     SL8+0,A0          ; |194| 
           MVKL    .S2     RL56,B3           ; |194| 

           STW     .D2T1   A0,*+SP(4)        ; |194| 
||         MVKH    .S2     RL56,B3           ; |194| 
||         MVKH    .S1     _tmp_string,A4    ; |194| 

RL56:      ; CALL OCCURS                     ; |194| 
           MVKL    .S1     _Report,A0        ; |194| 
           MVKH    .S1     _Report,A0        ; |194| 
           B       .S2X    A0                ; |194| 
           MVKL    .S2     RL58,B3           ; |194| 
           MVKH    .S2     RL58,B3           ; |194| 
           NOP             3
RL58:      ; CALL OCCURS                     ; |194| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |195| 
           MVKH    .S2     _WaitTFlagCnt,B4  ; |195| 
           B       .S2     B4                ; |195| 
           MVKL    .S2     RL60,B3           ; |195| 
           MVK     .S1     0x7d0,A4          ; |195| 
           MVKH    .S2     RL60,B3           ; |195| 
           NOP             2
RL60:      ; CALL OCCURS                     ; |195| 
           B       .S1     L9                ; |197| 
           NOP             5
           ; BRANCH OCCURS                   ; |197| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
SL4:	.string	"==== Timer Check: %d ====",13,10,0
SL5:	.string	"current pos: %6.2f ",13,10,0
SL6:	.string	"Encoder bit: 0x%04x ",13,10,0
SL7:	.string	"Overshoot: %6.2f ( %.2f%% ) ",13,10,0
SL8:	.string	13,10,0
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
	.global	__divf
