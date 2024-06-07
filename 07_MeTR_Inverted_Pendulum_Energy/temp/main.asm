;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Fri Jun 07 15:03:11 2024                                *
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
	.global	_timerCheckCnt
_timerCheckCnt:	.usect	.far,4,4
	.global	_INTRR_cnt
_INTRR_cnt:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_R+0,32
	.word	043340000h		; _R @ 0
	.sect	".text"
	.global	_R
_R:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_vel_max+0,32
	.word	044bb8000h		; _vel_max @ 0
	.sect	".text"
	.global	_vel_max
_vel_max:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_accel+0,32
	.word	0461c4000h		; _accel @ 0
	.sect	".text"
	.global	_accel
_accel:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_cart_R+0,32
	.word	000000000h		; _cart_R @ 0
	.sect	".text"
	.global	_cart_R
_cart_R:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prev_angle$1+0,32
	.word	000000000h		; _prev_angle$1 @ 0
	.sect	".text"
_prev_angle$1:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_control_duration$2+0,32
	.field  	0,32			; _control_duration$2 @ 0
	.sect	".text"
_control_duration$2:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\user\AppData\Local\Temp\TI3604_2 --template_info_file C:\Users\user\AppData\Local\Temp\TI3604_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           ZERO    .D1     A0                ; |25| 
           MVKH    .S1     0x1800000,A0      ; |25| 
           LDW     .D1T1   *A0,A4            ; |25| 
           MVKL    .S2     0x1800008,B5      ; |28| 
           MVKL    .S2     0x21520521,B6     ; |40| 
           B       .S2     B3                ; |50| 

           MVKL    .S2     0x1800010,B4      ; |40| 
||         MVKL    .S1     0xd00321,A3       ; |28| 

           CLR     .S1     A4,3,5,A4         ; |25| 
||         MVKH    .S2     0x1800008,B5      ; |28| 

           STW     .D1T1   A4,*A0            ; |25| 
||         MVKH    .S2     0x21520521,B6     ; |40| 
||         MVKH    .S1     0xd00321,A3       ; |28| 

           STW     .D2T1   A3,*B5            ; |28| 
||         MVKH    .S2     0x1800010,B4      ; |40| 

           STW     .D2T2   B6,*B4            ; |40| 
           ; BRANCH OCCURS                   ; |50| 


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
           ZERO    .D2     B4                ; |55| 
           MVKH    .S2     0x1940000,B4      ; |55| 
           LDW     .D2T2   *B4,B5            ; |55| 
           MVKL    .S1     0x1940004,A0      ; |58| 
           MVKH    .S1     0x1940004,A0      ; |58| 
           ZERO    .D1     A3                ; |61| 
           MVKH    .S1     0x1940000,A3      ; |61| 
           SET     .S2     B5,8,9,B5         ; |55| 

           MVK     .S2     20000,B4          ; |58| 
||         STW     .D2T2   B5,*B4            ; |55| 

           STW     .D1T2   B4,*A0            ; |58| 
           LDW     .D1T1   *A3,A0            ; |61| 
           B       .S2     B3                ; |62| 
           NOP             3
           SET     .S1     A0,6,7,A0         ; |61| 
           STW     .D1T1   A0,*A3            ; |61| 
           ; BRANCH OCCURS                   ; |62| 


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
           MVC     .S2     IER,B4            ; |67| 
           MVK     .S1     16450,A0          ; |67| 
           OR      .S2X    A0,B4,B4          ; |67| 
           MVC     .S2     B4,IER            ; |67| 
           B       .S2     B3                ; |68| 
           NOP             5
           ; BRANCH OCCURS                   ; |68| 


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
           MVC     .S2     CSR,B4            ; |73| 
           OR      .S2     1,B4,B4           ; |73| 
           MVC     .S2     B4,CSR            ; |73| 
           B       .S2     B3                ; |74| 
           NOP             5
           ; BRANCH OCCURS                   ; |74| 


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
           MV      .S2X    A4,B4             ; |78| 
           SHL     .S2     B4,4,B5           ; |81| 

           ZERO    .S2     B4                ; |81| 
||         SUBAH   .D2     B5,B4,B5          ; |81| 

           CMPLTU  .L2     B4,B5,B0          ; |81| 
   [!B0]   B       .S1     L2                ; |81| 
           SUB     .D2     SP,8,SP           ; |78| 
           STW     .D2T1   A4,*+SP(4)        ; |78| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |81| 
           NOP             2
           ; BRANCH OCCURS                   ; |81| 
;** --------------------------------------------------------------------------*
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
           SHL     .S2     B5,4,B6           ; |81| 

           SUBAH   .D2     B6,B5,B5          ; |81| 
||         ADD     .S2     1,B4,B4           ; |81| 

           CMPLTU  .L2     B4,B5,B0          ; |81| 
   [ B0]   B       .S1     L1                ; |81| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |81| 
           NOP             4
           ; BRANCH OCCURS                   ; |81| 
;** --------------------------------------------------------------------------*
L2:    
           B       .S2     B3                ; |82| 
           ADD     .D2     8,SP,SP           ; |82| 
           NOP             4
           ; BRANCH OCCURS                   ; |82| 


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
           ZERO    .D2     B7                ; |89| 
           CMPLTU  .L2X    B7,A4,B0
   [!B0]   B       .S1     L4                ; |89| 
           SUB     .D2     SP,8,SP           ; |86| 
           STW     .D2T1   A4,*+SP(4)        ; |86| 
           MV      .L2     B3,B9             ; |86| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |90| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |90| 
           ; BRANCH OCCURS                   ; |89| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L3:    
           B       .S2     B4                ; |90| 
           MVKL    .S2     RL0,B3            ; |90| 
           MVKH    .S2     RL0,B3            ; |90| 
           MVK     .S1     0x3e8,A4          ; |90| 
           NOP             2
RL0:       ; CALL OCCURS                     ; |90| 
           LDW     .D2T2   *+SP(4),B4        ; |91| 
           ADD     .D2     1,B7,B7           ; |91| 
           NOP             3
           CMPLTU  .L2     B7,B4,B0          ; |91| 
   [ B0]   B       .S1     L3                ; |91| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |90| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |90| 
           NOP             3
           ; BRANCH OCCURS                   ; |91| 
;** --------------------------------------------------------------------------*
L4:    
           B       .S2     B9                ; |92| 
           ADD     .D2     8,SP,SP           ; |92| 
           NOP             4
           ; BRANCH OCCURS                   ; |92| 


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
           MVKL    .S1     _TFlag,A0         ; |97| 
           MVKH    .S1     _TFlag,A0         ; |97| 
           LDW     .D1T1   *A0,A1            ; |97| 
           NOP             4
   [ A1]   B       .S1     L6                ; |97| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |97| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |97| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |97| 
           NOP             2
           ; BRANCH OCCURS                   ; |97| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    
           NOP             2
   [!A1]   B       .S1     L5                ; |97| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |97| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |97| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |97| 
           NOP             2
           ; BRANCH OCCURS                   ; |97| 
;** --------------------------------------------------------------------------*
L6:    
           B       .S2     B3                ; |99| 
           MVKL    .S1     _TFlag,A0         ; |98| 
           MVKH    .S1     _TFlag,A0         ; |98| 
           ZERO    .D1     A3                ; |98| 
           STW     .D1T1   A3,*A0            ; |98| 
           NOP             1
           ; BRANCH OCCURS                   ; |99| 


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

           SUB     .D2     SP,8,SP           ; |103| 
||         MVKL    .S1     _TFlag,A0         ; |106| 

           STW     .D2T1   A4,*+SP(4)        ; |103| 
||         MVKH    .S1     _TFlag,A0         ; |106| 
||         ZERO    .D1     A3                ; |106| 

           STW     .D1T1   A3,*A0            ; |106| 
           LDW     .D2T2   *+SP(4),B5        ; |108| 
           ZERO    .D2     B4                ; |108| 
           STW     .D2T2   B4,*+SP(8)        ; |108| 
           MV      .S2     B3,B9             ; |103| 
           NOP             1
           CMPLTU  .L2     B4,B5,B0          ; |108| 
   [!B0]   B       .S1     L8                ; |108| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |109| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |109| 
           NOP             3
           ; BRANCH OCCURS                   ; |108| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
           B       .S2X    A0                ; |109| 
           MVKL    .S2     RL2,B3            ; |109| 
           MVKH    .S2     RL2,B3            ; |109| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |109| 
           LDW     .D2T2   *+SP(8),B4        ; |110| 
           LDW     .D2T2   *+SP(4),B5        ; |110| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |110| 
           CMPLTU  .L2     B4,B5,B0          ; |110| 
   [ B0]   B       .S1     L7                ; |110| 
           STW     .D2T2   B4,*+SP(8)        ; |110| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |109| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |109| 
           NOP             2
           ; BRANCH OCCURS                   ; |110| 
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B9                ; |111| 
           ADD     .D2     8,SP,SP           ; |111| 
           NOP             4
           ; BRANCH OCCURS                   ; |111| 


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
           SPDP    .S2     B4,B5:B4          ; |123| 
           ZERO    .D2     B6                ; |123| 
           MVKL    .S2     0xc048c000,B7     ; |123| 
           MVKH    .S2     0xc048c000,B7     ; |123| 

           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |123| 
||         ZERO    .D1     A0                ; |124| 
||         STW     .D2T2   B3,*SP--(16)      ; |114| 

           STW     .D2T1   A4,*+SP(4)        ; |114| 
||         MVKH    .S1     0xc2460000,A0     ; |124| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |124| 
           LDW     .D2T2   *+SP(4),B4        ; |127| 
           MVKL    .S1     0x4048c000,A1     ; |127| 
           ZERO    .D1     A0                ; |127| 
           MVKL    .S2     RL4,B3            ; |132| 
           MVKH    .S2     RL4,B3            ; |132| 
           SPDP    .S2     B4,B5:B4          ; |127| 
           MVKH    .S1     0x4048c000,A1     ; |127| 
           CMPGTDP .S1X    B5:B4,A1:A0,A1    ; |127| 
           MVKL    .S2     __divd,B8         ; |132| 
           MVKH    .S1     0x42460000,A0     ; |128| 
   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |128| 
           LDW     .D2T2   *+SP(4),B4        ; |132| 
           ZERO    .D1     A0                ; |132| 
           MVKH    .S1     0x42480000,A0     ; |132| 
           MVKH    .S2     __divd,B8         ; |132| 
           NOP             1
           ADDSP   .L2X    A0,B4,B5          ; |132| 
           MVKL    .S2     0x457ff000,B4     ; |132| 
           MVKH    .S2     0x457ff000,B4     ; |132| 
           NOP             1
           MPYSP   .M2     B4,B5,B4          ; |132| 
           ZERO    .D2     B5                ; |132| 
           MVKH    .S2     0x40590000,B5     ; |132| 
           B       .S2     B8                ; |132| 
           SPDP    .S2     B4,B7:B6          ; |132| 
           ZERO    .D2     B4                ; |132| 
           MV      .S1X    B6,A4             ; |132| 
           NOP             1
           MV      .S1X    B7,A5             ; |132| 
RL4:       ; CALL OCCURS                     ; |132| 
           DPSP    .L1     A5:A4,A0          ; |132| 
           NOP             3
           MV      .S2X    A0,B4             ; |132| 
           SPTRUNC .L2     B4,B4             ; |134| 
           STW     .D2T1   A0,*+SP(8)        ; |132| 
           MVKL    .S1     0x2000088,A0      ; |134| 
           MVKH    .S1     0x2000088,A0      ; |134| 
           STW     .D1T2   B4,*A0            ; |134| 
           LDW     .D2T1   *+SP(4),A4        ; |136| 
           LDW     .D2T2   *++SP(16),B3      ; |137| 
           NOP             4
           B       .S2     B3                ; |137| 
           NOP             5
           ; BRANCH OCCURS                   ; |137| 


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
           MVKL    .S2     0x200020c,B4      ; |145| 
           MVKH    .S2     0x200020c,B4      ; |145| 
           LDW     .D2T2   *B4,B4            ; |145| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |145| 
||         SUB     .D2     SP,16,SP          ; |139| 

           STH     .D2T2   B4,*+SP(4)        ; |145| 
           LDH     .D2T2   *+SP(4),B5        ; |148| 
           LDH     .D2T2   *+SP(4),B6        ; |148| 
           LDH     .D2T2   *+SP(4),B4        ; |149| 
           NOP             2

           MVK     .S1     32767,A3          ; |148| 
||         ZERO    .D1     A0                ; |149| 

           CMPGT   .L1X    B5,A3,A1          ; |148| 
||         MVKH    .S1     0x10000,A0        ; |149| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |148| 
||         SUB     .L2X    B4,A0,B4          ; |149| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |149| 
           LDW     .D2T2   *+SP(8),B4        ; |152| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |152| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |152| 

           MVKH    .S1     0x3fd68000,A1     ; |152| 
||         ZERO    .D1     A0                ; |152| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |152| 
           NOP             8
           B       .S2     B3                ; |154| 
           DPSP    .L1     A1:A0,A0          ; |152| 
           NOP             3

           ADDK    .S2     16,SP             ; |154| 
||         STW     .D2T1   A0,*+SP(12)       ; |152| 
||         MV      .D1     A0,A4             ; |152| 

           ; BRANCH OCCURS                   ; |154| 


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
           MVKL    .S2     0x2000210,B4      ; |162| 

           MVKH    .S2     0x2000210,B4      ; |162| 
||         STW     .D2T2   B3,*SP--(16)      ; |156| 

           LDW     .D2T1   *B4,A0            ; |162| 
           NOP             4
           EXTU    .S1     A0,16,16,A0       ; |162| 
           STH     .D2T1   A0,*+SP(4)        ; |162| 
           LDH     .D2T2   *+SP(4),B7        ; |165| 
           LDH     .D2T2   *+SP(4),B5        ; |166| 
           LDH     .D2T2   *+SP(4),B4        ; |165| 
           NOP             2

           ZERO    .D1     A0                ; |166| 
||         MVK     .S2     32767,B6          ; |165| 

           CMPGT   .L2     B7,B6,B0          ; |165| 
||         MVKH    .S1     0x10000,A0        ; |166| 

           SUB     .L2X    B5,A0,B4          ; |166| 
|| [!B0]   STW     .D2T2   B4,*+SP(8)        ; |165| 

   [ B0]   STW     .D2T2   B4,*+SP(8)        ; |166| 
           LDW     .D2T2   *+SP(8),B4        ; |169| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |169| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |169| 

           ZERO    .D1     A0                ; |169| 
||         MVKH    .S1     0x3fd68000,A1     ; |169| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |169| 
           NOP             9
           DPSP    .L1     A1:A0,A0          ; |169| 
           NOP             3
           MV      .S2X    A0,B4             ; |169| 

           SPDP    .S2     B4,B7:B6          ; |174| 
||         MVKL    .S1     _fmod,A0          ; |174| 
||         STW     .D2T1   A0,*+SP(12)       ; |169| 

           MVKH    .S1     _fmod,A0          ; |174| 
           B       .S2X    A0                ; |174| 
           NOP             1
           MVKL    .S2     RL6,B3            ; |174| 
           MVKH    .S2     RL6,B3            ; |174| 

           MV      .S1X    B6,A4             ; |174| 
||         MVKL    .S2     0x40768000,B5     ; |174| 

           ZERO    .D2     B4                ; |174| 
||         MV      .S1X    B7,A5             ; |174| 
||         MVKH    .S2     0x40768000,B5     ; |174| 

RL6:       ; CALL OCCURS                     ; |174| 
           DPSP    .L1     A5:A4,A0          ; |174| 
           NOP             3
           MV      .S2X    A0,B5             ; |174| 

           ZERO    .D1     A0                ; |176| 
||         STW     .D2T1   A0,*+SP(12)       ; |174| 
||         MV      .S2X    A0,B4             ; |174| 

           MVKH    .S1     0x43b40000,A0     ; |176| 
           ADDSP   .L2X    A0,B4,B4          ; |176| 
           NOP             1
           ZERO    .D2     B6                ; |175| 
           CMPLTSP .S2     B5,B6,B0          ; |175| 
   [ B0]   STW     .D2T2   B4,*+SP(12)       ; |176| 
           LDW     .D2T1   *+SP(12),A4       ; |179| 
           LDW     .D2T2   *++SP(16),B3      ; |180| 
           NOP             4
           B       .S2     B3                ; |180| 
           NOP             5
           ; BRANCH OCCURS                   ; |180| 


	.sect	".text"
	.global	_GetPendulumAngularVelocity

;******************************************************************************
;* FUNCTION NAME: _GetPendulumAngularVelocity                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 12 Auto + 4 Save = 16 byte                  *
;******************************************************************************
_GetPendulumAngularVelocity:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GetPendulumAngle,A3 ; |195| 
           MVKH    .S1     _GetPendulumAngle,A3 ; |195| 
           B       .S2X    A3                ; |195| 
           NOP             2
           MVKL    .S1     0x3a83126f,A0     ; |192| 

           MVKH    .S1     0x3a83126f,A0     ; |192| 
||         MVKL    .S2     RL8,B3            ; |195| 
||         STW     .D2T2   B3,*SP--(16)      ; |188| 

           STW     .D2T1   A0,*+SP(12)       ; |192| 
||         MVKH    .S2     RL8,B3            ; |195| 

RL8:       ; CALL OCCURS                     ; |195| 
           MVKL    .S1     0x400921fb,A1     ; |198| 

           MVKH    .S1     0x400921fb,A1     ; |198| 
||         MV      .S2X    A4,B4             ; |195| 

           SPDP    .S2     B4,B5:B4          ; |198| 
||         MVKL    .S1     0x54442d18,A0     ; |198| 

           MVKH    .S1     0x54442d18,A0     ; |198| 

           MPYDP   .M1X    A1:A0,B5:B4,A5:A4 ; |198| 
||         STW     .D2T1   A4,*+SP(4)        ; |195| 

           NOP             2
           MVKL    .S1     __divd,A0         ; |198| 
           MVKH    .S1     __divd,A0         ; |198| 
           B       .S2X    A0                ; |198| 
           NOP             1
           MVKL    .S2     RL10,B3           ; |198| 
           MVKH    .S2     RL10,B3           ; |198| 
           MVKL    .S2     0x40668000,B5     ; |198| 

           MVKH    .S2     0x40668000,B5     ; |198| 
||         ZERO    .D2     B4                ; |198| 

RL10:      ; CALL OCCURS                     ; |198| 
           DPSP    .L1     A5:A4,A0          ; |198| 
           NOP             2
           MVKL    .S2     _prev_angle$1,B4  ; |201| 

           STW     .D2T1   A0,*+SP(4)        ; |198| 
||         MVKH    .S2     _prev_angle$1,B4  ; |201| 

           LDW     .D2T2   *B4,B6            ; |201| 
           NOP             1
           MVKL    .S2     __divf,B5         ; |201| 
           MVKH    .S2     __divf,B5         ; |201| 
           B       .S2     B5                ; |201| 

           LDW     .D2T2   *+SP(12),B4       ; |201| 
||         SUBSP   .L2X    A0,B6,B6

           NOP             2
           MVKL    .S2     RL12,B3           ; |201| 

           MV      .S1X    B6,A4             ; |201| 
||         MVKH    .S2     RL12,B3           ; |201| 

RL12:      ; CALL OCCURS                     ; |201| 
           LDW     .D2T2   *+SP(4),B4        ; |204| 
           NOP             2
           MVKL    .S1     _prev_angle$1,A0  ; |204| 

           MVKH    .S1     _prev_angle$1,A0  ; |204| 
||         STW     .D2T1   A4,*+SP(8)        ; |201| 

           STW     .D1T2   B4,*A0            ; |204| 
           LDW     .D2T1   *+SP(8),A4        ; |206| 
           LDW     .D2T2   *++SP(16),B3      ; |207| 
           NOP             4
           B       .S2     B3                ; |207| 
           NOP             5
           ; BRANCH OCCURS                   ; |207| 


	.sect	".text"
	.global	_SwingUpControl

;******************************************************************************
;* FUNCTION NAME: _SwingUpControl                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 40 Auto + 4 Save = 44 byte                  *
;******************************************************************************
_SwingUpControl:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GetPendulumAngle,A0 ; |219| 
           MVKH    .S1     _GetPendulumAngle,A0 ; |219| 
           B       .S2X    A0                ; |219| 
           NOP             1
           MVKL    .S2     0x3d4ccccd,B4     ; |216| 

           MVKL    .S2     RL14,B3           ; |219| 
||         STW     .D2T2   B3,*SP--(48)      ; |210| 

           MVKH    .S2     0x3d4ccccd,B4     ; |216| 

           STW     .D2T2   B4,*+SP(40)       ; |216| 
||         MVKH    .S2     RL14,B3           ; |219| 

RL14:      ; CALL OCCURS                     ; |219| 
           MVKL    .S1     0x400921fb,A1     ; |222| 

           MVKH    .S1     0x400921fb,A1     ; |222| 
||         MV      .S2X    A4,B4             ; |219| 

           SPDP    .S2     B4,B5:B4          ; |222| 
||         MVKL    .S1     0x54442d18,A0     ; |222| 

           MVKH    .S1     0x54442d18,A0     ; |222| 

           MPYDP   .M1X    A1:A0,B5:B4,A5:A4 ; |222| 
||         STW     .D2T1   A4,*+SP(4)        ; |219| 

           NOP             2
           MVKL    .S1     __divd,A0         ; |222| 
           MVKH    .S1     __divd,A0         ; |222| 
           B       .S2X    A0                ; |222| 
           NOP             1
           MVKL    .S2     RL16,B3           ; |222| 
           MVKH    .S2     RL16,B3           ; |222| 
           MVKL    .S2     0x40668000,B5     ; |222| 

           MVKH    .S2     0x40668000,B5     ; |222| 
||         ZERO    .D2     B4                ; |222| 

RL16:      ; CALL OCCURS                     ; |222| 
           MVKL    .S1     _GetPendulumAngularVelocity,A0 ; |225| 
           MVKH    .S1     _GetPendulumAngularVelocity,A0 ; |225| 
           B       .S2X    A0                ; |225| 
           DPSP    .L1     A5:A4,A3          ; |222| 
           NOP             2
           MVKL    .S2     RL18,B3           ; |225| 

           STW     .D2T1   A3,*+SP(4)        ; |222| 
||         MVKH    .S2     RL18,B3           ; |225| 

RL18:      ; CALL OCCURS                     ; |225| 
           MVKL    .S2     _GetCartPos,B4    ; |228| 
           MVKH    .S2     _GetCartPos,B4    ; |228| 
           B       .S2     B4                ; |228| 
           NOP             3
           MVKL    .S2     RL20,B3           ; |228| 

           STW     .D2T1   A4,*+SP(8)        ; |225| 
||         MVKH    .S2     RL20,B3           ; |228| 

RL20:      ; CALL OCCURS                     ; |228| 
           LDW     .D2T2   *+SP(8),B4        ; |231| 
           NOP             2
           MVKL    .S1     0x3fd33333,A1     ; |231| 
           MVKH    .S1     0x3fd33333,A1     ; |231| 

           SPDP    .S2     B4,B5:B4          ; |231| 
||         MVKL    .S1     0x33333333,A0     ; |231| 

           MVKH    .S1     0x33333333,A0     ; |231| 
           MPYDP   .M1X    B5:B4,A1:A0,A1:A0 ; |231| 
           NOP             9

           MVKL    .S1     _pow,A0           ; |231| 
||         MV      .D1     A0,A4             ; |231| 
||         MV      .L1     A4,A3             ; |228| 

           MVKH    .S1     _pow,A0           ; |231| 
           B       .S2X    A0                ; |231| 
           NOP             2

           MVKL    .S2     RL22,B3           ; |231| 
||         ZERO    .D2     B5                ; |231| 

           MVKH    .S2     0x40000000,B5     ; |231| 

           MVKH    .S2     RL22,B3           ; |231| 
||         STW     .D2T1   A3,*+SP(36)       ; |228| 
||         ZERO    .L2     B4                ; |231| 
||         MV      .D1     A1,A5             ; |231| 

RL22:      ; CALL OCCURS                     ; |231| 
           MVKL    .S1     0x3fc1eb85,A1     ; |231| 
           MVKL    .S1     0x1eb851ec,A0     ; |231| 
           MVKH    .S1     0x3fc1eb85,A1     ; |231| 
           MVKH    .S1     0x1eb851ec,A0     ; |231| 
           MPYDP   .M1     A5:A4,A1:A0,A1:A0 ; |231| 
           NOP             5
           LDW     .D2T2   *+SP(4),B4        ; |232| 
           MVKL    .S2     _cos,B6           ; |232| 
           MVKH    .S2     _cos,B6           ; |232| 
           B       .S2     B6                ; |232| 
           DPSP    .L1     A1:A0,A0          ; |231| 
           SPDP    .S2     B4,B5:B4          ; |232| 
           NOP             1

           MV      .S1X    B5,A5             ; |232| 
||         MVKL    .S2     RL24,B3           ; |232| 

           MV      .S1X    B4,A4             ; |232| 
||         MVKH    .S2     RL24,B3           ; |232| 
||         STW     .D2T1   A0,*+SP(24)       ; |231| 

RL24:      ; CALL OCCURS                     ; |232| 
           ZERO    .D2     B5                ; |232| 

           MVKH    .S2     0x3ff00000,B5     ; |232| 
||         ZERO    .D2     B4                ; |232| 

           SUBDP   .L2X    B5:B4,A5:A4,B7:B6 ; |232| 
           NOP             2
           MVKL    .S2     0x2253111f,B4     ; |232| 
           MVKL    .S2     0x3fea5e89,B5     ; |232| 
           MVKH    .S2     0x2253111f,B4     ; |232| 
           MVKH    .S2     0x3fea5e89,B5     ; |232| 
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |232| 
           NOP             9

           LDW     .D2T2   *+SP(24),B5       ; |235| 
||         DPSP    .L2     B5:B4,B4          ; |232| 

           NOP             4

           ADDSP   .L2     B4,B5,B4          ; |235| 
||         STW     .D2T2   B4,*+SP(28)       ; |232| 

           NOP             1
           MVKL    .S1     0x3f52f449,A0     ; |238| 
           MVKH    .S1     0x3f52f449,A0     ; |238| 

           SUBSP   .L2X    A0,B4,B4
||         STW     .D2T2   B4,*+SP(12)       ; |235| 

           NOP             2

           MVKL    .S1     _control_duration$2,A0 ; |243| 
||         STW     .D2T1   A0,*+SP(16)       ; |238| 

           MVKH    .S1     _control_duration$2,A0 ; |243| 
||         STW     .D2T2   B4,*+SP(20)       ; |241| 

           LDW     .D1T1   *A0,A4            ; |243| 
           NOP             4

           LDW     .D2T2   *+SP(36),B6       ; |253| 
||         CMPGT   .L1     A4,0,A2           ; |243| 

   [!A2]   B       .S1     L10               ; |243| 
           NOP             1
           ZERO    .D1     A3                ; |253| 

           MVKH    .S1     0x447a0000,A3     ; |253| 
||         MVKL    .S2     _control_duration$2,B4 ; |245| 

           CMPGTSP .S1X    B6,A3,A1          ; |253| 
||         MVKH    .S2     _control_duration$2,B4 ; |245| 
||         ZERO    .D2     B5                ; |246| 

           MV      .S1X    B4,A0             ; |245| 
||         MVKH    .S2     0x447a0000,B5     ; |246| 

           ; BRANCH OCCURS                   ; |243| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A3            ; |245| 
           MVKL    .S2     _PWMOut,B4        ; |247| 
           MVKL    .S2     RL26,B3           ; |247| 
           MVKH    .S2     RL26,B3           ; |247| 
           ZERO    .D1     A4                ; |247| 
           SUB     .D1     A3,1,A3           ; |245| 
           STW     .D1T1   A3,*A0            ; |245| 
           LDW     .D2T2   *+SP(36),B8       ; |246| 
           MVKH    .S1     0xc2480000,A4     ; |247| 
           NOP             3
           CMPGTSP .S2     B8,B5,B1          ; |246| 
   [!B1]   B       .S1     L9                ; |246| 
           ZERO    .D2     B6                ; |248| 
           MVKH    .S2     0xc47a0000,B6     ; |248| 
           MVKH    .S2     _PWMOut,B4        ; |247| 
           MV      .D2     B8,B7             ; |248| 
           CMPLTSP .S2     B7,B6,B0          ; |248| 
           ; BRANCH OCCURS                   ; |246| 
;** --------------------------------------------------------------------------*
           B       .S2     B4                ; |247| 
           NOP             5
RL26:      ; CALL OCCURS                     ; |247| 
           LDW     .D2T2   *++SP(48),B3      ; |265| 
           NOP             4
           B       .S2     B3                ; |265| 
           NOP             5
           ; BRANCH OCCURS                   ; |265| ; chained return
;** --------------------------------------------------------------------------*
L9:    
   [!B0]   B       .S1     L13               ; |248| 
           MVKL    .S2     _PWMOut,B4        ; |249| 
           MVKL    .S2     RL28,B3           ; |249| 

           MVKH    .S2     _PWMOut,B4        ; |249| 
||         ZERO    .D1     A4                ; |249| 

           MVKH    .S1     0x42480000,A4     ; |249| 
||         MVKH    .S2     RL28,B3           ; |249| 
|| [!B0]   LDW     .D2T2   *++SP(48),B3      ; |265| 

           NOP             1
           ; BRANCH OCCURS                   ; |248| 
;** --------------------------------------------------------------------------*
           B       .S2     B4                ; |249| 
           NOP             5
RL28:      ; CALL OCCURS                     ; |249| 
           LDW     .D2T2   *++SP(48),B3      ; |265| 
           NOP             4
           B       .S2     B3                ; |265| 
           NOP             5
           ; BRANCH OCCURS                   ; |265| ; chained return
;** --------------------------------------------------------------------------*
L10:    

   [!A1]   B       .S1     L11               ; |253| 
||         MVKL    .S2     RL30,B3           ; |255| 

           MVKL    .S2     _PWMOut,B5        ; |255| 
||         ZERO    .D2     B4                ; |255| 

           MVKH    .S2     0xc1f00000,B4     ; |255| 
||         MVKL    .S1     _control_duration$2,A3 ; |254| 

           MVKH    .S2     RL30,B3           ; |255| 
||         MVK     .S1     150,A5            ; |254| 
||         ZERO    .D1     A0                ; |256| 

           MVKH    .S2     _PWMOut,B5        ; |255| 
||         MVKH    .S1     0xc47a0000,A0     ; |256| 

           CMPLTSP .S2X    B6,A0,B0          ; |256| 
||         MV      .L1X    B4,A4             ; |255| 
||         MVKH    .S1     _control_duration$2,A3 ; |254| 

           ; BRANCH OCCURS                   ; |253| 
;** --------------------------------------------------------------------------*
           B       .S2     B5                ; |255| 
           STW     .D1T1   A5,*A3            ; |254| 
           NOP             4
RL30:      ; CALL OCCURS                     ; |255| 
           LDW     .D2T2   *++SP(48),B3      ; |265| 
           NOP             4
           B       .S2     B3                ; |265| 
           NOP             5
           ; BRANCH OCCURS                   ; |265| ; chained return
;** --------------------------------------------------------------------------*
L11:    
           MVKL    .S2     _PWMOut,B6        ; |262| 

   [!B0]   B       .S1     L12               ; |256| 
||         LDW     .D2T2   *+SP(20),B4       ; |261| 
||         MVKL    .S2     RL32,B3           ; |258| 

           MVKL    .S2     _PWMOut,B7        ; |258| 
||         ZERO    .D2     B5                ; |258| 

           MVKH    .S2     0x41f00000,B5     ; |258| 
||         MVKL    .S1     _control_duration$2,A5 ; |257| 

           MVKH    .S2     _PWMOut,B6        ; |262| 
||         MVK     .S1     150,A3            ; |257| 
||         ZERO    .D1     A0                ; |261| 

           MVKH    .S2     RL32,B3           ; |258| 
||         MVKH    .S1     0xc2480000,A0     ; |261| 

           MPYSP   .M2X    B4,A0,B4          ; |261| 
||         MV      .L1X    B5,A4             ; |258| 
||         MVKH    .S2     _PWMOut,B7        ; |258| 
||         MVKH    .S1     _control_duration$2,A5 ; |257| 

           ; BRANCH OCCURS                   ; |256| 
;** --------------------------------------------------------------------------*
           B       .S2     B7                ; |258| 
           STW     .D1T1   A3,*A5            ; |257| 
           NOP             4
RL32:      ; CALL OCCURS                     ; |258| 
           LDW     .D2T2   *++SP(48),B3      ; |265| 
           NOP             4
           B       .S2     B3                ; |265| 
           NOP             5
           ; BRANCH OCCURS                   ; |265| ; chained return
;** --------------------------------------------------------------------------*
L12:    
           B       .S2     B6                ; |262| 
           NOP             3
           MVKL    .S2     RL34,B3           ; |262| 

           MV      .S1X    B4,A4             ; |262| 
||         STW     .D2T2   B4,*+SP(32)       ; |261| 
||         MVKH    .S2     RL34,B3           ; |262| 

RL34:      ; CALL OCCURS                     ; |262| 
           LDW     .D2T2   *++SP(48),B3      ; |265| 
           NOP             1
;** --------------------------------------------------------------------------*
L13:    
           NOP             3
           B       .S2     B3                ; |265| 
           NOP             5
           ; BRANCH OCCURS                   ; |265| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |278| 
           MVKH    .S1     _InitEXINTF,A0    ; |278| 
           B       .S2X    A0                ; |278| 
           STW     .D2T2   B3,*SP--(24)      ; |277| 
           MVKL    .S2     RL40,B3           ; |278| 
           MVKH    .S2     RL40,B3           ; |278| 
           NOP             2
RL40:      ; CALL OCCURS                     ; |278| 
           MVKL    .S1     _InitTimer,A0     ; |279| 
           MVKH    .S1     _InitTimer,A0     ; |279| 
           B       .S2X    A0                ; |279| 
           MVKL    .S2     RL42,B3           ; |279| 
           MVKH    .S2     RL42,B3           ; |279| 
           NOP             3
RL42:      ; CALL OCCURS                     ; |279| 
           MVKL    .S2     _InitUART,B4      ; |280| 
           MVKH    .S2     _InitUART,B4      ; |280| 
           B       .S2     B4                ; |280| 
           MVKL    .S2     RL44,B3           ; |280| 
           MVKH    .S2     RL44,B3           ; |280| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |280| 
           MVKL    .S1     _InitINT,A0       ; |281| 
           MVKH    .S1     _InitINT,A0       ; |281| 
           B       .S2X    A0                ; |281| 
           MVKL    .S2     RL46,B3           ; |281| 
           MVKH    .S2     RL46,B3           ; |281| 
           NOP             3
RL46:      ; CALL OCCURS                     ; |281| 
           MVKL    .S1     _InitUSBMon,A0    ; |282| 
           MVKH    .S1     _InitUSBMon,A0    ; |282| 
           B       .S2X    A0                ; |282| 
           MVKL    .S2     RL48,B3           ; |282| 
           MVKH    .S2     RL48,B3           ; |282| 
           NOP             3
RL48:      ; CALL OCCURS                     ; |282| 
           MVKL    .S1     _sprintf,A0       ; |284| 

           MVKH    .S1     _sprintf,A0       ; |284| 
||         MVKL    .S2     SL1+0,B5          ; |284| 

           B       .S2X    A0                ; |284| 
           MVKL    .S2     RL50,B3           ; |284| 
           MVKH    .S2     SL1+0,B5          ; |284| 
           MVKL    .S2     _tmp_string,B4    ; |284| 
           MVKH    .S2     _tmp_string,B4    ; |284| 

           MVKH    .S2     RL50,B3           ; |284| 
||         STW     .D2T2   B5,*+SP(4)        ; |284| 
||         MV      .S1X    B4,A4             ; |284| 

RL50:      ; CALL OCCURS                     ; |284| 
           MVKL    .S1     _Report,A0        ; |284| 
           MVKH    .S1     _Report,A0        ; |284| 
           B       .S2X    A0                ; |284| 
           MVKL    .S2     RL52,B3           ; |284| 
           MVKH    .S2     RL52,B3           ; |284| 
           NOP             3
RL52:      ; CALL OCCURS                     ; |284| 
           MVK     .S1     2024,A0           ; |285| 

           MVKL    .S1     _sprintf,A0       ; |285| 
||         STW     .D2T1   A0,*+SP(8)        ; |285| 

           MVKH    .S1     _sprintf,A0       ; |285| 
||         MVKL    .S2     _tmp_string,B5    ; |285| 

           B       .S2X    A0                ; |285| 
           MVKL    .S2     SL2+0,B4          ; |285| 
           MVKH    .S2     _tmp_string,B5    ; |285| 
           MVKH    .S2     SL2+0,B4          ; |285| 
           MVKL    .S2     RL54,B3           ; |285| 

           MVKH    .S2     RL54,B3           ; |285| 
||         STW     .D2T2   B4,*+SP(4)        ; |285| 
||         MV      .S1X    B5,A4             ; |285| 

RL54:      ; CALL OCCURS                     ; |285| 
           MVKL    .S1     _Report,A0        ; |285| 
           MVKH    .S1     _Report,A0        ; |285| 
           B       .S2X    A0                ; |285| 
           MVKL    .S2     RL56,B3           ; |285| 
           MVKH    .S2     RL56,B3           ; |285| 
           NOP             3
RL56:      ; CALL OCCURS                     ; |285| 
           MVKL    .S2     SL3+0,B4          ; |286| 
           MVKL    .S2     0x20003fc,B5      ; |286| 
           MVKH    .S2     SL3+0,B4          ; |286| 

           STW     .D2T2   B4,*+SP(4)        ; |286| 
||         MVKH    .S2     0x20003fc,B5      ; |286| 

           LDW     .D2T2   *B5,B4            ; |286| 
           MVKL    .S1     0x20003fc,A0      ; |286| 
           MVKH    .S1     0x20003fc,A0      ; |286| 
           MVKL    .S1     _tmp_string,A4    ; |286| 
           MVKL    .S2     RL58,B3           ; |286| 
           EXTU    .S2     B4,16,24,B4       ; |286| 
           STW     .D2T2   B4,*+SP(8)        ; |286| 

           MVKL    .S1     _sprintf,A0       ; |286| 
||         LDW     .D1T1   *A0,A3            ; |286| 

           MVKH    .S1     _sprintf,A0       ; |286| 
           B       .S2X    A0                ; |286| 
           MVKH    .S1     _tmp_string,A4    ; |286| 
           MVKH    .S2     RL58,B3           ; |286| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |286| 
           STW     .D2T1   A3,*+SP(12)       ; |286| 
RL58:      ; CALL OCCURS                     ; |286| 
           MVKL    .S1     _Report,A0        ; |286| 
           MVKH    .S1     _Report,A0        ; |286| 
           B       .S2X    A0                ; |286| 
           MVKL    .S2     RL60,B3           ; |286| 
           MVKH    .S2     RL60,B3           ; |286| 
           NOP             3
RL60:      ; CALL OCCURS                     ; |286| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |290| 
           MVKH    .S1     _GIE,A0           ; |290| 
           B       .S2X    A0                ; |290| 
           MVKL    .S2     _TFlag,B4         ; |288| 
           MVKL    .S2     RL62,B3           ; |290| 
           MVKH    .S2     _TFlag,B4         ; |288| 
           ZERO    .D2     B5                ; |288| 

           STW     .D2T2   B5,*B4            ; |288| 
||         MVKH    .S2     RL62,B3           ; |290| 

RL62:      ; CALL OCCURS                     ; |290| 
           MVKL    .S2     _WaitTFlagCnt,B7  ; |295| 
           MVKL    .S2     0x200008c,B6      ; |293| 
           MVKH    .S2     _WaitTFlagCnt,B7  ; |295| 
           MVKH    .S2     0x200008c,B6      ; |293| 
           MVKL    .S2     0x200004c,B5      ; |291| 
           B       .S2     B7                ; |295| 
           MVKH    .S2     0x200004c,B5      ; |291| 

           MVKL    .S2     0x2000080,B4      ; |292| 
||         MVK     .S1     1,A0              ; |291| 

           STW     .D2T1   A0,*B5            ; |291| 
||         MVKH    .S2     0x2000080,B4      ; |292| 

           STW     .D2T1   A0,*B4            ; |292| 
||         MVKL    .S2     RL64,B3           ; |295| 

           STW     .D2T1   A0,*B6            ; |293| 
||         MVKH    .S2     RL64,B3           ; |295| 
||         MVK     .S1     0x3e8,A4          ; |295| 

RL64:      ; CALL OCCURS                     ; |295| 
           MVKL    .S1     _TINTCnt,A0       ; |297| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L14
;** --------------------------------------------------------------------------*
L14:    

           MVKH    .S1     _TINTCnt,A0       ; |297| 
||         ZERO    .D1     A3                ; |297| 

           STW     .D1T1   A3,*A0            ; |297| 
           MVKL    .S1     0x200004c,A0      ; |300| 
           MVKH    .S1     0x200004c,A0      ; |300| 
           LDW     .D1T1   *A0,A3            ; |300| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L15:    
           MVKL    .S2     _TINTCnt,B4       ; |303| 
           MVKH    .S2     _TINTCnt,B4       ; |303| 
           XOR     .S1     1,A3,A3           ; |300| 
           STW     .D1T1   A3,*A0            ; |300| 
           LDW     .D2T2   *B4,B4            ; |303| 
           MVK     .S2     500,B5            ; |303| 
           NOP             3
           CMPGTU  .L2     B4,B5,B0          ; |303| 
   [!B0]   B       .S1     L15               ; |303| 
   [!B0]   MVKL    .S1     0x200004c,A0      ; |300| 
   [!B0]   MVKH    .S1     0x200004c,A0      ; |300| 

   [ B0]   MVKL    .S1     _timerCheckCnt,A0 ; |305| 
|| [!B0]   LDW     .D1T1   *A0,A3            ; |300| 

   [ B0]   MVKH    .S1     _timerCheckCnt,A0 ; |305| 
   [ B0]   LDW     .D1T1   *A0,A3            ; |305| 
           ; BRANCH OCCURS                   ; |303| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     SL4+0,B4          ; |306| 
           MVKL    .S2     _timerCheckCnt,B5 ; |306| 
           MVKH    .S2     SL4+0,B4          ; |306| 
           MVKH    .S2     _timerCheckCnt,B5 ; |306| 
           ADD     .D1     1,A3,A3           ; |305| 

           MVKL    .S1     _sprintf,A0       ; |306| 
||         STW     .D1T1   A3,*A0            ; |305| 

           STW     .D2T2   B4,*+SP(4)        ; |306| 
||         MVKH    .S1     _sprintf,A0       ; |306| 

           B       .S2X    A0                ; |306| 
||         LDW     .D2T2   *B5,B4            ; |306| 

           MVKL    .S2     RL66,B3           ; |306| 
           MVKH    .S2     RL66,B3           ; |306| 
           NOP             1
           MVKL    .S1     _tmp_string,A4    ; |306| 

           MVKH    .S1     _tmp_string,A4    ; |306| 
||         STW     .D2T2   B4,*+SP(8)        ; |306| 

RL66:      ; CALL OCCURS                     ; |306| 
           MVKL    .S1     _Report,A0        ; |306| 
           MVKH    .S1     _Report,A0        ; |306| 
           B       .S2X    A0                ; |306| 
           MVKL    .S2     RL68,B3           ; |306| 
           MVKH    .S2     RL68,B3           ; |306| 
           NOP             3
RL68:      ; CALL OCCURS                     ; |306| 
           MVKL    .S1     _GetPendulumAngle,A0 ; |309| 
           MVKH    .S1     _GetPendulumAngle,A0 ; |309| 
           B       .S2X    A0                ; |309| 
           MVKL    .S2     RL72,B3           ; |309| 
           MVKH    .S2     RL72,B3           ; |309| 
           NOP             3
RL72:      ; CALL OCCURS                     ; |309| 
           SPDP    .S2X    A4,B7:B6          ; |309| 
           MVKL    .S1     _sprintf,A0       ; |309| 

           MVKH    .S1     _sprintf,A0       ; |309| 
||         MVKL    .S2     SL5+0,B9          ; |309| 

           B       .S2X    A0                ; |309| 
           MVKL    .S2     _tmp_string,B8    ; |309| 

           MV      .D2     B6,B5             ; |309| 
||         MVKL    .S2     RL74,B3           ; |309| 

           MV      .L2     B7,B4             ; |309| 
||         MVKH    .S2     SL5+0,B9          ; |309| 
||         STW     .D2T2   B5,*+SP(8)        ; |309| 

           MVKH    .S2     _tmp_string,B8    ; |309| 
||         STW     .D2T2   B4,*+SP(12)       ; |309| 

           MVKH    .S2     RL74,B3           ; |309| 
||         MV      .S1X    B8,A4             ; |309| 
||         STW     .D2T2   B9,*+SP(4)        ; |309| 

RL74:      ; CALL OCCURS                     ; |309| 
           MVKL    .S1     _Report,A0        ; |309| 
           MVKH    .S1     _Report,A0        ; |309| 
           B       .S2X    A0                ; |309| 
           MVKL    .S2     RL76,B3           ; |309| 
           MVKH    .S2     RL76,B3           ; |309| 
           NOP             3
RL76:      ; CALL OCCURS                     ; |309| 
           MVKL    .S1     _GetCartPos,A0    ; |312| 
           MVKH    .S1     _GetCartPos,A0    ; |312| 
           B       .S2X    A0                ; |312| 
           MVKL    .S2     RL80,B3           ; |312| 
           MVKH    .S2     RL80,B3           ; |312| 
           NOP             3
RL80:      ; CALL OCCURS                     ; |312| 
           SPDP    .S1     A4,A1:A0          ; |312| 
           MVKL    .S2     RL82,B3           ; |312| 

           MVKL    .S1     _sprintf,A0       ; |312| 
||         STW     .D2T1   A0,*+SP(8)        ; |312| 

           MVKH    .S1     _sprintf,A0       ; |312| 
           B       .S2X    A0                ; |312| 
           MVKL    .S2     SL6+0,B5          ; |312| 
           MVKH    .S2     SL6+0,B5          ; |312| 
           MVKL    .S2     _tmp_string,B4    ; |312| 

           MV      .D1     A1,A3             ; |312| 
||         MVKH    .S2     _tmp_string,B4    ; |312| 
||         STW     .D2T2   B5,*+SP(4)        ; |312| 

           MVKH    .S2     RL82,B3           ; |312| 
||         MV      .S1X    B4,A4             ; |312| 
||         STW     .D2T1   A3,*+SP(12)       ; |312| 

RL82:      ; CALL OCCURS                     ; |312| 
           MVKL    .S1     _Report,A0        ; |312| 
           MVKH    .S1     _Report,A0        ; |312| 
           B       .S2X    A0                ; |312| 
           MVKL    .S2     RL84,B3           ; |312| 
           MVKH    .S2     RL84,B3           ; |312| 
           NOP             3
RL84:      ; CALL OCCURS                     ; |312| 
           MVKL    .S2     _sprintf,B4       ; |314| 
           MVKH    .S2     _sprintf,B4       ; |314| 
           B       .S2     B4                ; |314| 
           MVKL    .S2     RL86,B3           ; |314| 
           MVKL    .S2     SL7+0,B5          ; |314| 
           MVKH    .S2     SL7+0,B5          ; |314| 
           MVKL    .S1     _tmp_string,A4    ; |314| 

           MVKH    .S2     RL86,B3           ; |314| 
||         MVKH    .S1     _tmp_string,A4    ; |314| 
||         STW     .D2T2   B5,*+SP(4)        ; |314| 

RL86:      ; CALL OCCURS                     ; |314| 
           MVKL    .S2     _Report,B4        ; |314| 
           MVKH    .S2     _Report,B4        ; |314| 
           B       .S2     B4                ; |314| 
           MVKL    .S2     RL88,B3           ; |314| 
           MVKH    .S2     RL88,B3           ; |314| 
           NOP             3
RL88:      ; CALL OCCURS                     ; |314| 
           B       .S1     L14               ; |317| 
           MVKL    .S1     _TINTCnt,A0       ; |297| 
           NOP             4
           ; BRANCH OCCURS                   ; |317| 


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
	.global	_pow
	.global	_cos
	.global	_fmod
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	__divd
	.global	__divf
