;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Thu Jun 06 13:47:19 2024                                *
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
	.field  	_R+0,32
	.word	044340000h		; _R @ 0
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
	.field  	_pos_t+0,32
	.word	000000000h		; _pos_t @ 0
	.sect	".text"
	.global	_pos_t
_pos_t:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_vel_t+0,32
	.word	000000000h		; _vel_t @ 0
	.sect	".text"
	.global	_vel_t
_vel_t:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\opqrs\AppData\Local\Temp\TI20812_2 --template_info_file C:\Users\opqrs\AppData\Local\Temp\TI20812_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           MV      .S2X    A4,B4             ; |113| 
           SPDP    .S2     B4,B5:B4          ; |131| 
           ZERO    .D2     B6                ; |131| 
           MVKL    .S2     0xc048c000,B7     ; |131| 
           MVKH    .S2     0xc048c000,B7     ; |131| 

           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |131| 
||         ZERO    .D1     A0                ; |132| 
||         STW     .D2T2   B3,*SP--(16)      ; |113| 

           STW     .D2T1   A4,*+SP(4)        ; |113| 
||         MVKH    .S1     0xc2460000,A0     ; |132| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |132| 
           LDW     .D2T2   *+SP(4),B4        ; |134| 
           MVKL    .S1     0x4048c000,A1     ; |134| 
           ZERO    .D1     A0                ; |134| 
           MVKL    .S2     RL4,B3            ; |139| 
           MVKH    .S2     RL4,B3            ; |139| 
           SPDP    .S2     B4,B5:B4          ; |134| 
           MVKH    .S1     0x4048c000,A1     ; |134| 
           CMPGTDP .S1X    B5:B4,A1:A0,A1    ; |134| 
           MVKL    .S2     __divd,B8         ; |139| 
           MVKH    .S1     0x42460000,A0     ; |135| 
   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |135| 
           LDW     .D2T2   *+SP(4),B4        ; |139| 
           ZERO    .D1     A0                ; |139| 
           MVKH    .S1     0x42480000,A0     ; |139| 
           MVKH    .S2     __divd,B8         ; |139| 
           NOP             1
           ADDSP   .L2X    A0,B4,B5          ; |139| 
           MVKL    .S2     0x457ff000,B4     ; |139| 
           MVKH    .S2     0x457ff000,B4     ; |139| 
           NOP             1
           MPYSP   .M2     B4,B5,B4          ; |139| 
           ZERO    .D2     B5                ; |139| 
           MVKH    .S2     0x40590000,B5     ; |139| 
           B       .S2     B8                ; |139| 
           SPDP    .S2     B4,B7:B6          ; |139| 
           ZERO    .D2     B4                ; |139| 
           MV      .S1X    B6,A4             ; |139| 
           NOP             1
           MV      .S1X    B7,A5             ; |139| 
RL4:       ; CALL OCCURS                     ; |139| 
           DPSP    .L1     A5:A4,A0          ; |139| 
           NOP             3
           MV      .S2X    A0,B4             ; |139| 
           SPTRUNC .L2     B4,B4             ; |141| 
           STW     .D2T1   A0,*+SP(8)        ; |139| 
           MVKL    .S1     0x2000084,A0      ; |141| 
           MVKH    .S1     0x2000084,A0      ; |141| 
           STW     .D1T2   B4,*A0            ; |141| 
           LDW     .D2T1   *+SP(4),A4        ; |143| 
           LDW     .D2T2   *++SP(16),B3      ; |144| 
           NOP             4
           B       .S2     B3                ; |144| 
           NOP             5
           ; BRANCH OCCURS                   ; |144| 


	.sect	".text"
	.global	_GetAngle

;******************************************************************************
;* FUNCTION NAME: _GetAngle                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,B4,B5,SP                                 *
;*   Regs Used         : A0,A1,A3,A4,B3,B4,B5,SP                              *
;*   Local Frame Size  : 0 Args + 12 Auto + 0 Save = 12 byte                  *
;******************************************************************************
_GetAngle:
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x200020c,B4      ; |160| 
           MVKH    .S2     0x200020c,B4      ; |160| 
           LDW     .D2T2   *B4,B4            ; |160| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |160| 
||         ZERO    .D1     A0                ; |163| 
||         MVK     .S1     32767,A3          ; |163| 

           CMPGT   .L1X    B4,A3,A1
||         MVKH    .S1     0x10000,A0        ; |163| 
||         SUB     .D2     SP,16,SP          ; |154| 

   [ A1]   SUB     .L2X    B4,A0,B4
||         STW     .D2T2   B4,*+SP(4)        ; |160| 

           INTDP   .L2     B4,B5:B4          ; |167| 
||         STW     .D2T2   B4,*+SP(8)        ; |163| 

           NOP             2
           ZERO    .D1     A1                ; |167| 

           MVKH    .S1     0x3fb80000,A1     ; |167| 
||         ZERO    .D1     A0                ; |167| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |167| 
           NOP             8
           B       .S2     B3                ; |169| 
           DPSP    .L1     A1:A0,A0          ; |167| 
           NOP             3

           ADDK    .S2     16,SP             ; |169| 
||         STW     .D2T1   A0,*+SP(12)       ; |167| 
||         MV      .D1     A0,A4             ; |167| 

           ; BRANCH OCCURS                   ; |169| 


	.sect	".text"
	.global	_GetRefAngleVel

;******************************************************************************
;* FUNCTION NAME: _GetRefAngleVel                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,B11,B12,B13,SP                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,B11,B12,B13,SP                      *
;*   Local Frame Size  : 0 Args + 36 Auto + 20 Save = 56 byte                 *
;******************************************************************************
_GetRefAngleVel:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B13,*SP--(56)     ; |178| 
           STW     .D2T2   B12,*+SP(52)      ; |178| 
           STW     .D2T2   B11,*+SP(48)      ; |178| 
           STW     .D2T2   B10,*+SP(44)      ; |178| 
           STW     .D2T2   B3,*+SP(40)       ; |178| 
           STW     .D2T2   B4,*+SP(8)        ; |178| 

           STW     .D2T1   A4,*+SP(4)        ; |178| 
||         MVKL    .S1     _TINTCnt,A0       ; |195| 
||         MV      .S2X    A6,B5             ; |178| 

           STW     .D2T2   B5,*+SP(12)       ; |178| 
||         MVKH    .S1     _TINTCnt,A0       ; |195| 

           LDW     .D1T1   *A0,A0            ; |195| 
           NOP             4
           INTDPU  .L1     A0,A1:A0          ; |195| 
           MVKL    .S2     0xd2f1a9fc,B4     ; |195| 
           MVKL    .S2     0x3f50624d,B5     ; |195| 
           MVKH    .S2     0xd2f1a9fc,B4     ; |195| 
           MVKH    .S2     0x3f50624d,B5     ; |195| 
           MPYDP   .M1X    B5:B4,A1:A0,A1:A0 ; |195| 
           NOP             6
           MVKL    .S2     __divf,B5         ; |200| 
           MVKH    .S2     __divf,B5         ; |200| 

           B       .S2     B5                ; |200| 
||         LDW     .D2T1   *+SP(8),A4

           DPSP    .L1     A1:A0,A0          ; |195| 
||         LDW     .D2T2   *+SP(12),B4       ; |200| 

           NOP             2
           MVKL    .S2     RL8,B3            ; |200| 

           STW     .D2T1   A0,*+SP(16)       ; |195| 
||         MVKH    .S2     RL8,B3            ; |200| 

RL8:       ; CALL OCCURS                     ; |200| 
           LDW     .D2T2   *+SP(12),B4       ; |201| 
           NOP             4

           SPDP    .S2     B4,B5:B4          ; |201| 
||         ZERO    .D1     A1                ; |201| 

           ZERO    .D1     A0                ; |201| 
||         MVKH    .S1     0x40000000,A1     ; |201| 

           MPYDP   .M2X    B5:B4,A1:A0,B5:B4 ; |201| 
           NOP             1
           LDW     .D2T2   *+SP(8),B6        ; |201| 
           NOP             4

           MVKL    .S1     __divd,A0         ; |201| 
||         MPYSP   .M2     B6,B6,B6

           MVKH    .S1     __divd,A0         ; |201| 
           B       .S2X    A0                ; |201| 
           NOP             1
           SPDP    .S2     B6,B7:B6          ; |201| 
           NOP             1

           MV      .S1X    B7,A5             ; |201| 
||         MVKL    .S2     RL10,B3           ; |201| 

           MV      .S1X    B6,A4             ; |201| 
||         STW     .D2T1   A4,*+SP(20)       ; |200| 
||         MVKH    .S2     RL10,B3           ; |201| 

RL10:      ; CALL OCCURS                     ; |201| 
           MVKL    .S1     __divf,A0         ; |204| 
           MVKH    .S1     __divf,A0         ; |204| 

           B       .S2X    A0                ; |204| 
||         LDW     .D2T2   *+SP(8),B4        ; |204| 

           LDW     .D2T1   *+SP(4),A4
||         DPSP    .L1     A5:A4,A3          ; |201| 

           NOP             2
           MVKL    .S2     RL12,B3           ; |204| 

           STW     .D2T1   A3,*+SP(32)       ; |201| 
||         MVKH    .S2     RL12,B3           ; |204| 

RL12:      ; CALL OCCURS                     ; |204| 
           LDW     .D2T2   *+SP(20),B1       ; |208| 
           NOP             2
           LDW     .D2T2   *+SP(4),B7        ; |205| 
           LDW     .D2T2   *+SP(32),B8       ; |211| 

           LDW     .D2T2   *+SP(16),B1       ; |234| 
||         ADDSP   .L2X    B1,A4,B9
||         MV      .S2     B1,B0             ; |214| 

           NOP             1

           ZERO    .S2     B6                ; |211| 
||         STW     .D2T1   A4,*+SP(24)       ; |204| 

           MVKH    .S2     0x40000000,B6     ; |211| 
||         MV      .D2     B7,B2
||         MV      .S1X    B7,A4

           MPYSP   .M2     B8,B6,B8          ; |211| 
||         SUBSP   .L2     B7,B8,B7

           CMPGTSP .S2     B1,B0,B1          ; |234| 
           MVKL    .S2     RL16,B3           ; |213| 

           MVKH    .S2     RL16,B3           ; |213| 
||         MV      .D2     B2,B6             ; |211| 

           CMPGTSP .S2     B6,B8,B0          ; |211| 
           MVKL    .S2     __divf,B5         ; |213| 
           MVKL    .S2     _sqrt,B13         ; |213| 

   [ B0]   B       .S1     L13               ; |211| 
||         MVKL    .S2     __divf,B11        ; |214| 

           MVKH    .S2     __divf,B5         ; |213| 
           MVKH    .S2     _sqrt,B13         ; |213| 

           MVKH    .S2     __divf,B11        ; |214| 
||         ZERO    .L2     B10               ; |214| 
||         LDW     .D2T2   *+SP(12),B4       ; |213| 

           MVKH    .S2     0x40000000,B10    ; |214| 
||         ZERO    .L2     B12               ; |219| 
||         STW     .D2T2   B7,*+SP(36)       ; |205| 

           STW     .D2T2   B9,*+SP(28)       ; |208| 
||         MVKH    .S2     0x40000000,B12    ; |219| 

           ; BRANCH OCCURS                   ; |211| 
;** --------------------------------------------------------------------------*
           B       .S2     B5                ; |213| 
           NOP             5
RL16:      ; CALL OCCURS                     ; |213| 
           B       .S2     B13               ; |213| 
           MVKL    .S2     RL18,B3           ; |213| 
           NOP             2
           SPDP    .S1     A4,A5:A4          ; |213| 
           MVKH    .S2     RL18,B3           ; |213| 
RL18:      ; CALL OCCURS                     ; |213| 
           B       .S2     B11               ; |214| 

           LDW     .D2T1   *+SP(4),A4
||         DPSP    .L1     A5:A4,A0          ; |213| 

           MV      .L2     B10,B4            ; |214| 
           NOP             1
           MVKL    .S2     RL20,B3           ; |214| 

           MVKH    .S2     RL20,B3           ; |214| 
||         STW     .D2T1   A0,*+SP(20)       ; |213| 

RL20:      ; CALL OCCURS                     ; |214| 
           LDW     .D2T2   *+SP(12),B6       ; |216| 
           LDW     .D2T2   *+SP(20),B5       ; |219| 
           LDW     .D2T2   *+SP(16),B4       ; |222| 
           MVKL    .S1     _pos_t,A3         ; |224| 
           STW     .D2T1   A4,*+SP(32)       ; |214| 
           MVKH    .S1     _pos_t,A3         ; |224| 

           MV      .D2     B5,B7             ; |222| 
||         MV      .S2     B6,B9             ; |222| 

           MV      .D2     B5,B2             ; |222| 
||         MPYSP   .M2     B5,B6,B6
||         CMPGTSP .S2     B4,B7,B0          ; |222| 

   [ B0]   B       .S1     L9                ; |222| 
||         MPYSP   .M2     B5,B12,B5         ; |219| 

           MV      .S1X    B4,A5
           MPYSP   .M1X    A5,B9,A4          ; |223| 
           MV      .D2     B4,B1

           CMPLTSP .S2     B2,B1,B1          ; |225| 
||         MVKL    .S1     _vel_t,A0         ; |223| 
||         ZERO    .L2     B3                ; |224| 
||         STW     .D2T2   B5,*+SP(24)       ; |219| 

           MVKH    .S1     _vel_t,A0         ; |223| 
||         MVKH    .S2     0x3fe00000,B3     ; |224| 
||         STW     .D2T2   B6,*+SP(8)        ; |216| 
||         ZERO    .L2     B2                ; |224| 

           ; BRANCH OCCURS                   ; |222| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A4,*A0            ; |223| 
           LDW     .D2T2   *+SP(12),B4       ; |224| 
           NOP             4
           SPDP    .S2     B4,B5:B4          ; |224| 
           NOP             1
           MPYDP   .M2     B5:B4,B3:B2,B5:B4 ; |224| 
           NOP             2
           LDW     .D2T2   *+SP(16),B6       ; |224| 
           NOP             4
           SPDP    .S1X    B6,A1:A0          ; |224| 
           NOP             1
           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |224| 
           NOP             6
           MV      .D2     B6,B4             ; |224| 
           SPDP    .S2     B4,B5:B4          ; |224| 
           NOP             1
           MPYDP   .M1X    B5:B4,A1:A0,A1:A0 ; |224| 
           NOP             8
           B       .S1     L17               ; |225| 
           DPSP    .L1     A1:A0,A0          ; |224| 
           NOP             3
           STW     .D1T1   A0,*A3            ; |224| 
           ; BRANCH OCCURS                   ; |225| 
;** --------------------------------------------------------------------------*
L9:    
           MV      .D2     B7,B4

           SUBSP   .L2X    A5,B4,B9
||         MV      .D2     B9,B8

           MV      .S2X    A5,B7
           CMPGTSP .S2     B7,B5,B5          ; |225| 

           XOR     .S2     1,B5,B5           ; |225| 
||         LDW     .D2T1   *+SP(8),A4        ; |226| 

           MPYSP   .M2     B9,B8,B7          ; |226| 
|| [!B1]   MV      .D2     B1,B5             ; |225| 

           MV      .S1X    B5,A1             ; |225| 
   [!A1]   B       .S1     L12               ; |225| 
           MVKL    .S2     _pos_t,B6         ; |227| 

           SUBSP   .L1X    A4,B7,A4          ; |226| 
||         MVKL    .S2     _pos_t,B4         ; |230| 
||         MVKL    .S1     _vel_t,A3         ; |226| 

           MVKH    .S2     _pos_t,B6         ; |227| 
||         MVKL    .S1     _vel_t,A0         ; |229| 

           MVKH    .S2     _pos_t,B4         ; |230| 
||         ZERO    .D2     B1                ; |227| 
||         MVKH    .S1     _vel_t,A3         ; |226| 

           MVKH    .S2     0x3fe00000,B1     ; |227| 
||         ZERO    .D1     A5                ; |229| 
||         MVKH    .S1     _vel_t,A0         ; |229| 
||         ZERO    .D2     B0                ; |227| 

           ; BRANCH OCCURS                   ; |225| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A4,*A3            ; |226| 
           LDW     .D2T2   *+SP(12),B4       ; |227| 
           NOP             4

           LDW     .D2T2   *+SP(20),B8       ; |227| 
||         SPDP    .S2     B4,B5:B4          ; |227| 

           LDW     .D2T2   *+SP(16),B7       ; |227| 
           MPYDP   .M2     B5:B4,B1:B0,B1:B0 ; |227| 
           NOP             3
           SUBSP   .L2     B7,B8,B4          ; |227| 
           NOP             3
           SPDP    .S2     B4,B5:B4          ; |227| 
           NOP             1

           MPYDP   .M2     B5:B4,B1:B0,B9:B8 ; |227| 
||         MV      .D2     B8,B2             ; |227| 

           NOP             3

           LDW     .D2T2   *+SP(8),B0        ; |227| 
||         SUBSP   .L2     B7,B2,B5

           SUBSP   .L2     B7,B2,B7
           NOP             2
           SPDP    .S2     B5,B5:B4          ; |227| 

           LDW     .D2T2   *+SP(32),B0       ; |227| 
||         MPYSP   .M2     B7,B0,B7          ; |227| 

           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |227| 
           NOP             3
;** --------------------------------------------------------------------------*
L10:    
           ADDSP   .L2     B7,B0,B7          ; |227| 
           NOP             3
           SPDP    .S2     B7,B9:B8          ; |227| 
           NOP             1
           SUBDP   .L2     B9:B8,B5:B4,B5:B4 ; |227| 
           NOP             5
;** --------------------------------------------------------------------------*
L11:    
           B       .S1     L17               ; |228| 
           DPSP    .L2     B5:B4,B4          ; |227| 
           NOP             3
           STW     .D2T2   B4,*B6            ; |227| 
           ; BRANCH OCCURS                   ; |228| 
;** --------------------------------------------------------------------------*
L12:    
           B       .S1     L16               ; |232| 
           STW     .D1T1   A5,*A0            ; |229| 
           LDW     .D2T2   *+SP(4),B5        ; |245| 
           NOP             3
           ; BRANCH OCCURS                   ; |232| 
;** --------------------------------------------------------------------------*
L13:    
           LDW     .D2T1   *+SP(16),A3       ; |235| 
           NOP             4

           MPYSP   .M1X    A3,B4,A3          ; |235| 
||         MV      .S2X    A3,B7             ; |237| 
||         LDW     .D2T2   *+SP(20),B8       ; |237| 

           NOP             1
           MVKL    .S1     _vel_t,A0         ; |235| 
           MVKH    .S1     _vel_t,A0         ; |235| 
   [!B1]   STW     .D1T1   A3,*A0            ; |235| 

   [!B1]   LDW     .D2T2   *+SP(12),B7       ; |236| 
||         CMPLTSP .S2     B8,B7,B0          ; |237| 

           NOP             4
   [!B1]   SPDP    .S2     B7,B9:B8          ; |236| 
           ZERO    .D2     B5                ; |236| 

           ZERO    .D2     B4                ; |236| 
||         MVKH    .S2     0x3fe00000,B5     ; |236| 

   [!B1]   MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |236| 
           NOP             1
   [!B1]   LDW     .D2T2   *+SP(16),B7       ; |236| 
           NOP             4
   [!B1]   MPYSP   .M2     B7,B7,B7
           NOP             3
   [!B1]   SPDP    .S2     B7,B9:B8          ; |236| 
           NOP             1
   [!B1]   MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |236| 
           NOP             2
   [!B1]   B       .S1     L11               ; |237| 
           NOP             3
           MVKL    .S2     _pos_t,B6         ; |236| 
           MVKH    .S2     _pos_t,B6         ; |236| 
           ; BRANCH OCCURS                   ; |237| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(24),B4       ; |237| 
           MV      .D2     B7,B5
           MV      .S2     B7,B6
           LDW     .D2T2   *+SP(24),B7       ; |240| 
           LDW     .D2T1   *+SP(8),A3        ; |238| 
           CMPGTSP .S2     B5,B4,B4          ; |237| 
           XOR     .S2     1,B4,B4           ; |237| 
   [!B0]   MV      .D2     B0,B4             ; |237| 
           MV      .S1X    B4,A1             ; |237| 
   [!A1]   B       .S1     L14               ; |237| 
           MVKL    .S2     _pos_t,B5         ; |239| 
           MVKH    .S2     _pos_t,B5         ; |239| 
           MVKL    .S1     _vel_t,A0         ; |238| 
           CMPLTSP .S2     B7,B6,B0          ; |240| 

           MVKH    .S1     _vel_t,A0         ; |238| 
|| [!A1]   LDW     .D2T2   *+SP(12),B8       ; |241| 
|| [!A1]   MV      .L2     B7,B4

           ; BRANCH OCCURS                   ; |237| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A3,*A0            ; |238| 
           LDW     .D2T2   *+SP(20),B4       ; |239| 
           LDW     .D2T2   *+SP(16),B7       ; |239| 
           LDW     .D2T2   *+SP(8),B6        ; |239| 
           NOP             3
           SUBSP   .L2     B7,B4,B7          ; |239| 
           LDW     .D2T2   *+SP(32),B4       ; |239| 
           NOP             2
           MPYSP   .M2     B7,B6,B6          ; |239| 
           NOP             2
           B       .S1     L17               ; |240| 
           ADDSP   .L2     B6,B4,B4          ; |239| 
           NOP             3
           STW     .D2T2   B4,*B5            ; |239| 
           ; BRANCH OCCURS                   ; |240| 
;** --------------------------------------------------------------------------*
L14:    

           SUBSP   .L2     B6,B4,B9          ; |241| 
||         MV      .D2     B9,B7

           MV      .D2     B6,B5
           CMPGTSP .S2     B5,B7,B5          ; |240| 
           XOR     .S2     1,B5,B5           ; |240| 

           MPYSP   .M2     B9,B8,B7          ; |241| 
|| [!B0]   MV      .D2     B0,B5             ; |240| 

           MV      .S1X    B5,A1             ; |240| 
   [!A1]   B       .S1     L15               ; |240| 

           MVKL    .S2     _pos_t,B6         ; |242| 
||         MV      .D1     A3,A0             ; |240| 

           SUBSP   .L1X    A0,B7,A5          ; |241| 
||         MVKL    .S2     _pos_t,B4         ; |245| 
||         MVKL    .S1     _vel_t,A4         ; |241| 

           MVKH    .S2     _pos_t,B6         ; |242| 
||         MVKL    .S1     _vel_t,A3         ; |244| 

           ZERO    .D2     B9                ; |242| 
||         MVKH    .S2     _pos_t,B4         ; |245| 
||         MVKH    .S1     _vel_t,A4         ; |241| 

           MVKH    .S2     0x3fe00000,B9     ; |242| 
||         ZERO    .D1     A0                ; |244| 
||         ZERO    .D2     B8                ; |242| 
||         MVKH    .S1     _vel_t,A3         ; |244| 

           ; BRANCH OCCURS                   ; |240| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A5,*A4            ; |241| 
           LDW     .D2T2   *+SP(12),B4       ; |242| 
           NOP             4

           LDW     .D2T2   *+SP(24),B0       ; |242| 
||         SPDP    .S2     B4,B5:B4          ; |242| 

           LDW     .D2T2   *+SP(16),B7       ; |242| 
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |242| 
           NOP             3
           SUBSP   .L2     B7,B0,B4          ; |242| 
           NOP             3
           SPDP    .S2     B4,B5:B4          ; |242| 
           NOP             1
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |242| 
           NOP             2
           SUBSP   .L2     B7,B0,B1
           SUBSP   .L2     B7,B0,B7          ; |242| 
           NOP             3
           SPDP    .S2     B7,B9:B8          ; |242| 
           NOP             1
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |242| 
           NOP             1
           LDW     .D2T2   *+SP(8),B0        ; |242| 
           NOP             3
           B       .S1     L10               ; |243| 

           LDW     .D2T2   *+SP(36),B0       ; |242| 
||         MPYSP   .M2     B1,B0,B7          ; |242| 

           NOP             4
           ; BRANCH OCCURS                   ; |243| 
;** --------------------------------------------------------------------------*
L15:    
           STW     .D1T1   A0,*A3            ; |244| 
           LDW     .D2T2   *+SP(4),B5        ; |245| 
           NOP             3
;** --------------------------------------------------------------------------*
L16:    
           NOP             1
           STW     .D2T2   B5,*B4            ; |245| 
;** --------------------------------------------------------------------------*
L17:    
           LDW     .D2T2   *+SP(40),B3       ; |248| 
           LDW     .D2T2   *+SP(48),B11      ; |248| 
           LDW     .D2T2   *+SP(44),B10      ; |248| 
           LDW     .D2T2   *+SP(52),B12      ; |248| 
           LDW     .D2T2   *++SP(56),B13     ; |248| 
           B       .S2     B3                ; |248| 
           NOP             5
           ; BRANCH OCCURS                   ; |248| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |262| 
           MVKH    .S1     _InitEXINTF,A0    ; |262| 
           B       .S2X    A0                ; |262| 
           STW     .D2T2   B3,*SP--(24)      ; |261| 
           MVKL    .S2     RL24,B3           ; |262| 
           MVKH    .S2     RL24,B3           ; |262| 
           NOP             2
RL24:      ; CALL OCCURS                     ; |262| 
           MVKL    .S1     _InitTimer,A0     ; |263| 
           MVKH    .S1     _InitTimer,A0     ; |263| 
           B       .S2X    A0                ; |263| 
           MVKL    .S2     RL26,B3           ; |263| 
           MVKH    .S2     RL26,B3           ; |263| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |263| 
           MVKL    .S2     _InitUART,B4      ; |264| 
           MVKH    .S2     _InitUART,B4      ; |264| 
           B       .S2     B4                ; |264| 
           MVKL    .S2     RL28,B3           ; |264| 
           MVKH    .S2     RL28,B3           ; |264| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |264| 
           MVKL    .S1     _InitINT,A0       ; |265| 
           MVKH    .S1     _InitINT,A0       ; |265| 
           B       .S2X    A0                ; |265| 
           MVKL    .S2     RL30,B3           ; |265| 
           MVKH    .S2     RL30,B3           ; |265| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |265| 
           MVKL    .S1     _InitUSBMon,A0    ; |266| 
           MVKH    .S1     _InitUSBMon,A0    ; |266| 
           B       .S2X    A0                ; |266| 
           MVKL    .S2     RL32,B3           ; |266| 
           MVKH    .S2     RL32,B3           ; |266| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |266| 
           MVKL    .S1     _sprintf,A0       ; |268| 

           MVKH    .S1     _sprintf,A0       ; |268| 
||         MVKL    .S2     SL1+0,B5          ; |268| 

           B       .S2X    A0                ; |268| 
           MVKL    .S2     RL34,B3           ; |268| 
           MVKH    .S2     SL1+0,B5          ; |268| 
           MVKL    .S2     _tmp_string,B4    ; |268| 
           MVKH    .S2     _tmp_string,B4    ; |268| 

           MVKH    .S2     RL34,B3           ; |268| 
||         STW     .D2T2   B5,*+SP(4)        ; |268| 
||         MV      .S1X    B4,A4             ; |268| 

RL34:      ; CALL OCCURS                     ; |268| 
           MVKL    .S1     _Report,A0        ; |268| 
           MVKH    .S1     _Report,A0        ; |268| 
           B       .S2X    A0                ; |268| 
           MVKL    .S2     RL36,B3           ; |268| 
           MVKH    .S2     RL36,B3           ; |268| 
           NOP             3
RL36:      ; CALL OCCURS                     ; |268| 
           MVK     .S1     2024,A0           ; |269| 

           MVKL    .S1     _sprintf,A0       ; |269| 
||         STW     .D2T1   A0,*+SP(8)        ; |269| 

           MVKH    .S1     _sprintf,A0       ; |269| 
||         MVKL    .S2     _tmp_string,B5    ; |269| 

           B       .S2X    A0                ; |269| 
           MVKL    .S2     SL2+0,B4          ; |269| 
           MVKH    .S2     _tmp_string,B5    ; |269| 
           MVKH    .S2     SL2+0,B4          ; |269| 
           MVKL    .S2     RL38,B3           ; |269| 

           MVKH    .S2     RL38,B3           ; |269| 
||         STW     .D2T2   B4,*+SP(4)        ; |269| 
||         MV      .S1X    B5,A4             ; |269| 

RL38:      ; CALL OCCURS                     ; |269| 
           MVKL    .S1     _Report,A0        ; |269| 
           MVKH    .S1     _Report,A0        ; |269| 
           B       .S2X    A0                ; |269| 
           MVKL    .S2     RL40,B3           ; |269| 
           MVKH    .S2     RL40,B3           ; |269| 
           NOP             3
RL40:      ; CALL OCCURS                     ; |269| 
           MVKL    .S2     SL3+0,B5          ; |270| 
           MVKH    .S2     SL3+0,B5          ; |270| 
           MVKL    .S2     0x20003fc,B4      ; |270| 

           STW     .D2T2   B5,*+SP(4)        ; |270| 
||         MVKH    .S2     0x20003fc,B4      ; |270| 

           LDW     .D2T2   *B4,B4            ; |270| 
           MVKL    .S1     0x20003fc,A0      ; |270| 
           MVKH    .S1     0x20003fc,A0      ; |270| 
           MVKL    .S1     _tmp_string,A4    ; |270| 
           MVKL    .S2     RL42,B3           ; |270| 
           EXTU    .S2     B4,16,24,B4       ; |270| 
           STW     .D2T2   B4,*+SP(8)        ; |270| 

           MVKL    .S1     _sprintf,A0       ; |270| 
||         LDW     .D1T1   *A0,A3            ; |270| 

           MVKH    .S1     _sprintf,A0       ; |270| 
           B       .S2X    A0                ; |270| 
           MVKH    .S1     _tmp_string,A4    ; |270| 
           MVKH    .S2     RL42,B3           ; |270| 
           EXTU    .S1     A3,24,24,A3       ; |270| 
           STW     .D2T1   A3,*+SP(12)       ; |270| 
           NOP             1
RL42:      ; CALL OCCURS                     ; |270| 
           MVKL    .S1     _Report,A0        ; |270| 
           MVKH    .S1     _Report,A0        ; |270| 
           B       .S2X    A0                ; |270| 
           MVKL    .S2     RL44,B3           ; |270| 
           MVKH    .S2     RL44,B3           ; |270| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |270| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |274| 
           MVKH    .S1     _GIE,A0           ; |274| 
           B       .S2X    A0                ; |274| 
           MVKL    .S2     _TFlag,B4         ; |272| 
           MVKL    .S2     RL46,B3           ; |274| 
           MVKH    .S2     _TFlag,B4         ; |272| 
           ZERO    .D2     B5                ; |272| 

           STW     .D2T2   B5,*B4            ; |272| 
||         MVKH    .S2     RL46,B3           ; |274| 

RL46:      ; CALL OCCURS                     ; |274| 
           MVKL    .S2     _WaitTFlagCnt,B7  ; |281| 
           MVKL    .S2     0x200008c,B6      ; |278| 
           MVKH    .S2     _WaitTFlagCnt,B7  ; |281| 
           MVKH    .S2     0x200008c,B6      ; |278| 
           MVKL    .S2     0x200004c,B5      ; |276| 
           B       .S2     B7                ; |281| 
           MVKH    .S2     0x200004c,B5      ; |276| 

           MVKL    .S2     0x2000080,B4      ; |277| 
||         MVK     .S1     1,A0              ; |276| 

           STW     .D2T1   A0,*B5            ; |276| 
||         MVKH    .S2     0x2000080,B4      ; |277| 

           STW     .D2T1   A0,*B4            ; |277| 
||         MVKL    .S2     RL48,B3           ; |281| 

           STW     .D2T1   A0,*B6            ; |278| 
||         MVKH    .S2     RL48,B3           ; |281| 
||         MVK     .S1     0x3e8,A4          ; |281| 

RL48:      ; CALL OCCURS                     ; |281| 
           MVKL    .S1     _TINTCnt,A0       ; |283| 

           MVKH    .S1     _TINTCnt,A0       ; |283| 
||         ZERO    .D1     A3                ; |283| 

           STW     .D1T1   A3,*A0            ; |283| 
           MVKL    .S1     0x200004c,A3      ; |286| 
           MVKH    .S1     0x200004c,A3      ; |286| 
           LDW     .D1T1   *A3,A0            ; |286| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L18:    
           MVKL    .S2     _GetRefAngleVel,B5 ; |289| 
           MVKL    .S2     _vel_max,B4       ; |289| 
           MVKL    .S1     _accel,A4         ; |289| 
           MVKH    .S1     _accel,A4         ; |289| 

           XOR     .L1     1,A0,A5           ; |286| 
||         MVKH    .S2     _GetRefAngleVel,B5 ; |289| 

           STW     .D1T1   A5,*A3            ; |286| 
||         MVKL    .S1     _R,A0             ; |289| 
||         MVKH    .S2     _vel_max,B4       ; |289| 

           B       .S2     B5                ; |289| 
||         LDW     .D1T1   *A4,A6            ; |289| 
||         MVKH    .S1     _R,A0             ; |289| 

           LDW     .D1T1   *A0,A4            ; |289| 
||         LDW     .D2T2   *B4,B4            ; |289| 

           MVKL    .S2     RL50,B3           ; |289| 
           MVKH    .S2     RL50,B3           ; |289| 
           NOP             2
RL50:      ; CALL OCCURS                     ; |289| 
           MVKL    .S2     _TINTCnt,B4       ; |291| 
           MVKH    .S2     _TINTCnt,B4       ; |291| 
           LDW     .D2T2   *B4,B4            ; |291| 
           MVK     .S2     2000,B5           ; |291| 
           NOP             3
           CMPGTU  .L2     B4,B5,B0          ; |291| 
   [!B0]   B       .S1     L18               ; |291| 
           NOP             2
   [!B0]   MVKL    .S1     0x200004c,A3      ; |286| 
   [!B0]   MVKH    .S1     0x200004c,A3      ; |286| 
   [!B0]   LDW     .D1T1   *A3,A0            ; |286| 
           ; BRANCH OCCURS                   ; |291| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _timerCheckCnt,A0 ; |293| 
           MVKH    .S1     _timerCheckCnt,A0 ; |293| 
           LDW     .D1T1   *A0,A3            ; |293| 
           MVKL    .S2     SL4+0,B4          ; |294| 
           MVKH    .S2     SL4+0,B4          ; |294| 
           MVKL    .S2     RL52,B3           ; |294| 
           MVKH    .S2     RL52,B3           ; |294| 
           ADD     .D1     1,A3,A3           ; |293| 

           MVKL    .S1     _timerCheckCnt,A0 ; |294| 
||         STW     .D1T1   A3,*A0            ; |293| 

           STW     .D2T2   B4,*+SP(4)        ; |294| 
||         MVKH    .S1     _timerCheckCnt,A0 ; |294| 

           MVKL    .S1     _sprintf,A0       ; |294| 
||         LDW     .D1T1   *A0,A3            ; |294| 

           MVKH    .S1     _sprintf,A0       ; |294| 
           B       .S2X    A0                ; |294| 
           NOP             2
           MVKL    .S2     _tmp_string,B4    ; |294| 
           MVKH    .S2     _tmp_string,B4    ; |294| 

           STW     .D2T1   A3,*+SP(8)        ; |294| 
||         MV      .S1X    B4,A4             ; |294| 

RL52:      ; CALL OCCURS                     ; |294| 
           MVKL    .S1     _Report,A0        ; |294| 
           MVKH    .S1     _Report,A0        ; |294| 
           B       .S2X    A0                ; |294| 
           MVKL    .S2     RL54,B3           ; |294| 
           MVKH    .S2     RL54,B3           ; |294| 
           NOP             3
RL54:      ; CALL OCCURS                     ; |294| 
           MVKL    .S1     _GetAngle,A0      ; |296| 
           MVKH    .S1     _GetAngle,A0      ; |296| 
           B       .S2X    A0                ; |296| 
           MVKL    .S2     RL58,B3           ; |296| 
           MVKH    .S2     RL58,B3           ; |296| 
           NOP             3
RL58:      ; CALL OCCURS                     ; |296| 

           MVKL    .S1     _sprintf,A0       ; |296| 
||         SPDP    .S2X    A4,B7:B6          ; |296| 

           MVKH    .S1     _sprintf,A0       ; |296| 
           B       .S2X    A0                ; |296| 
           MVKL    .S2     SL5+0,B8          ; |296| 
           MVKH    .S2     SL5+0,B8          ; |296| 

           MV      .S2     B6,B5             ; |296| 
||         STW     .D2T2   B8,*+SP(4)        ; |296| 

           MV      .L2     B7,B4             ; |296| 
||         MVKL    .S2     RL60,B3           ; |296| 
||         MVKL    .S1     _tmp_string,A4    ; |296| 
||         STW     .D2T2   B5,*+SP(8)        ; |296| 

           MVKH    .S2     RL60,B3           ; |296| 
||         MVKH    .S1     _tmp_string,A4    ; |296| 
||         STW     .D2T2   B4,*+SP(12)       ; |296| 

RL60:      ; CALL OCCURS                     ; |296| 
           MVKL    .S1     _Report,A0        ; |296| 
           MVKH    .S1     _Report,A0        ; |296| 
           B       .S2X    A0                ; |296| 
           MVKL    .S2     RL62,B3           ; |296| 
           MVKH    .S2     RL62,B3           ; |296| 
           NOP             3
RL62:      ; CALL OCCURS                     ; |296| 
           MVKL    .S2     SL6+0,B4          ; |298| 
           MVKL    .S2     0x200020c,B5      ; |298| 
           MVKH    .S2     SL6+0,B4          ; |298| 

           MVKH    .S2     0x200020c,B5      ; |298| 
||         STW     .D2T2   B4,*+SP(4)        ; |298| 

           LDW     .D2T2   *B5,B5            ; |298| 
           MVKL    .S1     _sprintf,A0       ; |298| 
           MVKH    .S1     _sprintf,A0       ; |298| 
           B       .S2X    A0                ; |298| 
           MVKL    .S2     _tmp_string,B4    ; |298| 
           EXTU    .S2     B5,16,16,B5       ; |298| 
           MVKH    .S2     _tmp_string,B4    ; |298| 
           MVKL    .S2     RL64,B3           ; |298| 

           MV      .S1X    B4,A4             ; |298| 
||         MVKH    .S2     RL64,B3           ; |298| 
||         STW     .D2T2   B5,*+SP(8)        ; |298| 

RL64:      ; CALL OCCURS                     ; |298| 
           MVKL    .S1     _Report,A0        ; |298| 
           MVKH    .S1     _Report,A0        ; |298| 
           B       .S2X    A0                ; |298| 
           MVKL    .S2     RL66,B3           ; |298| 
           MVKH    .S2     RL66,B3           ; |298| 
           NOP             3
RL66:      ; CALL OCCURS                     ; |298| 
           MVKL    .S1     _sprintf,A0       ; |300| 
           MVKH    .S1     _sprintf,A0       ; |300| 
           B       .S2X    A0                ; |300| 
           MVKL    .S2     SL7+0,B4          ; |300| 
           MVKH    .S2     SL7+0,B4          ; |300| 
           MVKL    .S1     _tmp_string,A4    ; |300| 
           MVKL    .S2     RL68,B3           ; |300| 

           MVKH    .S1     _tmp_string,A4    ; |300| 
||         STW     .D2T2   B4,*+SP(4)        ; |300| 
||         MVKH    .S2     RL68,B3           ; |300| 

RL68:      ; CALL OCCURS                     ; |300| 
           MVKL    .S2     _Report,B4        ; |300| 
           MVKH    .S2     _Report,B4        ; |300| 
           B       .S2     B4                ; |300| 
           MVKL    .S2     RL70,B3           ; |300| 
           MVKH    .S2     RL70,B3           ; |300| 
           NOP             3
RL70:      ; CALL OCCURS                     ; |300| 
           B       .S1     L18               ; |304| 
           MVKL    .S1     _TINTCnt,A0       ; |301| 

           MVKH    .S1     _TINTCnt,A0       ; |301| 
||         ZERO    .D2     B4                ; |301| 

           STW     .D1T2   B4,*A0            ; |301| 
||         MVKL    .S1     0x200004c,A3      ; |286| 

           MVKH    .S1     0x200004c,A3      ; |286| 
           LDW     .D1T1   *A3,A0            ; |286| 
           ; BRANCH OCCURS                   ; |304| 


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
SL7:	.string	13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sqrt
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	__divd
	.global	__divf
