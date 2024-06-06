;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Thu Jun 06 14:09:01 2024                                *
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

	.global	_PWMD
_PWMD:	.usect	.far,4,4
	.global	_PWMH
_PWMH:	.usect	.far,4,4
	.global	_PWML
_PWML:	.usect	.far,4,4
	.global	_uSat
_uSat:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_hallCount+0,32
	.field  	0,32			; _hallCount @ 0
	.sect	".text"
	.global	_hallCount
_hallCount:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prevHall+0,32
	.field  	0,32			; _prevHall @ 0
	.sect	".text"
	.global	_prevHall
_prevHall:	.usect	.far,4,4
	.global	_currHall
_currHall:	.usect	.far,4,4
	.global	_currAngle
_currAngle:	.usect	.far,4,4
	.global	_refAngle
_refAngle:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\opqrs\AppData\Local\Temp\TI18108_2 --template_info_file C:\Users\opqrs\AppData\Local\Temp\TI18108_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           MV      .D1     A4,A0             ; |121| 
           SPDP    .S1     A0,A1:A0          ; |125| 
           STW     .D2T2   B3,*SP--(16)      ; |121| 
           MVKL    .S1     0x4058e000,A5     ; |125| 

           ZERO    .D1     A4                ; |125| 
||         STW     .D2T1   A4,*+SP(4)        ; |121| 
||         MVKH    .S1     0x4058e000,A5     ; |125| 

           CMPGTDP .S1     A1:A0,A5:A4,A1    ; |125| 
||         ZERO    .D2     B4                ; |125| 

           MVKH    .S2     0x42c70000,B4     ; |125| 
   [ A1]   STW     .D2T2   B4,*+SP(4)        ; |125| 
           LDW     .D2T2   *+SP(4),B4        ; |126| 
           MVKL    .S2     0xc058e000,B7     ; |126| 
           MVKH    .S2     0xc058e000,B7     ; |126| 
           ZERO    .D2     B6                ; |126| 
           ZERO    .D1     A0                ; |126| 
           SPDP    .S2     B4,B5:B4          ; |126| 
           MVKH    .S1     0xc2c70000,A0     ; |126| 
           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |126| 
           NOP             1
   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |126| 
           LDW     .D2T2   *+SP(4),B4        ; |129| 
           MVKL    .S1     0x44ffe000,A0     ; |129| 
           MVKH    .S1     0x44ffe000,A0     ; |129| 
           MVKL    .S2     RL4,B3            ; |129| 
           MVKH    .S2     RL4,B3            ; |129| 
           MPYSP   .M2X    A0,B4,B4          ; |129| 
           MVKL    .S2     __divd,B8         ; |129| 
           MVKH    .S2     __divd,B8         ; |129| 
           B       .S2     B8                ; |129| 
           SPDP    .S2     B4,B7:B6          ; |129| 
           ZERO    .D2     B5                ; |129| 
           MV      .S1X    B7,A5             ; |129| 
           MVKH    .S2     0x40590000,B5     ; |129| 

           MV      .S1X    B6,A4             ; |129| 
||         ZERO    .D2     B4                ; |129| 

RL4:       ; CALL OCCURS                     ; |129| 
           DPSP    .L1     A5:A4,A0          ; |129| 
           MVKL    .S1     _PWMD,A4          ; |134| 
           MVKH    .S1     _PWMD,A4          ; |134| 
           MVK     .S2     2048,B5           ; |134| 
           MV      .S2X    A0,B4             ; |129| 
           SPTRUNC .L2     B4,B4             ; |132| 
           MVKL    .S1     _PWMD,A3          ; |133| 

           MVKL    .S1     _PWMD,A0          ; |132| 
||         STW     .D2T1   A0,*+SP(8)        ; |129| 

           MVKH    .S1     _PWMD,A0          ; |132| 

           STW     .D1T2   B4,*A0            ; |132| 
||         MVKH    .S1     _PWMD,A3          ; |133| 

           LDW     .D1T1   *A3,A0            ; |133| 
           MVKL    .S1     _PWMH,A3          ; |133| 
           MVKH    .S1     _PWMH,A3          ; |133| 
           MVKL    .S2     _PWML,B4          ; |134| 
           MVKH    .S2     _PWML,B4          ; |134| 
           ADDK    .S1     2048,A0           ; |133| 
           STW     .D1T1   A0,*A3            ; |133| 
           LDW     .D1T1   *A4,A0            ; |134| 
           NOP             4
           SUB     .L2X    B5,A0,B5          ; |134| 
           STW     .D2T2   B5,*B4            ; |134| 
           LDW     .D2T2   *+SP(4),B4        ; |136| 
           MVKL    .S2     _uSat,B5          ; |136| 
           MVKH    .S2     _uSat,B5          ; |136| 
           NOP             2
           STW     .D2T2   B4,*B5            ; |136| 
           LDW     .D2T2   *++SP(16),B3      ; |137| 
           NOP             4
           B       .S2     B3                ; |137| 
           NOP             5
           ; BRANCH OCCURS                   ; |137| 


	.sect	".text"
	.global	_angleFromHallCount

;******************************************************************************
;* FUNCTION NAME: _angleFromHallCount                                         *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 4 Auto + 4 Save = 8 byte                    *
;******************************************************************************
_angleFromHallCount:
;** --------------------------------------------------------------------------*
           MV      .S2X    A4,B4             ; |148| 
           INTDP   .L2     B4,B5:B4          ; |149| 
           NOP             2
           MVKL    .S1     0x40768000,A1     ; |149| 

           MVKH    .S1     0x40768000,A1     ; |149| 
||         STW     .D2T2   B3,*SP--(8)       ; |148| 
||         ZERO    .D1     A0                ; |149| 

           MPYDP   .M1X    A1:A0,B5:B4,A5:A4 ; |149| 
||         STW     .D2T1   A4,*+SP(4)        ; |148| 

           NOP             1
           MVKL    .S2     __divd,B6         ; |149| 
           MVKH    .S2     __divd,B6         ; |149| 
           B       .S2     B6                ; |149| 
           NOP             1
           MVKL    .S2     RL6,B3            ; |149| 
           MVKH    .S2     RL6,B3            ; |149| 
           MVKL    .S2     0x40744000,B5     ; |149| 

           MVKH    .S2     0x40744000,B5     ; |149| 
||         ZERO    .D2     B4                ; |149| 

RL6:       ; CALL OCCURS                     ; |149| 
           LDW     .D2T2   *++SP(8),B3       ; |150| 
           NOP             4
           B       .S2     B3                ; |150| 
           NOP             1
           DPSP    .L1     A5:A4,A4          ; |149| 
           NOP             3
           ; BRANCH OCCURS                   ; |150| 


	.sect	".text"
	.global	_BLDCDrive

;******************************************************************************
;* FUNCTION NAME: _BLDCDrive                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,B0,B1,B2,  *
;*                           B3,B4,B5,B6,B7,B8,B9,B10,B11,SP                  *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,B0,B1,B2,  *
;*                           B3,B4,B5,B6,B7,B8,B9,B10,B11,SP                  *
;*   Local Frame Size  : 0 Args + 4 Auto + 24 Save = 28 byte                  *
;******************************************************************************
_BLDCDrive:
;** --------------------------------------------------------------------------*
           MVKL    .S2     _PWMOut,B4        ; |166| 

           MVKH    .S2     _PWMOut,B4        ; |166| 
||         STW     .D2T2   B11,*SP--(32)     ; |164| 

           B       .S2     B4                ; |166| 
||         STW     .D2T2   B3,*+SP(24)       ; |164| 

           STW     .D2T1   A12,*+SP(20)      ; |164| 
           STW     .D2T1   A11,*+SP(16)      ; |164| 
           STW     .D2T1   A10,*+SP(12)      ; |164| 

           STW     .D2T1   A4,*+SP(4)        ; |164| 
||         MVKL    .S2     RL8,B3            ; |166| 

           MVKH    .S2     RL8,B3            ; |166| 
||         STW     .D2T2   B10,*+SP(28)      ; |164| 

RL8:       ; CALL OCCURS                     ; |166| 
           MVKL    .S1     0x2000208,A0      ; |169| 
           MVKH    .S1     0x2000208,A0      ; |169| 
           LDW     .D1T1   *A0,A0            ; |169| 
           B       .S1     L16               ; |172| 
           MVKL    .S2     _currHall,B4      ; |169| 
           MVKH    .S2     _currHall,B4      ; |169| 
           MVKL    .S1     _currHall,A6      ; |213| 
           AND     .S1     7,A0,A0           ; |169| 
           STW     .D2T1   A0,*B4            ; |169| 
           ; BRANCH OCCURS                   ; |172| 
;** --------------------------------------------------------------------------*
L9:    
           LDW     .D2T2   *B4,B4            ; |175| 
           NOP             4
           STW     .D2T2   B4,*B5            ; |175| 
           LDW     .D1T1   *A3,A0            ; |176| 
           MVKL    .S2     _hallCount,B5     ; |177| 
           MVKH    .S2     _hallCount,B5     ; |177| 
           NOP             2
           STW     .D1T1   A0,*A4            ; |176| 
           LDW     .D2T2   *B6,B4            ; |177| 
           MVKL    .S1     _prevHall,A0      ; |178| 
           MVKH    .S1     _prevHall,A0      ; |178| 
           NOP             2
           CMPEQ   .L2     B4,6,B0           ; |177| 
   [ B0]   LDW     .D2T2   *B5,B4            ; |177| 
           NOP             4
   [ B0]   ADD     .D2     1,B4,B4           ; |177| 
   [ B0]   STW     .D2T2   B4,*B5            ; |177| 
           LDW     .D1T1   *A0,A3            ; |178| 
           NOP             4
           CMPEQ   .L1     A3,3,A1           ; |178| 
           MVKL    .S1     _hallCount,A0     ; |178| 
;** --------------------------------------------------------------------------*
L10:    
           MVKH    .S1     _hallCount,A0     ; |178| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |178| 
           B       .S1     L18               ; |178| 
           MVKL    .S2     _currHall,B4      ; |218| 
           NOP             2
   [ A1]   SUB     .D1     A3,1,A3           ; |178| 
   [ A1]   STW     .D1T1   A3,*A0            ; |178| 
           ; BRANCH OCCURS                   ; |178| 
;** --------------------------------------------------------------------------*
L11:    
           STW     .D2T2   B4,*B7            ; |181| 
           LDW     .D1T1   *A7,A0            ; |182| 
           MVKL    .S2     _hallCount,B4     ; |184| 
           MVKH    .S2     _hallCount,B4     ; |184| 
           MV      .D2     B4,B5             ; |184| 
           NOP             1
           STW     .D1T1   A0,*A6            ; |182| 
           STW     .D1T1   A9,*A8            ; |183| 
           LDW     .D2T2   *B9,B6            ; |184| 
           MVKL    .S1     _prevHall,A0      ; |185| 
           MVKH    .S1     _prevHall,A0      ; |185| 
           NOP             2
           CMPEQ   .L2     B6,2,B0           ; |184| 
   [ B0]   LDW     .D2T2   *B5,B4            ; |184| 
           NOP             4
   [ B0]   ADD     .D2     1,B4,B4           ; |184| 
   [ B0]   STW     .D2T2   B4,*B5            ; |184| 

           LDW     .D1T1   *A0,A3            ; |185| 
||         B       .S1     L10               ; |185| 

           MVKL    .S1     _hallCount,A0     ; |178| 
           NOP             3
           CMPEQ   .L1     A3,1,A1           ; |185| 
           ; BRANCH OCCURS                   ; |185| 
;** --------------------------------------------------------------------------*
L12:    
           NOP             4
           STW     .D2T2   B4,*B8            ; |188| 
           STW     .D1T1   A9,*A8            ; |189| 
           LDW     .D1T1   *A7,A0            ; |190| 
           MVKL    .S2     _hallCount,B4     ; |191| 
           MVKH    .S2     _hallCount,B4     ; |191| 
           MV      .D2     B4,B5             ; |191| 
           NOP             1
           STW     .D1T1   A0,*A6            ; |190| 
           LDW     .D2T2   *B9,B6            ; |191| 
           MVKL    .S1     _prevHall,A0      ; |192| 
           MVKH    .S1     _prevHall,A0      ; |192| 
           NOP             2
           CMPEQ   .L2     B6,3,B0           ; |191| 
   [ B0]   LDW     .D2T2   *B5,B4            ; |191| 
           NOP             4
   [ B0]   ADD     .D2     1,B4,B4           ; |191| 
   [ B0]   STW     .D2T2   B4,*B5            ; |191| 

           B       .S1     L10               ; |192| 
||         LDW     .D1T1   *A0,A3            ; |192| 

           MVKL    .S1     _hallCount,A0     ; |178| 
           NOP             3
           CMPEQ   .L1     A3,5,A1           ; |192| 
           ; BRANCH OCCURS                   ; |192| 
;** --------------------------------------------------------------------------*
L13:    
           LDW     .D2T2   *B4,B4            ; |196| 
           NOP             4
           STW     .D2T2   B4,*B6            ; |196| 
           LDW     .D1T1   *A3,A0            ; |197| 
           MVKL    .S2     _hallCount,B4     ; |198| 
           MVKH    .S2     _hallCount,B4     ; |198| 
           NOP             2
           STW     .D1T1   A0,*A4            ; |197| 
           LDW     .D2T2   *B5,B6            ; |198| 
           MV      .D2     B4,B5             ; |198| 
           MVKL    .S1     _prevHall,A0      ; |199| 
           MVKH    .S1     _prevHall,A0      ; |199| 
           NOP             1
           CMPEQ   .L2     B6,1,B0           ; |198| 
   [ B0]   LDW     .D2T2   *B5,B4            ; |198| 
           NOP             4
   [ B0]   ADD     .D2     1,B4,B4           ; |198| 
   [ B0]   STW     .D2T2   B4,*B5            ; |198| 

           B       .S1     L10               ; |199| 
||         LDW     .D1T1   *A0,A3            ; |199| 

           MVKL    .S1     _hallCount,A0     ; |178| 
           NOP             3
           CMPEQ   .L1     A3,4,A1           ; |199| 
           ; BRANCH OCCURS                   ; |199| 
;** --------------------------------------------------------------------------*
L14:    
           NOP             4
           STW     .D2T2   B4,*B3            ; |202| 
           LDW     .D1T1   *A10,A0           ; |203| 
           MVKL    .S2     _hallCount,B4     ; |205| 
           MVKH    .S2     _hallCount,B4     ; |205| 
           MV      .D2     B4,B5             ; |205| 
           NOP             1
           STW     .D1T1   A0,*A2            ; |203| 
           STW     .D1T1   A12,*A11          ; |204| 
           LDW     .D2T2   *B11,B6           ; |205| 
           MVKL    .S1     _prevHall,A0      ; |206| 
           MVKH    .S1     _prevHall,A0      ; |206| 
           NOP             2
           CMPEQ   .L2     B6,5,B0           ; |205| 
   [ B0]   LDW     .D2T2   *B5,B4            ; |205| 
           NOP             4
   [ B0]   ADD     .D2     1,B4,B4           ; |205| 
   [ B0]   STW     .D2T2   B4,*B5            ; |205| 

           B       .S1     L10               ; |206| 
||         LDW     .D1T1   *A0,A3            ; |206| 

           MVKL    .S1     _hallCount,A0     ; |178| 
           NOP             3
           CMPEQ   .L1     A3,6,A1           ; |206| 
           ; BRANCH OCCURS                   ; |206| 
;** --------------------------------------------------------------------------*
L15:    
           NOP             4
           STW     .D2T2   B4,*B8            ; |209| 
           STW     .D1T1   A9,*A8            ; |210| 
           LDW     .D1T1   *A7,A0            ; |211| 
           MVKL    .S2     _hallCount,B4     ; |212| 
           MVKH    .S2     _hallCount,B4     ; |212| 
           MV      .D2     B4,B5             ; |212| 
           NOP             1
           STW     .D1T1   A0,*A6            ; |211| 
           LDW     .D2T2   *B9,B6            ; |212| 
           MVKL    .S1     _prevHall,A0      ; |213| 
           MVKH    .S1     _prevHall,A0      ; |213| 
           NOP             2
           CMPEQ   .L2     B6,4,B0           ; |212| 
   [ B0]   LDW     .D2T2   *B5,B4            ; |212| 
           NOP             4
   [ B0]   ADD     .D2     1,B4,B4           ; |212| 
   [ B0]   STW     .D2T2   B4,*B5            ; |212| 

           B       .S1     L10               ; |213| 
||         LDW     .D1T1   *A0,A3            ; |213| 

           MVKL    .S1     _hallCount,A0     ; |178| 
           NOP             3
           CMPEQ   .L1     A3,2,A1           ; |213| 
           ; BRANCH OCCURS                   ; |213| 
;** --------------------------------------------------------------------------*
L16:    
           MVKH    .S1     _currHall,A6      ; |213| 
           MVKL    .S1     0x2000098,A4      ; |197| 

           MVKL    .S1     _PWML,A3          ; |197| 
||         MVKL    .S2     0x20000a0,B3      ; |202| 

           LDW     .D1T2   *A6,B2            ; |213| 
||         MVKL    .S1     0x200009c,A2      ; |203| 
||         MVKL    .S2     _prevHall,B5      ; |198| 

           MVKL    .S1     0x2000098,A11     ; |204| 
||         MVKL    .S2     _prevHall,B11     ; |205| 

           MVKL    .S1     _PWMH,A10         ; |203| 
||         MVKL    .S2     _PWML,B10         ; |202| 

           MVKL    .S1     0x20000a0,A0      ; |195| 
||         MVKL    .S2     0x200009c,B6      ; |196| 

           MVK     .S1     2048,A12          ; |204| 
||         MVKL    .S2     _PWMH,B4          ; |196| 

           MVKH    .S2     0x20000a0,B3      ; |202| 
||         CMPGT   .L2     B2,4,B1           ; |213| 
||         MVK     .S1     2048,A5           ; |195| 

   [ B1]   B       .S2     L17               ; |213| 
||         MVKH    .S1     0x2000098,A4      ; |197| 

           MVKH    .S2     _prevHall,B5      ; |198| 
||         MVKH    .S1     _PWML,A3          ; |197| 

           MVKH    .S1     0x200009c,A2      ; |203| 
||         MVKH    .S2     _prevHall,B11     ; |205| 

           MVKH    .S2     _PWML,B10         ; |202| 
||         MVKH    .S1     0x2000098,A11     ; |204| 

           MVKH    .S1     _PWMH,A10         ; |203| 
||         MVKH    .S2     0x200009c,B6      ; |196| 

           CMPEQ   .L1X    B2,4,A1           ; |213| 
||         CMPEQ   .L2     B2,5,B0           ; |213| 
||         MVKH    .S2     _PWMH,B4          ; |196| 
||         MVKH    .S1     0x20000a0,A0      ; |195| 

           ; BRANCH OCCURS                   ; |213| 
;** --------------------------------------------------------------------------*

           MVKL    .S2     _PWMH,B7          ; |188| 
||         MVKL    .S1     0x2000098,A6      ; |190| 

   [ A1]   B       .S2     L14               ; |213| 
||         MVKL    .S1     _PWML,A7          ; |190| 

           MVKL    .S1     0x200009c,A8      ; |189| 
||         MVKL    .S2     _prevHall,B9      ; |191| 

           MVK     .S1     2048,A9           ; |189| 
||         MVKL    .S2     0x20000a0,B8      ; |188| 

           MVKH    .S2     _PWMH,B7          ; |188| 
||         MVKH    .S1     0x2000098,A6      ; |190| 

           MVKH    .S2     _prevHall,B9      ; |191| 
||         MVKH    .S1     _PWML,A7          ; |190| 

           MVKH    .S1     0x200009c,A8      ; |189| 
||         MVKH    .S2     0x20000a0,B8      ; |188| 
||         CMPEQ   .L2     B2,1,B0           ; |213| 
|| [ A1]   LDW     .D2T2   *B10,B4           ; |202| 

           ; BRANCH OCCURS                   ; |213| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _PWML,B4          ; |175| 

   [ B0]   B       .S2     L12               ; |213| 
||         MVKL    .S1     0x2000098,A4      ; |176| 

           MVKL    .S2     _prevHall,B6      ; |177| 
||         MVKL    .S1     _PWMH,A3          ; |176| 

           MVKL    .S1     0x20000a0,A0      ; |174| 
||         MVKL    .S2     0x200009c,B5      ; |175| 

           MVKH    .S2     _PWML,B4          ; |175| 
||         MVKH    .S1     0x2000098,A4      ; |176| 

           MVKH    .S2     _prevHall,B6      ; |177| 
||         MVKH    .S1     _PWMH,A3          ; |176| 

           MVKH    .S1     0x20000a0,A0      ; |174| 
||         MVKH    .S2     0x200009c,B5      ; |175| 
||         CMPEQ   .L2     B2,2,B1           ; |213| 
|| [ B0]   LDW     .D2T2   *B7,B4            ; |188| 

           ; BRANCH OCCURS                   ; |213| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _PWMH,B8          ; |181| 

   [ B1]   B       .S2     L9                ; |213| 
||         MVKL    .S1     0x2000098,A8      ; |183| 

           MVKL    .S2     _prevHall,B9      ; |184| 
||         MVKL    .S1     0x200009c,A6      ; |182| 

           MVKL    .S1     _PWML,A7          ; |182| 
||         MVKL    .S2     0x20000a0,B7      ; |181| 

           MVKH    .S2     _PWMH,B8          ; |181| 
||         MVKH    .S1     0x2000098,A8      ; |183| 

           MVKH    .S2     _prevHall,B9      ; |184| 
||         MVKH    .S1     0x200009c,A6      ; |182| 

           MVKH    .S1     _PWML,A7          ; |182| 
||         MVKH    .S2     0x20000a0,B7      ; |181| 
||         CMPEQ   .L2     B2,3,B0           ; |213| 
|| [ B1]   STW     .D1T1   A5,*A0            ; |174| 

           ; BRANCH OCCURS                   ; |213| 
;** --------------------------------------------------------------------------*
   [ B0]   B       .S1     L11               ; |213| 
   [ B0]   LDW     .D2T2   *B8,B4            ; |181| 
           NOP             4
           ; BRANCH OCCURS                   ; |213| 
;** --------------------------------------------------------------------------*
           B       .S1     L19               ; |213| 
           MVKL    .S2     _currHall,B4      ; |218| 
           MVKH    .S2     _currHall,B4      ; |218| 
           LDW     .D2T2   *B4,B5            ; |218| 
           MVKL    .S1     _prevHall,A3      ; |218| 
           NOP             1
           ; BRANCH OCCURS                   ; |213| 
;** --------------------------------------------------------------------------*
L17:    

           MVKL    .S2     _PWML,B7          ; |209| 
||         MVKL    .S1     0x2000098,A6      ; |211| 

   [ B0]   B       .S2     L13               ; |213| 
||         MVKL    .S1     _PWMH,A7          ; |211| 

           MVKL    .S1     0x200009c,A8      ; |210| 
||         MVKL    .S2     _prevHall,B9      ; |212| 

           MVK     .S1     2048,A9           ; |210| 
||         MVKL    .S2     0x20000a0,B8      ; |209| 

           MVKH    .S2     _PWML,B7          ; |209| 
||         MVKH    .S1     0x2000098,A6      ; |211| 

           MVKH    .S2     _prevHall,B9      ; |212| 
||         MVKH    .S1     _PWMH,A7          ; |211| 

           MVKH    .S1     0x200009c,A8      ; |210| 
||         MVKH    .S2     0x20000a0,B8      ; |209| 
||         CMPEQ   .L2     B2,6,B1           ; |213| 
|| [ B0]   STW     .D1T1   A5,*A0            ; |195| 

           ; BRANCH OCCURS                   ; |213| 
;** --------------------------------------------------------------------------*
   [ B1]   B       .S1     L15               ; |213| 
   [!B1]   MVKL    .S2     _currHall,B4      ; |218| 
           NOP             3
   [ B1]   LDW     .D2T2   *B7,B4            ; |209| 
           ; BRANCH OCCURS                   ; |213| 
;** --------------------------------------------------------------------------*
L18:    
           MVKH    .S2     _currHall,B4      ; |218| 
           LDW     .D2T2   *B4,B5            ; |218| 
           MVKL    .S1     _prevHall,A3      ; |218| 
           NOP             1
;** --------------------------------------------------------------------------*
L19:    

           MVKL    .S2     _angleFromHallCount,B4 ; |221| 
||         MVKL    .S1     _hallCount,A0     ; |221| 

           MVKH    .S2     _angleFromHallCount,B4 ; |221| 
||         MVKH    .S1     _prevHall,A3      ; |218| 

           B       .S2     B4                ; |221| 
||         STW     .D1T2   B5,*A3            ; |218| 
||         MVKH    .S1     _hallCount,A0     ; |221| 

           LDW     .D1T1   *A0,A4            ; |221| 
           MVKL    .S2     RL10,B3           ; |221| 
           MVKH    .S2     RL10,B3           ; |221| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |221| 
           MVKL    .S2     _currAngle,B4     ; |221| 
           MVKH    .S2     _currAngle,B4     ; |221| 
           STW     .D2T1   A4,*B4            ; |221| 
           LDW     .D2T2   *+SP(24),B3       ; |222| 
           LDW     .D2T1   *+SP(20),A12      ; |222| 
           LDW     .D2T1   *+SP(16),A11      ; |222| 
           LDW     .D2T1   *+SP(12),A10      ; |222| 
           LDW     .D2T2   *+SP(28),B10      ; |222| 
           B       .S2     B3                ; |222| 
           LDW     .D2T2   *++SP(32),B11     ; |222| 
           NOP             4
           ; BRANCH OCCURS                   ; |222| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,SP                                  *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,SP                                  *
;*   Local Frame Size  : 16 Args + 4 Auto + 8 Save = 28 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |235| 
           MVKH    .S1     _InitEXINTF,A0    ; |235| 
           B       .S2X    A0                ; |235| 
           NOP             2
           STW     .D2T2   B10,*SP--(32)     ; |233| 

           MVKL    .S2     RL12,B3           ; |235| 
||         STW     .D2T2   B3,*+SP(28)       ; |233| 

           MVKH    .S2     RL12,B3           ; |235| 
RL12:      ; CALL OCCURS                     ; |235| 
           MVKL    .S1     _InitTimer,A0     ; |236| 
           MVKH    .S1     _InitTimer,A0     ; |236| 
           B       .S2X    A0                ; |236| 
           MVKL    .S2     RL14,B3           ; |236| 
           MVKH    .S2     RL14,B3           ; |236| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |236| 
           MVKL    .S2     _InitUART,B4      ; |237| 
           MVKH    .S2     _InitUART,B4      ; |237| 
           B       .S2     B4                ; |237| 
           MVKL    .S2     RL16,B3           ; |237| 
           MVKH    .S2     RL16,B3           ; |237| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |237| 
           MVKL    .S1     _InitINT,A0       ; |238| 
           MVKH    .S1     _InitINT,A0       ; |238| 
           B       .S2X    A0                ; |238| 
           MVKL    .S2     RL18,B3           ; |238| 
           MVKH    .S2     RL18,B3           ; |238| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |238| 
           MVKL    .S1     _InitUSBMon,A0    ; |239| 
           MVKH    .S1     _InitUSBMon,A0    ; |239| 
           B       .S2X    A0                ; |239| 
           MVKL    .S2     RL20,B3           ; |239| 
           MVKH    .S2     RL20,B3           ; |239| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |239| 
           MVKL    .S1     _sprintf,A0       ; |241| 

           MVKH    .S1     _sprintf,A0       ; |241| 
||         MVKL    .S2     SL1+0,B4          ; |241| 

           B       .S2X    A0                ; |241| 
           MVKH    .S2     SL1+0,B4          ; |241| 
           MVKL    .S2     _tmp_string,B5    ; |241| 
           MVKL    .S2     RL22,B3           ; |241| 
           MVKH    .S2     _tmp_string,B5    ; |241| 

           STW     .D2T2   B4,*+SP(4)        ; |241| 
||         MVKH    .S2     RL22,B3           ; |241| 
||         MV      .S1X    B5,A4             ; |241| 

RL22:      ; CALL OCCURS                     ; |241| 
           MVKL    .S1     _Report,A0        ; |241| 
           MVKH    .S1     _Report,A0        ; |241| 
           B       .S2X    A0                ; |241| 
           MVKL    .S2     RL24,B3           ; |241| 
           MVKH    .S2     RL24,B3           ; |241| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |241| 
           MVK     .S1     2024,A0           ; |242| 

           MVKL    .S1     _sprintf,A0       ; |242| 
||         STW     .D2T1   A0,*+SP(8)        ; |242| 

           MVKH    .S1     _sprintf,A0       ; |242| 
||         MVKL    .S2     _tmp_string,B5    ; |242| 

           B       .S2X    A0                ; |242| 
           MVKH    .S2     _tmp_string,B5    ; |242| 
           MVKL    .S2     SL2+0,B4          ; |242| 
           MVKL    .S2     RL26,B3           ; |242| 
           MVKH    .S2     SL2+0,B4          ; |242| 

           MVKH    .S2     RL26,B3           ; |242| 
||         STW     .D2T2   B4,*+SP(4)        ; |242| 
||         MV      .S1X    B5,A4             ; |242| 

RL26:      ; CALL OCCURS                     ; |242| 
           MVKL    .S1     _Report,A0        ; |242| 
           MVKH    .S1     _Report,A0        ; |242| 
           B       .S2X    A0                ; |242| 
           MVKL    .S2     RL28,B3           ; |242| 
           MVKH    .S2     RL28,B3           ; |242| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |242| 
           MVKL    .S2     SL3+0,B4          ; |243| 
           MVKL    .S2     0x20003fc,B5      ; |243| 
           MVKH    .S2     SL3+0,B4          ; |243| 

           MVKH    .S2     0x20003fc,B5      ; |243| 
||         STW     .D2T2   B4,*+SP(4)        ; |243| 

           LDW     .D2T2   *B5,B4            ; |243| 
           MVKL    .S1     0x20003fc,A0      ; |243| 
           MVKH    .S1     0x20003fc,A0      ; |243| 
           MVKL    .S1     _tmp_string,A4    ; |243| 
           MVKL    .S2     RL30,B3           ; |243| 
           EXTU    .S2     B4,16,24,B4       ; |243| 
           STW     .D2T2   B4,*+SP(8)        ; |243| 

           MVKL    .S1     _sprintf,A0       ; |243| 
||         LDW     .D1T1   *A0,A3            ; |243| 

           MVKH    .S1     _sprintf,A0       ; |243| 
           B       .S2X    A0                ; |243| 
           MVKH    .S1     _tmp_string,A4    ; |243| 
           MVKH    .S2     RL30,B3           ; |243| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |243| 
           STW     .D2T1   A3,*+SP(12)       ; |243| 
RL30:      ; CALL OCCURS                     ; |243| 
           MVKL    .S1     _Report,A0        ; |243| 
           MVKH    .S1     _Report,A0        ; |243| 
           B       .S2X    A0                ; |243| 
           MVKL    .S2     RL32,B3           ; |243| 
           MVKH    .S2     RL32,B3           ; |243| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |243| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |247| 
           MVKH    .S1     _GIE,A0           ; |247| 
           B       .S2X    A0                ; |247| 
           MVKL    .S2     _TFlag,B4         ; |245| 
           MVKL    .S2     RL34,B3           ; |247| 
           MVKH    .S2     _TFlag,B4         ; |245| 
           ZERO    .D2     B5                ; |245| 

           STW     .D2T2   B5,*B4            ; |245| 
||         MVKH    .S2     RL34,B3           ; |247| 

RL34:      ; CALL OCCURS                     ; |247| 
           MVKL    .S1     _GIE,A0           ; |247| 
           MVKH    .S1     _GIE,A0           ; |247| 
           B       .S2X    A0                ; |247| 
           MVKL    .S2     RL36,B3           ; |247| 
           MVKH    .S2     RL36,B3           ; |247| 
           NOP             3
RL36:      ; CALL OCCURS                     ; |247| 
           MVKL    .S2     _WaitTFlagCnt,B5  ; |251| 
           MVKH    .S2     _WaitTFlagCnt,B5  ; |251| 
           B       .S2     B5                ; |251| 
           MVKL    .S2     0x2000094,B4      ; |249| 
           MVKL    .S2     RL38,B3           ; |251| 
           MVK     .S1     1,A0              ; |249| 
           MVKH    .S2     0x2000094,B4      ; |249| 

           MVK     .S1     0x64,A4           ; |251| 
||         MVKH    .S2     RL38,B3           ; |251| 
||         STW     .D2T1   A0,*B4            ; |249| 

RL38:      ; CALL OCCURS                     ; |251| 

           MVKL    .S1     _refAngle,A0      ; |252| 
||         ZERO    .D2     B4                ; |252| 

           MVKH    .S1     _refAngle,A0      ; |252| 
||         MVKH    .S2     0x43b40000,B4     ; |252| 

           STW     .D1T2   B4,*A0            ; |252| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L20
;** --------------------------------------------------------------------------*
L20:    

           ZERO    .D2     B4                ; |256| 
||         MVK     .S2     10000,B5          ; |256| 

           CMPLT   .L2     B4,B5,B0          ; |256| 
   [!B0]   B       .S1     L22               ; |256| 

           STW     .D2T2   B4,*+SP(20)       ; |256| 
||         MVK     .S2     10000,B10         ; |258| 

   [!B0]   MVKL    .S2     SL4+0,B4          ; |259| 

   [!B0]   MVKH    .S2     SL4+0,B4          ; |259| 
|| [!B0]   MVKL    .S1     _currAngle,A0     ; |259| 

   [!B0]   STW     .D2T2   B4,*+SP(4)        ; |259| 
|| [!B0]   MVKH    .S1     _currAngle,A0     ; |259| 

   [!B0]   LDW     .D1T1   *A0,A0            ; |259| 
           ; BRANCH OCCURS                   ; |256| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L21:    
           MVKL    .S2     _BLDCDrive,B4     ; |257| 

           MVKH    .S2     _BLDCDrive,B4     ; |257| 
||         MVKL    .S1     _uControlInput,A0 ; |257| 

           B       .S2     B4                ; |257| 
||         MVKH    .S1     _uControlInput,A0 ; |257| 

           LDW     .D1T1   *A0,A4            ; |257| 
           MVKL    .S2     RL40,B3           ; |257| 
           MVKH    .S2     RL40,B3           ; |257| 
           NOP             2
RL40:      ; CALL OCCURS                     ; |257| 
           LDW     .D2T2   *+SP(20),B4       ; |258| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |258| 
           CMPLT   .L2     B4,B10,B0         ; |258| 
   [ B0]   B       .S1     L21               ; |258| 
           NOP             4
           STW     .D2T2   B4,*+SP(20)       ; |258| 
           ; BRANCH OCCURS                   ; |258| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     SL4+0,B4          ; |259| 

           MVKH    .S2     SL4+0,B4          ; |259| 
||         MVKL    .S1     _currAngle,A0     ; |259| 

           STW     .D2T2   B4,*+SP(4)        ; |259| 
||         MVKH    .S1     _currAngle,A0     ; |259| 

           LDW     .D1T1   *A0,A0            ; |259| 
;** --------------------------------------------------------------------------*
L22:    
           MVKL    .S2     RL42,B3           ; |259| 
           MVKL    .S2     _tmp_string,B4    ; |259| 
           MVKH    .S2     _tmp_string,B4    ; |259| 
           MV      .S1X    B4,A4             ; |259| 
           SPDP    .S1     A0,A1:A0          ; |259| 
           MVKH    .S2     RL42,B3           ; |259| 

           MVKL    .S1     _sprintf,A0       ; |259| 
||         STW     .D2T1   A0,*+SP(8)        ; |259| 

           MVKH    .S1     _sprintf,A0       ; |259| 
           B       .S2X    A0                ; |259| 
           STW     .D2T1   A1,*+SP(12)       ; |259| 
           NOP             4
RL42:      ; CALL OCCURS                     ; |259| 
           MVKL    .S2     _Report,B4        ; |259| 
           MVKH    .S2     _Report,B4        ; |259| 
           B       .S2     B4                ; |259| 
           MVKL    .S2     RL44,B3           ; |259| 
           MVKH    .S2     RL44,B3           ; |259| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |259| 
           B       .S1     L20               ; |260| 
           NOP             5
           ; BRANCH OCCURS                   ; |260| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
SL4:	.string	"currAngle: %.2f",13,10,13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	_uControlInput
	.global	__divd
