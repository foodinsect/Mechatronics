;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Fri Jun 07 15:50:23 2024                                *
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


	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_swingUpDirection+0,32
	.field  	1,32			; _swingUpDirection @ 0
	.sect	".text"
	.global	_swingUpDirection
_swingUpDirection:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_WaitCnt+0,32
	.field  	400,32			; _WaitCnt @ 0
	.sect	".text"
	.global	_WaitCnt
_WaitCnt:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_u+0,32
	.word	041f00000h		; _u @ 0
	.sect	".text"
	.global	_u
_u:	.usect	.far,4,4
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
	.field  	_R_pend+0,32
	.word	043340000h		; _R_pend @ 0
	.sect	".text"
	.global	_R_pend
_R_pend:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_R_cart+0,32
	.word	000000000h		; _R_cart @ 0
	.sect	".text"
	.global	_R_cart
_R_cart:	.usect	.far,4,4
	.global	_mode
_mode:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\user\AppData\Local\Temp\TI6480_2 --template_info_file C:\Users\user\AppData\Local\Temp\TI6480_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           SPDP    .S2     B4,B5:B4          ; |116| 
           ZERO    .D2     B6                ; |116| 
           MVKL    .S2     0xc048c000,B7     ; |116| 
           MVKH    .S2     0xc048c000,B7     ; |116| 

           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |116| 
||         ZERO    .D1     A0                ; |117| 
||         STW     .D2T2   B3,*SP--(16)      ; |107| 

           STW     .D2T1   A4,*+SP(4)        ; |107| 
||         MVKH    .S1     0xc2460000,A0     ; |117| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |117| 
           LDW     .D2T2   *+SP(4),B4        ; |120| 
           MVKL    .S1     0x4048c000,A1     ; |120| 
           ZERO    .D1     A0                ; |120| 
           MVKL    .S2     RL4,B3            ; |125| 
           MVKH    .S2     RL4,B3            ; |125| 
           SPDP    .S2     B4,B5:B4          ; |120| 
           MVKH    .S1     0x4048c000,A1     ; |120| 
           CMPGTDP .S1X    B5:B4,A1:A0,A1    ; |120| 
           MVKL    .S2     __divd,B8         ; |125| 
           MVKH    .S1     0x42460000,A0     ; |121| 
   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |121| 
           LDW     .D2T2   *+SP(4),B4        ; |125| 
           ZERO    .D1     A0                ; |125| 
           MVKH    .S1     0x42480000,A0     ; |125| 
           MVKH    .S2     __divd,B8         ; |125| 
           NOP             1
           ADDSP   .L2X    A0,B4,B5          ; |125| 
           MVKL    .S2     0x457ff000,B4     ; |125| 
           MVKH    .S2     0x457ff000,B4     ; |125| 
           NOP             1
           MPYSP   .M2     B4,B5,B4          ; |125| 
           ZERO    .D2     B5                ; |125| 
           MVKH    .S2     0x40590000,B5     ; |125| 
           B       .S2     B8                ; |125| 
           SPDP    .S2     B4,B7:B6          ; |125| 
           ZERO    .D2     B4                ; |125| 
           MV      .S1X    B6,A4             ; |125| 
           NOP             1
           MV      .S1X    B7,A5             ; |125| 
RL4:       ; CALL OCCURS                     ; |125| 
           DPSP    .L1     A5:A4,A0          ; |125| 
           NOP             3
           MV      .S2X    A0,B4             ; |125| 
           SPTRUNC .L2     B4,B4             ; |127| 
           STW     .D2T1   A0,*+SP(8)        ; |125| 
           MVKL    .S1     0x2000088,A0      ; |127| 
           MVKH    .S1     0x2000088,A0      ; |127| 
           STW     .D1T2   B4,*A0            ; |127| 
           LDW     .D2T1   *+SP(4),A4        ; |129| 
           LDW     .D2T2   *++SP(16),B3      ; |130| 
           NOP             4
           B       .S2     B3                ; |130| 
           NOP             5
           ; BRANCH OCCURS                   ; |130| 


	.sect	".text"
	.global	_GetCartPos

;******************************************************************************
;* FUNCTION NAME: _GetCartPos                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,B4,B5,B6,SP                              *
;*   Regs Used         : A0,A1,A3,A4,B3,B4,B5,B6,SP                           *
;*   Local Frame Size  : 0 Args + 12 Auto + 0 Save = 12 byte                  *
;******************************************************************************
_GetCartPos:
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x200020c,B4      ; |140| 
           MVKH    .S2     0x200020c,B4      ; |140| 
           LDW     .D2T2   *B4,B4            ; |140| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |140| 
||         SUB     .D2     SP,16,SP          ; |134| 

           STH     .D2T2   B4,*+SP(4)        ; |140| 
           LDH     .D2T2   *+SP(4),B5        ; |143| 
           LDH     .D2T2   *+SP(4),B6        ; |143| 
           LDH     .D2T2   *+SP(4),B4        ; |144| 
           NOP             2

           MVK     .S1     32767,A3          ; |143| 
||         ZERO    .D1     A0                ; |144| 

           CMPGT   .L1X    B5,A3,A1          ; |143| 
||         MVKH    .S1     0x10000,A0        ; |144| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |143| 
||         SUB     .L2X    B4,A0,B4          ; |144| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |144| 
           LDW     .D2T2   *+SP(8),B4        ; |147| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |147| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |147| 

           MVKH    .S1     0x3fd68000,A1     ; |147| 
||         ZERO    .D1     A0                ; |147| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |147| 
           NOP             8
           B       .S2     B3                ; |149| 
           DPSP    .L1     A1:A0,A0          ; |147| 
           NOP             3

           ADDK    .S2     16,SP             ; |149| 
||         STW     .D2T1   A0,*+SP(12)       ; |147| 
||         MV      .D1     A0,A4             ; |147| 

           ; BRANCH OCCURS                   ; |149| 


	.sect	".text"
	.global	_GetPendulumAngle

;******************************************************************************
;* FUNCTION NAME: _GetPendulumAngle                                           *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 12 Auto + 4 Save = 16 byte                  *
;******************************************************************************
_GetPendulumAngle:
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x2000210,B4      ; |157| 

           MVKH    .S2     0x2000210,B4      ; |157| 
||         STW     .D2T2   B3,*SP--(16)      ; |151| 

           LDW     .D2T1   *B4,A0            ; |157| 
           NOP             4
           EXTU    .S1     A0,16,16,A0       ; |157| 
           STH     .D2T1   A0,*+SP(4)        ; |157| 
           LDH     .D2T2   *+SP(4),B7        ; |160| 
           LDH     .D2T2   *+SP(4),B5        ; |161| 
           LDH     .D2T2   *+SP(4),B4        ; |160| 
           NOP             2

           ZERO    .D1     A0                ; |161| 
||         MVK     .S2     32767,B6          ; |160| 

           CMPGT   .L2     B7,B6,B0          ; |160| 
||         MVKH    .S1     0x10000,A0        ; |161| 

           SUB     .L2X    B5,A0,B4          ; |161| 
|| [!B0]   STW     .D2T2   B4,*+SP(8)        ; |160| 

   [ B0]   STW     .D2T2   B4,*+SP(8)        ; |161| 
           LDW     .D2T2   *+SP(8),B4        ; |164| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |164| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |164| 

           ZERO    .D1     A0                ; |164| 
||         MVKH    .S1     0x3fd68000,A1     ; |164| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |164| 
           NOP             9
           DPSP    .L1     A1:A0,A0          ; |164| 
           NOP             3
           MV      .S2X    A0,B4             ; |164| 

           SPDP    .S2     B4,B7:B6          ; |170| 
||         MVKL    .S1     _fmod,A0          ; |170| 
||         STW     .D2T1   A0,*+SP(12)       ; |164| 

           MVKH    .S1     _fmod,A0          ; |170| 
           B       .S2X    A0                ; |170| 
           NOP             1
           MVKL    .S2     RL6,B3            ; |170| 
           MVKH    .S2     RL6,B3            ; |170| 

           MV      .S1X    B6,A4             ; |170| 
||         MVKL    .S2     0x40768000,B5     ; |170| 

           ZERO    .D2     B4                ; |170| 
||         MV      .S1X    B7,A5             ; |170| 
||         MVKH    .S2     0x40768000,B5     ; |170| 

RL6:       ; CALL OCCURS                     ; |170| 
           DPSP    .L1     A5:A4,A0          ; |170| 
           NOP             3
           MV      .S2X    A0,B5             ; |170| 

           ZERO    .D1     A0                ; |172| 
||         STW     .D2T1   A0,*+SP(12)       ; |170| 
||         MV      .S2X    A0,B4             ; |170| 

           MVKH    .S1     0x43b40000,A0     ; |172| 
           ADDSP   .L2X    A0,B4,B4          ; |172| 
           NOP             1
           ZERO    .D2     B6                ; |171| 
           CMPLTSP .S2     B5,B6,B0          ; |171| 
   [ B0]   STW     .D2T2   B4,*+SP(12)       ; |172| 
           LDW     .D2T1   *+SP(12),A4       ; |175| 
           LDW     .D2T2   *++SP(16),B3      ; |176| 
           NOP             4
           B       .S2     B3                ; |176| 
           NOP             5
           ; BRANCH OCCURS                   ; |176| 


	.sect	".text"
	.global	_SwingUpControl

;******************************************************************************
;* FUNCTION NAME: _SwingUpControl                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 4 Auto + 4 Save = 8 byte                    *
;******************************************************************************
_SwingUpControl:
;** --------------------------------------------------------------------------*
           MVKL    .S2     _GetPendulumAngle,B4 ; |186| 
           MVKH    .S2     _GetPendulumAngle,B4 ; |186| 
           B       .S2     B4                ; |186| 
           STW     .D2T2   B3,*SP--(8)       ; |184| 
           MVKL    .S2     RL8,B3            ; |186| 
           MVKH    .S2     RL8,B3            ; |186| 
           NOP             2
RL8:       ; CALL OCCURS                     ; |186| 

           MVKL    .S1     _WaitCnt,A0       ; |188| 
||         MVKL    .S2     _TINTCnt,B4       ; |188| 

           MVKH    .S1     _WaitCnt,A0       ; |188| 
||         MVKH    .S2     _TINTCnt,B4       ; |188| 
||         STW     .D2T1   A4,*+SP(4)        ; |186| 

           LDW     .D2T2   *B4,B4            ; |188| 
||         LDW     .D1T1   *A0,A3            ; |188| 

           MVKL    .S1     _TINTCnt,A6       ; |209| 
           MVKL    .S1     _swingUpDirection,A5 ; |210| 
           MVKH    .S1     _TINTCnt,A6       ; |209| 
           MVKH    .S1     _swingUpDirection,A5 ; |210| 
           CMPLTU  .L1X    B4,A3,A1          ; |188| 
   [!A1]   B       .S2     L14               ; |188| 
           MVKL    .S1     _swingUpDirection,A4 ; |210| 
           MVKL    .S1     _swingUpDirection,A0 ; |189| 
           ZERO    .D2     B5                ; |212| 
           MVKH    .S1     _swingUpDirection,A4 ; |210| 

           MVKH    .S2     0x43430000,B5     ; |212| 
||         MVKH    .S1     _swingUpDirection,A0 ; |189| 
||         ZERO    .D1     A3                ; |209| 

           ; BRANCH OCCURS                   ; |188| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A1            ; |189| 
           LDW     .D2T2   *+SP(4),B5        ; |190| 
           ZERO    .D2     B4                ; |190| 
           MVKH    .S2     0x430c0000,B4     ; |190| 
           ZERO    .D1     A0                ; |199| 
   [!A1]   B       .S1     L11               ; |189| 
           CMPGTSP .S2     B5,B4,B0          ; |190| 
           MV      .D2     B5,B6             ; |190| 
           MVKH    .S1     0x430c0000,A0     ; |199| 
           CMPGTSP .S2X    B6,A0,B1          ; |199| 
           NOP             1
           ; BRANCH OCCURS                   ; |189| 
;** --------------------------------------------------------------------------*
           ZERO    .D1     A0                ; |190| 

           MVKH    .S1     0x43340000,A0     ; |190| 
||         MV      .D2     B5,B4

           CMPLTSP .S2X    B4,A0,B4          ; |190| 
   [!B0]   MV      .D2     B0,B4             ; |190| 
           MV      .S1X    B4,A1             ; |190| 
   [ A1]   B       .S1     L9                ; |190| 
           ZERO    .D2     B5                ; |190| 
           MVKH    .S2     0x435c0000,B5     ; |190| 

           CMPLTSP .S2     B6,B5,B0          ; |190| 
|| [!A1]   ZERO    .D1     A0                ; |190| 

   [!A1]   MVKH    .S1     0x43340000,A0     ; |190| 
|| [!A1]   MV      .D2     B6,B4
|| [ A1]   MVKL    .S2     _PWMOut,B4        ; |192| 

   [!A1]   CMPGTSP .S2X    B4,A0,B4          ; |190| 
           ; BRANCH OCCURS                   ; |190| 
;** --------------------------------------------------------------------------*
   [!B0]   MV      .D2     B0,B4             ; |190| 
           MV      .S1X    B4,A1             ; |190| 
           MVKL    .S2     _PWMOut,B4        ; |192| 
;** --------------------------------------------------------------------------*
L9:    
           MVKL    .S2     _u,B6             ; |194| 
           MVKL    .S2     _u,B5             ; |191| 
           MVKL    .S2     _PWMOut,B7        ; |195| 

           MVKL    .S2     RL10,B3           ; |192| 
||         ZERO    .D2     B9                ; |194| 

           MVKH    .S2     0x41f00000,B9     ; |194| 

   [!A1]   B       .S1     L10               ; |190| 
||         MVKH    .S2     _PWMOut,B4        ; |192| 

           MVKH    .S2     _u,B6             ; |194| 
||         MVKL    .S1     _u,A3             ; |195| 

           MVKH    .S2     _u,B5             ; |191| 
||         MVKL    .S1     _u,A4             ; |192| 
||         ZERO    .D1     A0                ; |195| 
||         ZERO    .D2     B8                ; |191| 

           MVKH    .S2     0x420c0000,B8     ; |191| 
||         SET     .S1     A0,31,31,A0       ; |195| 

           MVKH    .S2     _PWMOut,B7        ; |195| 
||         MVKH    .S1     _u,A3             ; |195| 

           MVKH    .S1     _u,A4             ; |192| 
||         MVKH    .S2     RL10,B3           ; |192| 
|| [!A1]   STW     .D2T2   B9,*B6            ; |194| 

           ; BRANCH OCCURS                   ; |190| 
;** --------------------------------------------------------------------------*

           B       .S2     B4                ; |192| 
||         STW     .D2T2   B8,*B5            ; |191| 

           LDW     .D1T1   *A4,A4            ; |192| 
           NOP             4
RL10:      ; CALL OCCURS                     ; |192| 
           LDW     .D2T2   *++SP(8),B3       ; |218| 
           NOP             4
           B       .S2     B3                ; |218| 
           NOP             5
           ; BRANCH OCCURS                   ; |218| ; chained return
;** --------------------------------------------------------------------------*
L10:    

           B       .S2     B7                ; |195| 
||         LDW     .D1T1   *A3,A3            ; |195| 

           MVKL    .S2     RL12,B3           ; |195| 
           MVKH    .S2     RL12,B3           ; |195| 
           NOP             2
           XOR     .S1     A3,A0,A4          ; |195| 
RL12:      ; CALL OCCURS                     ; |195| 
           LDW     .D2T2   *++SP(8),B3       ; |218| 
           NOP             4
           B       .S2     B3                ; |218| 
           NOP             5
           ; BRANCH OCCURS                   ; |218| ; chained return
;** --------------------------------------------------------------------------*
L11:    
           ZERO    .D1     A0                ; |199| 

           MVKH    .S1     0x43340000,A0     ; |199| 
||         MV      .D2     B5,B4

           CMPLTSP .S2X    B4,A0,B4          ; |199| 
   [!B1]   MV      .D2     B1,B4             ; |199| 
           MV      .S1X    B4,A1             ; |199| 
   [ A1]   B       .S1     L12               ; |199| 
           ZERO    .D2     B5                ; |199| 
           MVKH    .S2     0x435c0000,B5     ; |199| 

           CMPLTSP .S2     B6,B5,B0          ; |199| 
|| [!A1]   ZERO    .D1     A0                ; |199| 

   [!A1]   MVKH    .S1     0x43340000,A0     ; |199| 
|| [!A1]   MV      .D2     B6,B4
|| [ A1]   MVKL    .S2     _PWMOut,B4        ; |201| 

   [!A1]   CMPGTSP .S2X    B4,A0,B4          ; |199| 
           ; BRANCH OCCURS                   ; |199| 
;** --------------------------------------------------------------------------*
   [!B0]   MV      .D2     B0,B4             ; |199| 
           MV      .S1X    B4,A1             ; |199| 
           MVKL    .S2     _PWMOut,B4        ; |201| 
;** --------------------------------------------------------------------------*
L12:    
           MVKL    .S2     RL14,B3           ; |201| 
           MVKL    .S2     _u,B5             ; |203| 
           MVKL    .S2     _PWMOut,B7        ; |204| 
           MVKL    .S2     _u,B6             ; |200| 
           MVKH    .S2     _PWMOut,B4        ; |201| 

   [!A1]   B       .S1     L13               ; |199| 
||         MVKH    .S2     RL14,B3           ; |201| 
||         ZERO    .D2     B9                ; |203| 

           MVKH    .S2     0x41f00000,B9     ; |203| 
||         MVKL    .S1     _u,A0             ; |204| 

           MVKH    .S2     _u,B5             ; |203| 
||         MVKL    .S1     _u,A4             ; |201| 
||         ZERO    .D2     B8                ; |200| 

           MVKH    .S2     0x420c0000,B8     ; |200| 
||         SET     .S1     A3,31,31,A3       ; |201| 

           MVKH    .S2     _PWMOut,B7        ; |204| 
||         MVKH    .S1     _u,A0             ; |204| 

           MVKH    .S1     _u,A4             ; |201| 
||         MVKH    .S2     _u,B6             ; |200| 

           ; BRANCH OCCURS                   ; |199| 
;** --------------------------------------------------------------------------*
           STW     .D2T2   B8,*B6            ; |200| 

           B       .S2     B4                ; |201| 
||         LDW     .D1T1   *A4,A0            ; |201| 

           NOP             4
           XOR     .S1     A0,A3,A4          ; |201| 
RL14:      ; CALL OCCURS                     ; |201| 
           LDW     .D2T2   *++SP(8),B3       ; |218| 
           NOP             4
           B       .S2     B3                ; |218| 
           NOP             5
           ; BRANCH OCCURS                   ; |218| ; chained return
;** --------------------------------------------------------------------------*
L13:    

           B       .S2     B7                ; |204| 
||         STW     .D2T2   B9,*B5            ; |203| 

           LDW     .D1T1   *A0,A4            ; |204| 
           MVKL    .S2     RL16,B3           ; |204| 
           MVKH    .S2     RL16,B3           ; |204| 
           NOP             2
RL16:      ; CALL OCCURS                     ; |204| 
           LDW     .D2T2   *++SP(8),B3       ; |218| 
           NOP             4
           B       .S2     B3                ; |218| 
           NOP             5
           ; BRANCH OCCURS                   ; |218| ; chained return
;** --------------------------------------------------------------------------*
L14:    
           STW     .D1T1   A3,*A6            ; |209| 
           LDW     .D1T1   *A5,A0            ; |210| 
           MVKL    .S2     _WaitCnt,B7       ; |213| 
           ZERO    .D2     B6                ; |212| 
           MVKH    .S2     0x432f0000,B6     ; |212| 
           MVK     .S2     400,B8            ; |213| 
           CMPEQ   .L1     A0,0,A0           ; |210| 
           STW     .D1T1   A0,*A4            ; |210| 
           LDW     .D2T2   *+SP(4),B9        ; |212| 
           MVKH    .S2     _WaitCnt,B7       ; |213| 
           MVKL    .S1     _WaitCnt,A3       ; |215| 
           MVKH    .S1     _WaitCnt,A3       ; |215| 
           NOP             1

           CMPLTSP .S2     B9,B5,B0          ; |212| 
||         MV      .D2     B9,B4             ; |212| 

           CMPGTSP .S2     B4,B6,B4          ; |212| 
   [!B0]   MV      .D2     B0,B4             ; |212| 
           MV      .L1X    B4,A1             ; |212| 
   [ A1]   STW     .D2T2   B8,*B7            ; |213| 
           LDW     .D1T1   *A3,A0            ; |215| 
           NOP             4
           ADDK    .S1     20,A0             ; |215| 
           STW     .D1T1   A0,*A3            ; |215| 
           LDW     .D2T2   *++SP(8),B3       ; |218| 
           NOP             4
           B       .S2     B3                ; |218| 
           NOP             5
           ; BRANCH OCCURS                   ; |218| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |234| 
           MVKH    .S1     _InitEXINTF,A0    ; |234| 
           B       .S2X    A0                ; |234| 
           STW     .D2T2   B3,*SP--(24)      ; |233| 
           MVKL    .S2     RL22,B3           ; |234| 
           MVKH    .S2     RL22,B3           ; |234| 
           NOP             2
RL22:      ; CALL OCCURS                     ; |234| 
           MVKL    .S1     _InitTimer,A0     ; |235| 
           MVKH    .S1     _InitTimer,A0     ; |235| 
           B       .S2X    A0                ; |235| 
           MVKL    .S2     RL24,B3           ; |235| 
           MVKH    .S2     RL24,B3           ; |235| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |235| 
           MVKL    .S2     _InitUART,B4      ; |236| 
           MVKH    .S2     _InitUART,B4      ; |236| 
           B       .S2     B4                ; |236| 
           MVKL    .S2     RL26,B3           ; |236| 
           MVKH    .S2     RL26,B3           ; |236| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |236| 
           MVKL    .S1     _InitINT,A0       ; |237| 
           MVKH    .S1     _InitINT,A0       ; |237| 
           B       .S2X    A0                ; |237| 
           MVKL    .S2     RL28,B3           ; |237| 
           MVKH    .S2     RL28,B3           ; |237| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |237| 
           MVKL    .S1     _InitUSBMon,A0    ; |238| 
           MVKH    .S1     _InitUSBMon,A0    ; |238| 
           B       .S2X    A0                ; |238| 
           MVKL    .S2     RL30,B3           ; |238| 
           MVKH    .S2     RL30,B3           ; |238| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |238| 
           MVKL    .S1     _sprintf,A0       ; |240| 

           MVKH    .S1     _sprintf,A0       ; |240| 
||         MVKL    .S2     SL1+0,B5          ; |240| 

           B       .S2X    A0                ; |240| 
           MVKL    .S2     RL32,B3           ; |240| 
           MVKH    .S2     SL1+0,B5          ; |240| 
           MVKL    .S2     _tmp_string,B4    ; |240| 
           MVKH    .S2     _tmp_string,B4    ; |240| 

           MVKH    .S2     RL32,B3           ; |240| 
||         STW     .D2T2   B5,*+SP(4)        ; |240| 
||         MV      .S1X    B4,A4             ; |240| 

RL32:      ; CALL OCCURS                     ; |240| 
           MVKL    .S1     _Report,A0        ; |240| 
           MVKH    .S1     _Report,A0        ; |240| 
           B       .S2X    A0                ; |240| 
           MVKL    .S2     RL34,B3           ; |240| 
           MVKH    .S2     RL34,B3           ; |240| 
           NOP             3
RL34:      ; CALL OCCURS                     ; |240| 
           MVK     .S1     2024,A0           ; |241| 

           MVKL    .S1     _sprintf,A0       ; |241| 
||         STW     .D2T1   A0,*+SP(8)        ; |241| 

           MVKH    .S1     _sprintf,A0       ; |241| 
||         MVKL    .S2     _tmp_string,B5    ; |241| 

           B       .S2X    A0                ; |241| 
           MVKL    .S2     SL2+0,B4          ; |241| 
           MVKH    .S2     _tmp_string,B5    ; |241| 
           MVKH    .S2     SL2+0,B4          ; |241| 
           MVKL    .S2     RL36,B3           ; |241| 

           MVKH    .S2     RL36,B3           ; |241| 
||         STW     .D2T2   B4,*+SP(4)        ; |241| 
||         MV      .S1X    B5,A4             ; |241| 

RL36:      ; CALL OCCURS                     ; |241| 
           MVKL    .S1     _Report,A0        ; |241| 
           MVKH    .S1     _Report,A0        ; |241| 
           B       .S2X    A0                ; |241| 
           MVKL    .S2     RL38,B3           ; |241| 
           MVKH    .S2     RL38,B3           ; |241| 
           NOP             3
RL38:      ; CALL OCCURS                     ; |241| 
           MVKL    .S2     SL3+0,B4          ; |242| 
           MVKL    .S2     0x20003fc,B5      ; |242| 
           MVKH    .S2     SL3+0,B4          ; |242| 

           STW     .D2T2   B4,*+SP(4)        ; |242| 
||         MVKH    .S2     0x20003fc,B5      ; |242| 

           LDW     .D2T2   *B5,B4            ; |242| 
           MVKL    .S1     0x20003fc,A0      ; |242| 
           MVKH    .S1     0x20003fc,A0      ; |242| 
           MVKL    .S1     _tmp_string,A4    ; |242| 
           MVKL    .S2     RL40,B3           ; |242| 
           EXTU    .S2     B4,16,24,B4       ; |242| 
           STW     .D2T2   B4,*+SP(8)        ; |242| 

           MVKL    .S1     _sprintf,A0       ; |242| 
||         LDW     .D1T1   *A0,A3            ; |242| 

           MVKH    .S1     _sprintf,A0       ; |242| 
           B       .S2X    A0                ; |242| 
           MVKH    .S1     _tmp_string,A4    ; |242| 
           MVKH    .S2     RL40,B3           ; |242| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |242| 
           STW     .D2T1   A3,*+SP(12)       ; |242| 
RL40:      ; CALL OCCURS                     ; |242| 
           MVKL    .S1     _Report,A0        ; |242| 
           MVKH    .S1     _Report,A0        ; |242| 
           B       .S2X    A0                ; |242| 
           MVKL    .S2     RL42,B3           ; |242| 
           MVKH    .S2     RL42,B3           ; |242| 
           NOP             3
RL42:      ; CALL OCCURS                     ; |242| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |246| 
           MVKH    .S1     _GIE,A0           ; |246| 
           B       .S2X    A0                ; |246| 
           MVKL    .S2     _TFlag,B4         ; |244| 
           MVKL    .S2     RL44,B3           ; |246| 
           MVKH    .S2     _TFlag,B4         ; |244| 
           ZERO    .D2     B5                ; |244| 

           STW     .D2T2   B5,*B4            ; |244| 
||         MVKH    .S2     RL44,B3           ; |246| 

RL44:      ; CALL OCCURS                     ; |246| 
           MVKL    .S2     _WaitTFlagCnt,B7  ; |251| 
           MVKL    .S2     0x200008c,B6      ; |249| 
           MVKH    .S2     _WaitTFlagCnt,B7  ; |251| 
           MVKH    .S2     0x200008c,B6      ; |249| 
           MVKL    .S2     0x2000080,B5      ; |248| 
           B       .S2     B7                ; |251| 
           MVKL    .S2     0x200004c,B4      ; |247| 

           MVKH    .S2     0x200004c,B4      ; |247| 
||         MVK     .S1     1,A0              ; |247| 

           STW     .D2T1   A0,*B4            ; |247| 
||         MVKH    .S2     0x2000080,B5      ; |248| 

           STW     .D2T1   A0,*B5            ; |248| 
||         MVKL    .S2     RL46,B3           ; |251| 

           STW     .D2T1   A0,*B6            ; |249| 
||         MVKH    .S2     RL46,B3           ; |251| 
||         MVK     .S1     0x3e8,A4          ; |251| 

RL46:      ; CALL OCCURS                     ; |251| 
           MVKL    .S1     _TINTCnt,A0       ; |254| 

           MVKH    .S1     _TINTCnt,A0       ; |254| 
||         ZERO    .D1     A3                ; |254| 

           STW     .D1T1   A3,*A0            ; |254| 
           MVKL    .S2     0x200004c,B4      ; |258| 
           MVKH    .S2     0x200004c,B4      ; |258| 
           LDW     .D2T2   *B4,B5            ; |258| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L15
;** --------------------------------------------------------------------------*
L15:    
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L16:    
           MVKL    .S1     _y_pend,A0        ; |261| 
           MVKH    .S1     _y_pend,A0        ; |261| 
           XOR     .S2     1,B5,B5           ; |258| 
           STW     .D2T2   B5,*B4            ; |258| 
           LDW     .D1T1   *A0,A0            ; |261| 
           ZERO    .D2     B4                ; |261| 
           MVKH    .S2     0x43200000,B4     ; |261| 
           NOP             2
           CMPLTSP .S2X    A0,B4,B4          ; |261| 
           XOR     .S2     1,B4,B0           ; |261| 
   [ B0]   MVKL    .S2     _y_pend,B4        ; |261| 
   [ B0]   MVKH    .S2     _y_pend,B4        ; |261| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |261| 
   [ B0]   ZERO    .D1     A0                ; |261| 
   [ B0]   MVKH    .S1     0x43480000,A0     ; |261| 
           NOP             2
   [ B0]   CMPGTSP .S2X    B4,A0,B4          ; |261| 
   [ B0]   XOR     .S2     1,B4,B0           ; |261| 
   [!B0]   MVKL    .S2     _mode,B5          ; |266| 
   [ B0]   MVKL    .S2     _mode,B5          ; |262| 
   [!B0]   MVKH    .S2     _mode,B5          ; |266| 

           MVKL    .S2     _TINTCnt,B4       ; |270| 
|| [!B0]   ZERO    .D2     B6                ; |266| 

   [ B0]   MVKH    .S2     _mode,B5          ; |262| 
|| [ B0]   MVK     .S1     1,A0              ; |262| 
|| [!B0]   STW     .D2T2   B6,*B5            ; |266| 

           MVKH    .S2     _TINTCnt,B4       ; |270| 
|| [ B0]   STW     .D2T1   A0,*B5            ; |262| 

           LDW     .D2T2   *B4,B4            ; |270| 
           MVK     .S1     1000,A0           ; |270| 
           NOP             3
           CMPGTU  .L1X    B4,A0,A1          ; |270| 
   [!A1]   B       .S1     L16               ; |270| 

   [ A1]   MVKL    .S1     _timerCheckCnt,A0 ; |272| 
|| [!A1]   MVKL    .S2     0x200004c,B4      ; |258| 

   [ A1]   MVKH    .S1     _timerCheckCnt,A0 ; |272| 
|| [!A1]   MVKH    .S2     0x200004c,B4      ; |258| 

   [ A1]   LDW     .D1T1   *A0,A3            ; |272| 
|| [!A1]   LDW     .D2T2   *B4,B5            ; |258| 

           NOP             2
           ; BRANCH OCCURS                   ; |270| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     SL4+0,B4          ; |273| 
           MVKH    .S2     SL4+0,B4          ; |273| 

           MVKL    .S2     _timerCheckCnt,B5 ; |273| 
||         ADD     .D1     1,A3,A3           ; |272| 

           STW     .D1T1   A3,*A0            ; |272| 
||         MVKL    .S1     _sprintf,A0       ; |273| 

           MVKH    .S1     _sprintf,A0       ; |273| 
||         STW     .D2T2   B4,*+SP(4)        ; |273| 
||         MVKH    .S2     _timerCheckCnt,B5 ; |273| 

           B       .S2X    A0                ; |273| 
||         LDW     .D2T2   *B5,B4            ; |273| 

           MVKL    .S2     RL48,B3           ; |273| 
           MVKH    .S2     RL48,B3           ; |273| 
           NOP             1
           MVKL    .S1     _tmp_string,A4    ; |273| 

           MVKH    .S1     _tmp_string,A4    ; |273| 
||         STW     .D2T2   B4,*+SP(8)        ; |273| 

RL48:      ; CALL OCCURS                     ; |273| 
           MVKL    .S1     _Report,A0        ; |273| 
           MVKH    .S1     _Report,A0        ; |273| 
           B       .S2X    A0                ; |273| 
           MVKL    .S2     RL50,B3           ; |273| 
           MVKH    .S2     RL50,B3           ; |273| 
           NOP             3
RL50:      ; CALL OCCURS                     ; |273| 
           MVKL    .S1     _GetPendulumAngle,A0 ; |275| 
           MVKH    .S1     _GetPendulumAngle,A0 ; |275| 
           B       .S2X    A0                ; |275| 
           MVKL    .S2     RL54,B3           ; |275| 
           MVKH    .S2     RL54,B3           ; |275| 
           NOP             3
RL54:      ; CALL OCCURS                     ; |275| 
           SPDP    .S2X    A4,B7:B6          ; |275| 
           MVKL    .S1     _sprintf,A0       ; |275| 

           MVKH    .S1     _sprintf,A0       ; |275| 
||         MVKL    .S2     SL5+0,B9          ; |275| 

           B       .S2X    A0                ; |275| 
           MVKL    .S2     _tmp_string,B8    ; |275| 

           MV      .D2     B6,B5             ; |275| 
||         MVKL    .S2     RL56,B3           ; |275| 

           MV      .L2     B7,B4             ; |275| 
||         MVKH    .S2     SL5+0,B9          ; |275| 
||         STW     .D2T2   B5,*+SP(8)        ; |275| 

           MVKH    .S2     _tmp_string,B8    ; |275| 
||         STW     .D2T2   B4,*+SP(12)       ; |275| 

           MVKH    .S2     RL56,B3           ; |275| 
||         MV      .S1X    B8,A4             ; |275| 
||         STW     .D2T2   B9,*+SP(4)        ; |275| 

RL56:      ; CALL OCCURS                     ; |275| 
           MVKL    .S1     _Report,A0        ; |275| 
           MVKH    .S1     _Report,A0        ; |275| 
           B       .S2X    A0                ; |275| 
           MVKL    .S2     RL58,B3           ; |275| 
           MVKH    .S2     RL58,B3           ; |275| 
           NOP             3
RL58:      ; CALL OCCURS                     ; |275| 
           MVKL    .S1     _GetCartPos,A0    ; |277| 
           MVKH    .S1     _GetCartPos,A0    ; |277| 
           B       .S2X    A0                ; |277| 
           MVKL    .S2     RL62,B3           ; |277| 
           MVKH    .S2     RL62,B3           ; |277| 
           NOP             3
RL62:      ; CALL OCCURS                     ; |277| 
           SPDP    .S1     A4,A1:A0          ; |277| 
           MVKL    .S2     RL64,B3           ; |277| 

           MVKL    .S1     _sprintf,A0       ; |277| 
||         STW     .D2T1   A0,*+SP(8)        ; |277| 

           MVKH    .S1     _sprintf,A0       ; |277| 
           B       .S2X    A0                ; |277| 
           MVKL    .S2     SL6+0,B5          ; |277| 
           MVKH    .S2     SL6+0,B5          ; |277| 
           MVKL    .S2     _tmp_string,B4    ; |277| 

           MVKH    .S2     _tmp_string,B4    ; |277| 
||         STW     .D2T2   B5,*+SP(4)        ; |277| 

           MVKH    .S2     RL64,B3           ; |277| 
||         STW     .D2T1   A1,*+SP(12)       ; |277| 
||         MV      .S1X    B4,A4             ; |277| 

RL64:      ; CALL OCCURS                     ; |277| 
           MVKL    .S1     _Report,A0        ; |277| 
           MVKH    .S1     _Report,A0        ; |277| 
           B       .S2X    A0                ; |277| 
           MVKL    .S2     RL66,B3           ; |277| 
           MVKH    .S2     RL66,B3           ; |277| 
           NOP             3
RL66:      ; CALL OCCURS                     ; |277| 
           MVKL    .S2     _sprintf,B4       ; |278| 
           MVKH    .S2     _sprintf,B4       ; |278| 
           B       .S2     B4                ; |278| 
           MVKL    .S2     SL7+0,B5          ; |278| 
           MVKH    .S2     SL7+0,B5          ; |278| 
           MVKL    .S2     RL68,B3           ; |278| 
           MVKL    .S1     _tmp_string,A4    ; |278| 

           MVKH    .S2     RL68,B3           ; |278| 
||         MVKH    .S1     _tmp_string,A4    ; |278| 
||         STW     .D2T2   B5,*+SP(4)        ; |278| 

RL68:      ; CALL OCCURS                     ; |278| 
           MVKL    .S2     _Report,B4        ; |278| 
           MVKH    .S2     _Report,B4        ; |278| 
           B       .S2     B4                ; |278| 
           MVKL    .S2     RL70,B3           ; |278| 
           MVKH    .S2     RL70,B3           ; |278| 
           NOP             3
RL70:      ; CALL OCCURS                     ; |278| 
           B       .S1     L15               ; |281| 
           MVKL    .S1     _TINTCnt,A0       ; |254| 

           ZERO    .D1     A3                ; |254| 
||         MVKH    .S1     _TINTCnt,A0       ; |254| 

           MVKL    .S2     0x200004c,B4      ; |258| 
||         STW     .D1T1   A3,*A0            ; |254| 

           MVKH    .S2     0x200004c,B4      ; |258| 
           LDW     .D2T2   *B4,B5            ; |258| 
           ; BRANCH OCCURS                   ; |281| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
SL4:	.string	"==== Timer Check: %d ====",13,10,0
SL5:	.string	"pendulum pos: %6.2f ",13,10,0
SL6:	.string	"cart encoder: %6.2f ",13,10,0
SL7:	.string	13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_fmod
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	_y_pend
	.global	__divd
