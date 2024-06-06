;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Thu Jun 06 13:48:57 2024                                *
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

	.global	_currentPhaseIndex
_currentPhaseIndex:	.usect	.far,4,4
	.global	_currentDir
_currentDir:	.usect	.far,4,4
	.global	_previousDir
_previousDir:	.usect	.far,4,4
	.global	_delayCntArr
_delayCntArr:	.usect	.far,800,4
	.global	_USB_pos
_USB_pos:	.usect	.far,4,4
	.global	_USB_vel
_USB_vel:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_USB_prevVel+0,32
	.word	000000000h		; _USB_prevVel @ 0
	.sect	".text"
	.global	_USB_prevVel
_USB_prevVel:	.usect	.far,4,4
	.global	_USB_currVel
_USB_currVel:	.usect	.far,4,4
	.global	_USB_acc
_USB_acc:	.usect	.far,4,4
	.global	_USB_delayCnt
_USB_delayCnt:	.usect	.far,4,4
	.global	_totalSteps
_totalSteps:	.usect	.far,4,4

	.sect	".const"
	.align 4
_$T0$1:
	.field  	2,32			; _$T0$1[0] @ 0
	.field  	8,32			; _$T0$1[1] @ 32
	.field  	1,32			; _$T0$1[2] @ 64
	.field  	4,32			; _$T0$1[3] @ 96
	.sect	".text"
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\opqrs\AppData\Local\Temp\TI27392_2 --template_info_file C:\Users\opqrs\AppData\Local\Temp\TI27392_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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

           MVK     .S2     200,B4            ; |51| 
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

           SUB     .D2     SP,8,SP           ; |97| 
||         MVKL    .S1     _TFlag,A0         ; |100| 

           STW     .D2T1   A4,*+SP(4)        ; |97| 
||         MVKH    .S1     _TFlag,A0         ; |100| 
||         ZERO    .D1     A3                ; |100| 

           STW     .D1T1   A3,*A0            ; |100| 
           LDW     .D2T2   *+SP(4),B5        ; |102| 
           ZERO    .D2     B4                ; |102| 
           STW     .D2T2   B4,*+SP(8)        ; |102| 
           MV      .S2     B3,B9             ; |97| 
           NOP             1
           CMPLTU  .L2     B4,B5,B0          ; |102| 
   [!B0]   B       .S1     L8                ; |102| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |103| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |103| 
           NOP             3
           ; BRANCH OCCURS                   ; |102| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
           B       .S2X    A0                ; |103| 
           MVKL    .S2     RL2,B3            ; |103| 
           MVKH    .S2     RL2,B3            ; |103| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |103| 
           LDW     .D2T2   *+SP(8),B4        ; |104| 
           LDW     .D2T2   *+SP(4),B5        ; |104| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |104| 
           CMPLTU  .L2     B4,B5,B0          ; |104| 
   [ B0]   B       .S1     L7                ; |104| 
           STW     .D2T2   B4,*+SP(8)        ; |104| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |103| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |103| 
           NOP             2
           ; BRANCH OCCURS                   ; |104| 
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B9                ; |105| 
           ADD     .D2     8,SP,SP           ; |105| 
           NOP             4
           ; BRANCH OCCURS                   ; |105| 


	.sect	".text"
	.global	_OneStepMove

;******************************************************************************
;* FUNCTION NAME: _OneStepMove                                                *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,A5,B0,B1,B3,B4,B5,B6,B7,B8,B9,SP         *
;*   Regs Used         : A0,A1,A3,A4,A5,B0,B1,B3,B4,B5,B6,B7,B8,B9,SP         *
;*   Local Frame Size  : 0 Args + 32 Auto + 0 Save = 32 byte                  *
;******************************************************************************
_OneStepMove:
;** --------------------------------------------------------------------------*

           ADDK    .S2     -32,SP            ; |119| 
||         MV      .S1X    B4,A0             ; |119| 

           STW     .D2T1   A0,*+SP(8)        ; |119| 
||         MVKL    .S2     _$T0$1,B4         ; |120| 
||         MV      .L2X    A4,B5             ; |119| 

           STW     .D2T2   B5,*+SP(4)        ; |119| 
||         MVKH    .S2     _$T0$1,B4         ; |120| 

           LDW     .D2T2   *B4,B7            ; |120| 
           LDW     .D2T2   *+B4(8),B6        ; |120| 
           LDW     .D2T2   *+B4(4),B5        ; |120| 
           LDW     .D2T2   *+B4(12),B4       ; |120| 
           ADD     .S1X    12,SP,A0          ; |120| 
           STW     .D1T2   B7,*A0            ; |120| 
           STW     .D1T2   B6,*+A0(8)        ; |120| 
           STW     .D1T2   B5,*+A0(4)        ; |120| 
           STW     .D1T2   B4,*+A0(12)       ; |120| 
           LDW     .D2T1   *+SP(4),A5        ; |124| 
           MVKL    .S1     _currentDir,A4    ; |124| 
           MVKH    .S1     _currentDir,A4    ; |124| 
           MVKL    .S1     _currentPhaseIndex,A3 ; |125| 
           MVKH    .S1     _currentPhaseIndex,A3 ; |125| 
           STW     .D1T1   A5,*A4            ; |124| 
           LDW     .D2T2   *+SP(4),B4        ; |140| 
           LDW     .D1T1   *A3,A5            ; |125| 
           MVKL    .S1     _currentDir,A4    ; |129| 
           MVKL    .S1     _previousDir,A3   ; |129| 
           MVKH    .S1     _currentDir,A4    ; |129| 
           MV      .L1X    B4,A1             ; |140| 
   [ A1]   B       .S1     L10               ; |128| 
           STW     .D2T1   A5,*+SP(28)       ; |125| 
           MVKH    .S1     _previousDir,A3   ; |129| 
           CMPEQ   .L2     B4,1,B0           ; |140| 
           MV      .S2     B3,B8             ; |119| 
           NOP             1
           ; BRANCH OCCURS                   ; |128| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A3,A0            ; |129| 
           LDW     .D1T1   *A4,A3            ; |129| 
           CMPEQ   .L2X    A5,3,B1
           CMPEQ   .L2X    A5,3,B0
           NOP             2
           CMPEQ   .L1     A3,A0,A1          ; |129| 
   [ A1]   B       .S1     L9                ; |129| 
           MV      .S2X    A5,B4
           ADDAW   .D2     SP,B4,B4          ; |133| 
           MV      .S1X    B4,A0             ; |134| 
   [!A1]   MVK     .S2     -1,B4             ; |130| 
   [ A1]   MVK     .S2     -1,B4             ; |134| 
           ; BRANCH OCCURS                   ; |129| 
;** --------------------------------------------------------------------------*
   [ B0]   STW     .D2T2   B4,*+SP(28)       ; |130| 

           B       .S1     L13               ; |132| 
||         LDW     .D2T2   *+SP(28),B4       ; |131| 

           NOP             4
           ADD     .D2     1,B4,B4           ; |131| 
           ; BRANCH OCCURS                   ; |132| 
;** --------------------------------------------------------------------------*
L9:    

   [ B1]   STW     .D2T2   B4,*+SP(28)       ; |134| 
||         LDW     .D1T1   *+A0(12),A0       ; |133| 

           B       .S1     L12               ; |137| 
||         LDW     .D2T2   *+SP(28),B4       ; |135| 

           NOP             4
           ADD     .D2     1,B4,B4           ; |135| 
           ; BRANCH OCCURS                   ; |137| 
;** --------------------------------------------------------------------------*
L10:    
   [!B0]   B       .S1     L14               ; |140| 
           MVKL    .S1     _previousDir,A3   ; |141| 
           MVKL    .S1     _currentDir,A0    ; |141| 
           MVKH    .S1     _previousDir,A3   ; |141| 

           MVKH    .S1     _currentDir,A0    ; |141| 
|| [ B0]   LDW     .D1T1   *A3,A3            ; |141| 
|| [!B0]   LDW     .D2T2   *+SP(28),B4       ; |152| 

   [ B0]   LDW     .D1T1   *A0,A0            ; |141| 
           ; BRANCH OCCURS                   ; |140| 
;** --------------------------------------------------------------------------*
           MV      .S2X    A5,B0             ; |141| 
           MV      .S2X    A5,B1             ; |141| 
           NOP             2
           CMPEQ   .L1     A0,A3,A1          ; |141| 
   [ A1]   B       .S1     L11               ; |141| 
           MV      .S2X    A5,B4             ; |141| 
           ADDAW   .D2     SP,B4,B4          ; |145| 
           MV      .S1X    B4,A0             ; |145| 
   [!A1]   MVK     .S2     4,B4              ; |142| 
   [ A1]   MVK     .S2     4,B4              ; |146| 
           ; BRANCH OCCURS                   ; |141| 
;** --------------------------------------------------------------------------*
   [!B1]   STW     .D2T2   B4,*+SP(28)       ; |142| 

           B       .S1     L13               ; |144| 
||         LDW     .D2T2   *+SP(28),B4       ; |143| 

           NOP             4
           SUB     .D2     B4,1,B4           ; |143| 
           ; BRANCH OCCURS                   ; |144| 
;** --------------------------------------------------------------------------*
L11:    

   [!B0]   STW     .D2T2   B4,*+SP(28)       ; |146| 
||         LDW     .D1T1   *+A0(12),A0       ; |145| 

           LDW     .D2T2   *+SP(28),B4       ; |147| 
           NOP             4
           SUB     .D2     B4,1,B4           ; |147| 
;** --------------------------------------------------------------------------*
L12:    
           STW     .D2T1   A0,*+SP(32)       ; |145| 
;** --------------------------------------------------------------------------*
L13:    
           STW     .D2T2   B4,*+SP(28)       ; |147| 
           LDW     .D2T2   *+SP(28),B4       ; |152| 
;** --------------------------------------------------------------------------*
L14:    
           MVKL    .S2     RL4,B3            ; |157| 
           MVKH    .S2     RL4,B3            ; |157| 
           MVKL    .S1     _currentPhaseIndex,A0 ; |152| 
           MVKH    .S1     _currentPhaseIndex,A0 ; |152| 
           STW     .D1T2   B4,*A0            ; |152| 
           LDW     .D2T2   *+SP(4),B5        ; |153| 
           MVKL    .S2     _previousDir,B4   ; |153| 
           MVKH    .S2     _previousDir,B4   ; |153| 
           MVKL    .S1     0x2000090,A0      ; |156| 
           MVKH    .S1     0x2000090,A0      ; |156| 
           STW     .D2T2   B5,*B4            ; |153| 
           LDW     .D2T2   *+SP(32),B5       ; |156| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |157| 
           MVKH    .S2     _WaitTFlagCnt,B4  ; |157| 
           NOP             2

           B       .S2     B4                ; |157| 
||         STW     .D1T2   B5,*A0            ; |156| 

           LDW     .D2T1   *+SP(8),A4        ; |157| 
           NOP             4
RL4:       ; CALL OCCURS                     ; |157| 
           B       .S2     B8                ; |158| 
           ADDK    .S2     32,SP             ; |158| 
           NOP             4
           ; BRANCH OCCURS                   ; |158| 


	.sect	".text"
	.global	_MakeVelProfile

;******************************************************************************
;* FUNCTION NAME: _MakeVelProfile                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,SP                                *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,SP                                *
;*   Local Frame Size  : 0 Args + 28 Auto + 12 Save = 40 byte                 *
;******************************************************************************
_MakeVelProfile:
;** --------------------------------------------------------------------------*
           STW     .D2T1   A11,*SP--(40)     ; |173| 

           STW     .D2T2   B4,*+SP(8)        ; |173| 
||         MV      .S2X    A4,B5

           SPDP    .S2     B4,B5:B4          ; |183| 
||         STW     .D2T2   B5,*+SP(4)        ; |173| 
||         MPYSP   .M2X    A4,B5,B6
||         ZERO    .D1     A1                ; |183| 

           MVKH    .S1     0x40000000,A1     ; |183| 
||         ZERO    .D1     A0                ; |183| 

           MPYDP   .M2X    B5:B4,A1:A0,B5:B4 ; |183| 
           NOP             1
           MVKL    .S2     __divd,B8         ; |183| 
           MVKH    .S2     __divd,B8         ; |183| 
           B       .S2     B8                ; |183| 
           NOP             1
           SPDP    .S2     B6,B7:B6          ; |183| 
           STW     .D2T2   B3,*+SP(36)       ; |173| 

           MVK     .S1     1,A0              ; |180| 
||         MV      .L1X    B7,A5             ; |183| 
||         MVKL    .S2     RL8,B3            ; |183| 
||         STW     .D2T1   A10,*+SP(32)      ; |173| 

           STW     .D2T1   A0,*+SP(12)       ; |180| 
||         MV      .S1X    B6,A4             ; |183| 
||         MVKH    .S2     RL8,B3            ; |183| 

RL8:       ; CALL OCCURS                     ; |183| 
           DPSP    .L1     A5:A4,A0          ; |183| 
           NOP             3

           MVKL    .S1     __divf,A0         ; |185| 
||         MV      .D1     A0,A4
||         STW     .D2T1   A0,*+SP(16)       ; |183| 

           MVKH    .S1     __divf,A0         ; |185| 
           B       .S2X    A0                ; |185| 
           NOP             1
           MVKL    .S2     RL10,B3           ; |185| 
           MVKL    .S2     0x3fe66666,B4     ; |185| 
           MVKH    .S2     RL10,B3           ; |185| 
           MVKH    .S2     0x3fe66666,B4     ; |185| 
RL10:      ; CALL OCCURS                     ; |185| 
           SPTRUNC .L1     A4,A3             ; |185| 
           NOP             1
           MVK     .S1     1,A0              ; |188| 
           MV      .S2X    A0,B5             ; |185| 
           CMPGTU  .L2X    B5,A3,B0
   [ B0]   B       .S1     L16               ; |188| 
           NOP             3
           STW     .D2T1   A3,*+SP(20)       ; |185| 

           ZERO    .D1     A10               ; |189| 
||         STW     .D2T1   A0,*+SP(12)       ; |188| 

           ; BRANCH OCCURS                   ; |188| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L15:    
           LDW     .D2T2   *+SP(8),B4        ; |189| 
           NOP             4

           SPDP    .S2     B4,B5:B4          ; |189| 
||         ZERO    .D1     A11               ; |189| 

           MVKH    .S1     0x40000000,A11    ; |189| 

           LDW     .D2T2   *+SP(12),B4       ; |189| 
||         MPYDP   .M1X    B5:B4,A11:A10,A1:A0 ; |189| 

           NOP             4
           INTDPU  .L2     B4,B5:B4          ; |189| 
           NOP             4
           MPYDP   .M2X    B5:B4,A1:A0,B5:B4 ; |189| 
           NOP             2
           MVKL    .S1     __divd,A0         ; |189| 
           MVKH    .S1     __divd,A0         ; |189| 
           B       .S2X    A0                ; |189| 
           NOP             1
           MVKL    .S1     0xcccccccd,A4     ; |189| 
           MVKL    .S1     0x3ffccccc,A5     ; |189| 

           MVKH    .S1     0xcccccccd,A4     ; |189| 
||         MVKL    .S2     RL14,B3           ; |189| 

           MVKH    .S2     RL14,B3           ; |189| 
||         MVKH    .S1     0x3ffccccc,A5     ; |189| 

RL14:      ; CALL OCCURS                     ; |189| 
           MVKL    .S2     _sqrt,B4          ; |189| 
           MVKH    .S2     _sqrt,B4          ; |189| 
           B       .S2     B4                ; |189| 
           NOP             3
           MVKL    .S2     RL16,B3           ; |189| 
           MVKH    .S2     RL16,B3           ; |189| 
RL16:      ; CALL OCCURS                     ; |189| 
           DPSP    .L1     A5:A4,A0          ; |189| 
           NOP             1
           MVKL    .S2     0x47c35000,B4     ; |190| 
           MVKH    .S2     0x47c35000,B4     ; |190| 
           MPYSP   .M2X    A0,B4,B4
           NOP             2
           LDW     .D2T2   *+SP(12),B6       ; |191| 

           SPTRUNC .L2     B4,B4             ; |191| 
||         STW     .D2T2   B4,*+SP(28)       ; |190| 

           NOP             1
           MVKL    .S2     _delayCntArr,B5   ; |191| 

           STW     .D2T1   A0,*+SP(24)       ; |189| 
||         MVKH    .S2     _delayCntArr,B5   ; |191| 

           STW     .D2T2   B4,*+B5[B6]       ; |191| 
           LDW     .D2T2   *+SP(12),B4       ; |192| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |192| 
           STW     .D2T2   B4,*+SP(12)       ; |192| 
           LDW     .D2T2   *+SP(20),B4       ; |192| 
           LDW     .D2T2   *+SP(12),B5       ; |192| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |192| 
   [!B0]   B       .S1     L15               ; |192| 
           NOP             5
           ; BRANCH OCCURS                   ; |192| 
;** --------------------------------------------------------------------------*
L16:    
           LDW     .D2T2   *+SP(36),B3       ; |195| 
           LDW     .D2T1   *+SP(32),A10      ; |195| 
           LDW     .D2T1   *+SP(20),A4       ; |194| 
           LDW     .D2T1   *++SP(40),A11     ; |195| 
           NOP             1
           B       .S2     B3                ; |195| 
           NOP             5
           ; BRANCH OCCURS                   ; |195| 


	.sect	".text"
	.global	_StepMoveVP

;******************************************************************************
;* FUNCTION NAME: _StepMoveVP                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,B11,B12,SP                          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,B11,B12,SP                          *
;*   Local Frame Size  : 0 Args + 40 Auto + 16 Save = 56 byte                 *
;******************************************************************************
_StepMoveVP:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B12,*SP--(56)     ; |217| 

           STW     .D2T1   A4,*+SP(4)        ; |217| 
||         MVKL    .S1     __divf,A5         ; |229| 

           STW     .D2T2   B3,*+SP(44)       ; |217| 
||         MVKH    .S1     __divf,A5         ; |229| 
||         MV      .S2X    A4,B6             ; |217| 

           B       .S2X    A5                ; |229| 
||         STW     .D2T2   B11,*+SP(52)      ; |217| 
||         ZERO    .D1     A3                ; |226| 

           STW     .D2T2   B10,*+SP(48)      ; |217| 
||         CMPGTSP .S1X    B6,A3,A1          ; |226| 

           STW     .D2T1   A6,*+SP(12)       ; |217| 
||         MVKL    .S1     0x3fe66666,A4     ; |229| 
||         MV      .L1X    B4,A0             ; |217| 
||         MV      .S2X    A4,B5             ; |217| 

           STW     .D2T1   A0,*+SP(8)        ; |217| 
||         MVKH    .S1     0x3fe66666,A4     ; |229| 
||         ABSSP   .S2     B5,B4             ; |227| 

           STW     .D2T2   B4,*+SP(4)        ; |227| 
|| [!A1]   MVK     .S1     0x1,A3            ; |226| 
||         MV      .L2     B4,B5             ; |229| 
||         MVKL    .S2     RL18,B3           ; |229| 

           MV      .S1X    B5,A4             ; |229| 
||         MV      .L2X    A4,B4             ; |229| 
||         STW     .D2T1   A3,*+SP(16)       ; |226| 
||         MVKH    .S2     RL18,B3           ; |229| 

RL18:      ; CALL OCCURS                     ; |229| 
           SPTRUNC .L1     A4,A3             ; |229| 
           NOP             1
           MVKL    .S1     _totalSteps,A0    ; |229| 
           MVKH    .S1     _totalSteps,A0    ; |229| 
           STW     .D1T1   A3,*A0            ; |229| 
           LDW     .D2T2   *+SP(12),B4       ; |232| 
           NOP             4
           SPDP    .S2     B4,B5:B4          ; |232| 
           ZERO    .D2     B7                ; |232| 

           ZERO    .D2     B6                ; |232| 
||         MVKH    .S2     0x40000000,B7     ; |232| 

           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |232| 
           NOP             1
           LDW     .D2T2   *+SP(8),B6        ; |232| 
           NOP             4

           MPYSP   .M2     B6,B6,B6
||         MVKL    .S1     __divd,A0         ; |232| 

           MVKH    .S1     __divd,A0         ; |232| 
           B       .S2X    A0                ; |232| 
           NOP             1
           SPDP    .S2     B6,B7:B6          ; |232| 
           NOP             1

           MV      .S1X    B7,A5             ; |232| 
||         MVKL    .S2     RL20,B3           ; |232| 

           MV      .S1X    B6,A4             ; |232| 
||         MVKH    .S2     RL20,B3           ; |232| 

RL20:      ; CALL OCCURS                     ; |232| 
           MVKL    .S2     _MakeVelProfile,B5 ; |233| 
           MVKH    .S2     _MakeVelProfile,B5 ; |233| 

           B       .S2     B5                ; |233| 
||         LDW     .D2T2   *+SP(12),B4       ; |233| 

           LDW     .D2T1   *+SP(8),A4        ; |233| 
||         DPSP    .L1     A5:A4,A0          ; |232| 

           NOP             2
           MVKL    .S2     RL22,B3           ; |233| 

           MVKH    .S2     RL22,B3           ; |233| 
||         STW     .D2T1   A0,*+SP(20)       ; |232| 

RL22:      ; CALL OCCURS                     ; |233| 
           LDW     .D2T2   *+SP(4),B6        ; |238| 
           NOP             1
           LDW     .D2T2   *+SP(20),B4       ; |237| 
           NOP             1
           MVK     .S2     1,B5              ; |236| 

           SPDP    .S2     B6,B7:B6          ; |238| 
||         ZERO    .D1     A0                ; |237| 
||         STW     .D2T2   B5,*+SP(36)       ; |236| 
||         MV      .L2     B6,B8             ; |237| 

           MVKH    .S1     0x40000000,A0     ; |237| 
||         ZERO    .D2     B5                ; |238| 

           MPYSP   .M1X    B4,A0,A3          ; |237| 
||         MVKH    .S2     0x40000000,B5     ; |238| 

           MVKL    .S2     __divd,B9         ; |238| 
           MVKL    .S2     __divd,B10        ; |238| 
           MVK     .S2     1,B0              ; |262| 

           MVK     .S2     1,B12             ; |239| 
||         CMPGTSP .S1X    B8,A3,A1          ; |237| 

   [ A1]   B       .S1     L18               ; |237| 
||         MVKL    .S2     _totalSteps,B11   ; |239| 

           MVKH    .S2     __divd,B9         ; |238| 
           MVKH    .S2     __divd,B10        ; |238| 
           MVKH    .S2     _totalSteps,B11   ; |239| 

           MV      .L1X    B6,A4             ; |238| 
||         MVKL    .S2     RL26,B3           ; |238| 
||         MV      .D1     A4,A0             ; |233| 
||         MVKL    .S1     _totalSteps,A6    ; |262| 

           MV      .L1X    B7,A5             ; |238| 
||         MVKH    .S2     RL26,B3           ; |238| 
||         MVKH    .S1     _totalSteps,A6    ; |262| 
||         STW     .D2T1   A0,*+SP(24)       ; |233| 
||         ZERO    .L2     B4                ; |238| 

           ; BRANCH OCCURS                   ; |237| 
;** --------------------------------------------------------------------------*
           B       .S2     B9                ; |238| 
           NOP             5
RL26:      ; CALL OCCURS                     ; |238| 
           MVKL    .S2     RL28,B3           ; |238| 
           B       .S2     B10               ; |238| 
           MVKL    .S2     0x3ffccccc,B5     ; |238| 
           MVKL    .S2     0xcccccccd,B4     ; |238| 
           MVKH    .S2     RL28,B3           ; |238| 
           MVKH    .S2     0x3ffccccc,B5     ; |238| 
           MVKH    .S2     0xcccccccd,B4     ; |238| 
RL28:      ; CALL OCCURS                     ; |238| 
           DPTRUNC .L1     A5:A4,A0          ; |238| 
           STW     .D2T2   B12,*+SP(40)      ; |239| 
           NOP             2
           STW     .D2T1   A0,*+SP(28)       ; |238| 
           LDW     .D2T2   *B11,B5           ; |239| 
           NOP             4
           CMPGT   .L2     B12,B5,B0
   [ B0]   B       .S1     L22               ; |239| 
   [ B0]   MVKL    .S2     _USB_pos,B4       ; |292| 

   [ B0]   ZERO    .D2     B5                ; |292| 
|| [ B0]   MVKL    .S1     _USB_acc,A0       ; |293| 
|| [ B0]   MVKH    .S2     _USB_pos,B4       ; |292| 

   [ B0]   MVKL    .S2     _USB_prevVel,B5   ; |294| 
|| [ B0]   ZERO    .D1     A3                ; |293| 
|| [ B0]   MVKH    .S1     _USB_acc,A0       ; |293| 
|| [ B0]   STW     .D2T2   B5,*B4            ; |292| 

   [ B0]   MVKL    .S1     _USB_delayCnt,A0  ; |295| 
|| [ B0]   MVKH    .S2     _USB_prevVel,B5   ; |294| 
|| [ B0]   ZERO    .D2     B4                ; |294| 
|| [ B0]   STW     .D1T1   A3,*A0            ; |293| 

   [ B0]   MVKH    .S1     _USB_delayCnt,A0  ; |295| 
|| [ B0]   STW     .D2T2   B4,*B5            ; |294| 

           ; BRANCH OCCURS                   ; |239| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(28),B4       ; |241| 
           LDW     .D2T2   *+SP(40),B5       ; |241| 
           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L17:    
           MVKL    .S1     _OneStepMove,A0   ; |251| 
           CMPGTU  .L2     B5,B4,B0          ; |241| 
   [ B0]   LDW     .D2T2   *+SP(36),B4       ; |247| 
   [!B0]   LDW     .D2T2   *+SP(36),B5       ; |242| 
           MVKH    .S1     _OneStepMove,A0   ; |251| 
           MVKL    .S2     RL30,B3           ; |251| 
           MVKH    .S2     RL30,B3           ; |251| 
   [ B0]   SUB     .S2     B4,1,B4           ; |247| 
   [ B0]   STW     .D2T2   B4,*+SP(36)       ; |247| 
   [ B0]   LDW     .D2T2   *+SP(36),B5       ; |248| 
   [!B0]   MVKL    .S2     _delayCntArr,B4   ; |242| 
   [!B0]   MVKH    .S2     _delayCntArr,B4   ; |242| 

   [!B0]   LDW     .D2T2   *+B4[B5],B6       ; |242| 
|| [ B0]   MVKL    .S2     _delayCntArr,B4   ; |248| 

   [ B0]   MVKH    .S2     _delayCntArr,B4   ; |248| 
   [ B0]   LDW     .D2T2   *+B4[B5],B4       ; |248| 
   [!B0]   LDW     .D2T2   *+SP(36),B4       ; |243| 
           LDW     .D2T2   *+SP(16),B5       ; |251| 
   [!B0]   STW     .D2T2   B6,*+SP(32)       ; |242| 
           NOP             1

           B       .S2X    A0                ; |251| 
|| [ B0]   STW     .D2T2   B4,*+SP(32)       ; |248| 

           LDW     .D2T2   *+SP(32),B4       ; |251| 
|| [!B0]   ADD     .S2     1,B4,B6           ; |243| 

           MV      .S1X    B5,A4             ; |251| 
   [!B0]   STW     .D2T2   B6,*+SP(36)       ; |243| 
           NOP             2
RL30:      ; CALL OCCURS                     ; |251| 
           LDW     .D2T2   *+SP(16),B0       ; |254| 
           MVKL    .S1     0x47c35000,A3     ; |256| 
           MVKH    .S1     0x47c35000,A3     ; |256| 
           MVKL    .S2     RL34,B3           ; |256| 
           MVKH    .S2     RL34,B3           ; |256| 
   [!B0]   LDW     .D2T2   *+SP(40),B4       ; |254| 
   [ B0]   LDW     .D2T2   *+SP(40),B4       ; |255| 
   [!B0]   MVKL    .S1     _USB_pos,A0       ; |254| 
           NOP             2
   [!B0]   INTSP   .L2     B4,B5             ; |254| 

   [ B0]   INTSP   .L2     B4,B5             ; |255| 
|| [!B0]   MVKL    .S2     0x3fe66666,B4     ; |254| 

   [!B0]   MVKH    .S2     0x3fe66666,B4     ; |254| 
   [ B0]   MVKL    .S2     0xbfe66666,B4     ; |255| 

   [!B0]   MPYSP   .M2     B5,B4,B4          ; |254| 
|| [ B0]   MVKH    .S2     0xbfe66666,B4     ; |255| 

   [ B0]   MPYSP   .M2     B5,B4,B4          ; |255| 
   [!B0]   MVKH    .S1     _USB_pos,A0       ; |254| 
   [ B0]   MVKL    .S1     _USB_pos,A0       ; |255| 

   [!B0]   STW     .D1T2   B4,*A0            ; |254| 
|| [ B0]   MVKH    .S1     _USB_pos,A0       ; |255| 

   [ B0]   STW     .D1T2   B4,*A0            ; |255| 
           LDW     .D2T2   *+SP(32),B4       ; |256| 
           MVKL    .S1     __divf,A0         ; |256| 
           MVKH    .S1     __divf,A0         ; |256| 
           NOP             2

           INTSPU  .L2     B4,B4             ; |256| 
||         B       .S2X    A0                ; |256| 

           NOP             3
           MV      .L1X    B4,A4             ; |256| 
           MV      .L2X    A3,B4             ; |256| 
RL34:      ; CALL OCCURS                     ; |256| 
           MVKL    .S2     __divf,B5         ; |256| 
           MVKH    .S2     __divf,B5         ; |256| 
           B       .S2     B5                ; |256| 
           MVKL    .S2     0x3fe66666,B6     ; |256| 
           MVKH    .S2     0x3fe66666,B6     ; |256| 
           MVKL    .S2     RL36,B3           ; |256| 
           MV      .L2X    A4,B4             ; |256| 

           MVKH    .S2     RL36,B3           ; |256| 
||         MV      .S1X    B6,A4             ; |256| 

RL36:      ; CALL OCCURS                     ; |256| 
           MVKL    .S2     _USB_vel,B4       ; |256| 
           MVKH    .S2     _USB_vel,B4       ; |256| 
           STW     .D2T1   A4,*B4            ; |256| 
           LDW     .D2T2   *+SP(32),B4       ; |257| 
           MVKL    .S1     __divf,A0         ; |257| 
           MVKH    .S1     __divf,A0         ; |257| 
           MVKL    .S2     RL40,B3           ; |257| 
           B       .S2X    A0                ; |257| 
           INTSPU  .L2     B4,B5             ; |257| 
           MVKH    .S2     RL40,B3           ; |257| 
           MVKL    .S2     0x47c35000,B4     ; |257| 
           MVKH    .S2     0x47c35000,B4     ; |257| 
           MV      .S1X    B5,A4             ; |257| 
RL40:      ; CALL OCCURS                     ; |257| 
           MVKL    .S1     _USB_vel,A0       ; |257| 
           MVKL    .S1     _USB_prevVel,A3   ; |257| 
           MVKH    .S1     _USB_prevVel,A3   ; |257| 

           MVKH    .S1     _USB_vel,A0       ; |257| 
||         LDW     .D1T1   *A3,A3            ; |257| 

           LDW     .D1T1   *A0,A0            ; |257| 
           MVKL    .S2     RL42,B3           ; |257| 
           MVKH    .S2     RL42,B3           ; |257| 
           MV      .L2X    A4,B4
           NOP             1

           MVKL    .S1     __divf,A3         ; |257| 
||         SUBSP   .L1     A0,A3,A0          ; |257| 

           MVKH    .S1     __divf,A3         ; |257| 
           B       .S2X    A3                ; |257| 
           NOP             4
           MV      .D1     A0,A4             ; |257| 
RL42:      ; CALL OCCURS                     ; |257| 
           MVKL    .S1     _USB_acc,A0       ; |257| 
           MVKH    .S1     _USB_acc,A0       ; |257| 
           MVKL    .S1     _USB_vel,A3       ; |258| 

           STW     .D1T1   A4,*A0            ; |257| 
||         MVKH    .S1     _USB_vel,A3       ; |258| 

           LDW     .D1T1   *A3,A0            ; |258| 
           MVKL    .S2     _USB_prevVel,B4   ; |258| 
           MVKH    .S2     _USB_prevVel,B4   ; |258| 
           NOP             2
           STW     .D2T1   A0,*B4            ; |258| 
           LDW     .D2T2   *+SP(32),B4       ; |259| 
           MVKL    .S1     _USB_delayCnt,A0  ; |259| 
           MVKH    .S1     _USB_delayCnt,A0  ; |259| 
           NOP             2
           STW     .D1T2   B4,*A0            ; |259| 
           LDW     .D2T2   *+SP(40),B4       ; |260| 
           NOP             4

           MVKL    .S2     _totalSteps,B4    ; |260| 
||         ADD     .D2     1,B4,B5           ; |260| 

           STW     .D2T2   B5,*+SP(40)       ; |260| 
||         MVKH    .S2     _totalSteps,B4    ; |260| 

           LDW     .D2T2   *B4,B4            ; |260| 
           NOP             4
           CMPGT   .L2     B5,B4,B0          ; |260| 
   [!B0]   B       .S1     L17               ; |260| 
   [!B0]   LDW     .D2T2   *+SP(28),B4       ; |241| 
   [!B0]   LDW     .D2T2   *+SP(40),B5       ; |241| 
           NOP             3
           ; BRANCH OCCURS                   ; |260| 
;** --------------------------------------------------------------------------*
           B       .S1     L22               ; |261| 
           MVKL    .S2     _USB_pos,B4       ; |292| 

           MVKH    .S2     _USB_pos,B4       ; |292| 
||         MVKL    .S1     _USB_acc,A0       ; |293| 
||         ZERO    .D2     B5                ; |292| 

           MVKL    .S2     _USB_prevVel,B5   ; |294| 
||         STW     .D2T2   B5,*B4            ; |292| 
||         MVKH    .S1     _USB_acc,A0       ; |293| 
||         ZERO    .D1     A3                ; |293| 

           MVKL    .S1     _USB_delayCnt,A0  ; |295| 
||         STW     .D1T1   A3,*A0            ; |293| 
||         ZERO    .D2     B4                ; |294| 
||         MVKH    .S2     _USB_prevVel,B5   ; |294| 

           STW     .D2T2   B4,*B5            ; |294| 
||         MVKH    .S1     _USB_delayCnt,A0  ; |295| 

           ; BRANCH OCCURS                   ; |261| 
;** --------------------------------------------------------------------------*
L18:    
           STW     .D2T2   B0,*+SP(40)       ; |262| 
           LDW     .D1T1   *A6,A0            ; |262| 
           NOP             4
           CMPGT   .L1X    B0,A0,A1
   [ A1]   B       .S1     L22               ; |262| 
   [ A1]   MVKL    .S2     _USB_pos,B4       ; |292| 

   [ A1]   ZERO    .D2     B5                ; |292| 
|| [ A1]   MVKL    .S1     _USB_acc,A0       ; |293| 
|| [ A1]   MVKH    .S2     _USB_pos,B4       ; |292| 

   [ A1]   MVKL    .S2     _USB_prevVel,B5   ; |294| 
|| [ A1]   ZERO    .D1     A3                ; |293| 
|| [ A1]   MVKH    .S1     _USB_acc,A0       ; |293| 
|| [ A1]   STW     .D2T2   B5,*B4            ; |292| 

   [ A1]   MVKL    .S1     _USB_delayCnt,A0  ; |295| 
|| [ A1]   MVKH    .S2     _USB_prevVel,B5   ; |294| 
|| [ A1]   ZERO    .D2     B4                ; |294| 
|| [ A1]   STW     .D1T1   A3,*A0            ; |293| 

   [ A1]   MVKH    .S1     _USB_delayCnt,A0  ; |295| 
|| [ A1]   STW     .D2T2   B4,*B5            ; |294| 

           ; BRANCH OCCURS                   ; |262| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(24),B4       ; |264| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L19:    
           LDW     .D2T2   *+SP(40),B5       ; |264| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |264| 
   [!B0]   LDW     .D2T2   *+SP(36),B6       ; |265| 
   [!B0]   MVKL    .S2     _delayCntArr,B4   ; |265| 
   [!B0]   LDW     .D2T2   *+SP(36),B5       ; |266| 
   [!B0]   MVKH    .S2     _delayCntArr,B4   ; |265| 
   [!B0]   MVKL    .S1     _OneStepMove,A0   ; |279| 

   [!B0]   B       .S1     L21               ; |267| 
|| [!B0]   LDW     .D2T2   *+B4[B6],B4       ; |265| 

           NOP             2
   [!B0]   ADD     .D2     1,B5,B5           ; |266| 
   [!B0]   STW     .D2T2   B5,*+SP(36)       ; |266| 
   [!B0]   STW     .D2T2   B4,*+SP(32)       ; |265| 
           ; BRANCH OCCURS                   ; |267| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(24),B4       ; |269| 
           LDW     .D2T2   *+SP(40),B5       ; |269| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |269| 
   [ B0]   MVKL    .S1     _totalSteps,A0    ; |269| 
   [ B0]   MVKH    .S1     _totalSteps,A0    ; |269| 

   [ B0]   LDW     .D2T2   *+SP(24),B5       ; |269| 
|| [ B0]   LDW     .D1T1   *A0,A0            ; |269| 

   [ B0]   LDW     .D2T2   *+SP(40),B4       ; |269| 
   [!B0]   MV      .L1X    B0,A1             ; |269| 
           NOP             2
   [ B0]   SUB     .L1X    A0,B5,A0          ; |269| 
   [ B0]   CMPGTU  .L1X    B4,A0,A0          ; |269| 
   [ B0]   XOR     .S1     1,A0,A1           ; |269| 
   [ A1]   LDW     .D2T2   *+SP(24),B4       ; |270| 
   [!A1]   MVKL    .S1     _totalSteps,A0    ; |274| 
           NOP             3
   [ A1]   STW     .D2T2   B4,*+SP(36)       ; |270| 
   [ A1]   LDW     .D2T2   *+SP(36),B5       ; |271| 
   [ A1]   MVKL    .S2     _delayCntArr,B4   ; |271| 
   [ A1]   MVKH    .S2     _delayCntArr,B4   ; |271| 
           NOP             2

   [ A1]   B       .S1     L20               ; |272| 
|| [ A1]   LDW     .D2T2   *+B4[B5],B4       ; |271| 

           NOP             4
   [ A1]   STW     .D2T2   B4,*+SP(32)       ; |271| 
           ; BRANCH OCCURS                   ; |272| 
;** --------------------------------------------------------------------------*
           MVKH    .S1     _totalSteps,A0    ; |274| 

           LDW     .D1T1   *A0,A0            ; |274| 
||         LDW     .D2T2   *+SP(24),B5       ; |274| 

           LDW     .D2T2   *+SP(40),B4       ; |274| 
           NOP             3
           SUB     .L1X    A0,B5,A0          ; |274| 
           CMPGTU  .L1X    B4,A0,A1          ; |274| 
   [ A1]   MVKL    .S1     _totalSteps,A0    ; |274| 
   [ A1]   MVKH    .S1     _totalSteps,A0    ; |274| 

   [ A1]   LDW     .D2T2   *+SP(40),B4       ; |274| 
|| [ A1]   LDW     .D1T1   *A0,A0            ; |274| 

           NOP             4
   [ A1]   CMPGT   .L1X    B4,A0,A0          ; |274| 
   [ A1]   XOR     .S1     1,A0,A1           ; |274| 
   [ A1]   LDW     .D2T2   *+SP(36),B6       ; |275| 
   [ A1]   MVKL    .S2     _delayCntArr,B4   ; |275| 
   [ A1]   LDW     .D2T2   *+SP(36),B5       ; |276| 
   [ A1]   MVKH    .S2     _delayCntArr,B4   ; |275| 
           NOP             1
   [ A1]   LDW     .D2T2   *+B4[B6],B4       ; |275| 
           NOP             4

   [ A1]   STW     .D2T2   B4,*+SP(32)       ; |275| 
|| [ A1]   SUB     .S2     B5,1,B5           ; |276| 

   [ A1]   STW     .D2T2   B5,*+SP(36)       ; |276| 
;** --------------------------------------------------------------------------*
L20:    
           MVKL    .S1     _OneStepMove,A0   ; |279| 
;** --------------------------------------------------------------------------*
L21:    
           MVKH    .S1     _OneStepMove,A0   ; |279| 

           B       .S2X    A0                ; |279| 
||         LDW     .D2T2   *+SP(16),B5       ; |279| 

           LDW     .D2T2   *+SP(32),B4       ; |279| 
           MVKL    .S2     RL44,B3           ; |279| 
           MVKH    .S2     RL44,B3           ; |279| 
           NOP             1
           MV      .S1X    B5,A4             ; |279| 
RL44:      ; CALL OCCURS                     ; |279| 
           LDW     .D2T2   *+SP(16),B0       ; |282| 
           MVKL    .S1     0x47c35000,A3     ; |284| 
           MVKH    .S1     0x47c35000,A3     ; |284| 
           MVKL    .S2     RL48,B3           ; |284| 
           MVKH    .S2     RL48,B3           ; |284| 
   [!B0]   LDW     .D2T2   *+SP(40),B4       ; |282| 
   [ B0]   LDW     .D2T2   *+SP(40),B4       ; |283| 
   [!B0]   MVKL    .S1     _USB_pos,A0       ; |282| 
           NOP             2
   [!B0]   INTSP   .L2     B4,B5             ; |282| 

   [ B0]   INTSP   .L2     B4,B5             ; |283| 
|| [!B0]   MVKL    .S2     0x3fe66666,B4     ; |282| 

   [ B0]   MVKL    .S2     0xbfe66666,B4     ; |283| 
   [!B0]   MVKH    .S2     0x3fe66666,B4     ; |282| 

   [ B0]   MVKH    .S2     0xbfe66666,B4     ; |283| 
|| [!B0]   MPYSP   .M2     B5,B4,B4          ; |282| 

   [ B0]   MPYSP   .M2     B5,B4,B4          ; |283| 
   [ B0]   MVKL    .S1     _USB_pos,A0       ; |283| 
   [!B0]   MVKH    .S1     _USB_pos,A0       ; |282| 

   [ B0]   MVKH    .S1     _USB_pos,A0       ; |283| 
|| [!B0]   STW     .D1T2   B4,*A0            ; |282| 

   [ B0]   STW     .D1T2   B4,*A0            ; |283| 
           LDW     .D2T2   *+SP(32),B4       ; |284| 
           MVKL    .S1     __divf,A0         ; |284| 
           MVKH    .S1     __divf,A0         ; |284| 
           NOP             1
           B       .S2X    A0                ; |284| 
           INTSPU  .L2     B4,B5             ; |284| 
           MV      .L2X    A3,B4             ; |284| 
           NOP             2
           MV      .S1X    B5,A4             ; |284| 
RL48:      ; CALL OCCURS                     ; |284| 
           MVKL    .S2     __divf,B5         ; |284| 
           MVKH    .S2     __divf,B5         ; |284| 
           B       .S2     B5                ; |284| 
           MVKL    .S2     0x3fe66666,B6     ; |284| 
           MVKH    .S2     0x3fe66666,B6     ; |284| 
           MVKL    .S2     RL50,B3           ; |284| 
           MVKH    .S2     RL50,B3           ; |284| 

           MV      .L2X    A4,B4             ; |284| 
||         MV      .S1X    B6,A4             ; |284| 

RL50:      ; CALL OCCURS                     ; |284| 
           MVKL    .S2     _USB_vel,B4       ; |284| 
           MVKH    .S2     _USB_vel,B4       ; |284| 
           STW     .D2T1   A4,*B4            ; |284| 
           LDW     .D2T2   *+SP(32),B4       ; |285| 
           MVKL    .S1     __divf,A0         ; |285| 
           MVKH    .S1     __divf,A0         ; |285| 
           MVKL    .S2     RL54,B3           ; |285| 
           B       .S2X    A0                ; |285| 
           INTSPU  .L2     B4,B5             ; |285| 
           MVKL    .S2     0x47c35000,B4     ; |285| 
           MVKH    .S2     0x47c35000,B4     ; |285| 
           MVKH    .S2     RL54,B3           ; |285| 
           MV      .S1X    B5,A4             ; |285| 
RL54:      ; CALL OCCURS                     ; |285| 
           MVKL    .S1     _USB_prevVel,A3   ; |285| 
           MVKL    .S1     _USB_vel,A0       ; |285| 
           MVKH    .S1     _USB_vel,A0       ; |285| 

           LDW     .D1T1   *A0,A0            ; |285| 
||         MVKH    .S1     _USB_prevVel,A3   ; |285| 

           LDW     .D1T1   *A3,A3            ; |285| 
           MVKL    .S2     __divf,B5         ; |285| 
           MVKH    .S2     __divf,B5         ; |285| 
           MVKL    .S2     RL56,B3           ; |285| 
           B       .S2     B5                ; |285| 
           SUBSP   .L1     A0,A3,A0          ; |285| 
           MV      .L2X    A4,B4             ; |285| 
           MVKH    .S2     RL56,B3           ; |285| 
           NOP             1
           MV      .D1     A0,A4             ; |285| 
RL56:      ; CALL OCCURS                     ; |285| 
           MVKL    .S1     _USB_acc,A0       ; |285| 

           MVKL    .S2     _USB_vel,B4       ; |286| 
||         MVKH    .S1     _USB_acc,A0       ; |285| 

           MVKH    .S2     _USB_vel,B4       ; |286| 
||         STW     .D1T1   A4,*A0            ; |285| 

           LDW     .D2T1   *B4,A0            ; |286| 
           MVKL    .S1     _USB_prevVel,A3   ; |286| 
           MVKH    .S1     _USB_prevVel,A3   ; |286| 
           MVKL    .S2     _totalSteps,B5    ; |288| 
           MVKH    .S2     _totalSteps,B5    ; |288| 
           STW     .D1T1   A0,*A3            ; |286| 
           LDW     .D2T2   *+SP(32),B4       ; |287| 
           MVKL    .S1     _USB_delayCnt,A0  ; |287| 
           MVKH    .S1     _USB_delayCnt,A0  ; |287| 
           NOP             2
           STW     .D1T2   B4,*A0            ; |287| 
           LDW     .D2T2   *+SP(40),B4       ; |288| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |288| 
           STW     .D2T2   B4,*+SP(40)       ; |288| 
           LDW     .D2T2   *B5,B4            ; |288| 
           LDW     .D2T2   *+SP(40),B5       ; |288| 
           NOP             4
           CMPGT   .L2     B5,B4,B0          ; |288| 
   [!B0]   B       .S1     L19               ; |288| 
   [!B0]   LDW     .D2T2   *+SP(24),B4       ; |264| 
           NOP             4
           ; BRANCH OCCURS                   ; |288| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _USB_pos,B4       ; |292| 

           MVKH    .S2     _USB_pos,B4       ; |292| 
||         MVKL    .S1     _USB_acc,A0       ; |293| 
||         ZERO    .D2     B5                ; |292| 

           MVKL    .S2     _USB_prevVel,B5   ; |294| 
||         STW     .D2T2   B5,*B4            ; |292| 
||         MVKH    .S1     _USB_acc,A0       ; |293| 
||         ZERO    .D1     A3                ; |293| 

           MVKL    .S1     _USB_delayCnt,A0  ; |295| 
||         STW     .D1T1   A3,*A0            ; |293| 
||         ZERO    .D2     B4                ; |294| 
||         MVKH    .S2     _USB_prevVel,B5   ; |294| 

           STW     .D2T2   B4,*B5            ; |294| 
||         MVKH    .S1     _USB_delayCnt,A0  ; |295| 

;** --------------------------------------------------------------------------*
L22:    
           STW     .D1T1   A3,*A0            ; |295| 
           LDW     .D2T2   *+SP(44),B3       ; |296| 
           LDW     .D2T2   *+SP(48),B10      ; |296| 
           LDW     .D2T2   *+SP(52),B11      ; |296| 
           LDW     .D2T2   *++SP(56),B12     ; |296| 
           NOP             1
           B       .S2     B3                ; |296| 
           NOP             5
           ; BRANCH OCCURS                   ; |296| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 16 Args + 12 Auto + 4 Save = 32 byte                 *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |306| 
           MVKH    .S1     _InitEXINTF,A0    ; |306| 
           B       .S2X    A0                ; |306| 
           STW     .D2T2   B3,*SP--(32)      ; |301| 
           MVKL    .S2     RL58,B3           ; |306| 
           MVKH    .S2     RL58,B3           ; |306| 
           NOP             2
RL58:      ; CALL OCCURS                     ; |306| 
           MVKL    .S1     _InitTimer,A0     ; |307| 
           MVKH    .S1     _InitTimer,A0     ; |307| 
           B       .S2X    A0                ; |307| 
           MVKL    .S2     RL60,B3           ; |307| 
           MVKH    .S2     RL60,B3           ; |307| 
           NOP             3
RL60:      ; CALL OCCURS                     ; |307| 
           MVKL    .S2     _InitUART,B4      ; |308| 
           MVKH    .S2     _InitUART,B4      ; |308| 
           B       .S2     B4                ; |308| 
           MVKL    .S2     RL62,B3           ; |308| 
           MVKH    .S2     RL62,B3           ; |308| 
           NOP             3
RL62:      ; CALL OCCURS                     ; |308| 
           MVKL    .S1     _InitINT,A0       ; |309| 
           MVKH    .S1     _InitINT,A0       ; |309| 
           B       .S2X    A0                ; |309| 
           MVKL    .S2     RL64,B3           ; |309| 
           MVKH    .S2     RL64,B3           ; |309| 
           NOP             3
RL64:      ; CALL OCCURS                     ; |309| 
           MVKL    .S1     _InitUSBMon,A0    ; |310| 
           MVKH    .S1     _InitUSBMon,A0    ; |310| 
           B       .S2X    A0                ; |310| 
           MVKL    .S2     RL66,B3           ; |310| 
           MVKH    .S2     RL66,B3           ; |310| 
           NOP             3
RL66:      ; CALL OCCURS                     ; |310| 
           MVKL    .S1     _sprintf,A0       ; |312| 

           MVKH    .S1     _sprintf,A0       ; |312| 
||         MVKL    .S2     _tmp_string,B5    ; |312| 

           B       .S2X    A0                ; |312| 
           MVKL    .S2     RL68,B3           ; |312| 
           MVKH    .S2     _tmp_string,B5    ; |312| 
           MVKL    .S2     SL1+0,B4          ; |312| 
           MVKH    .S2     SL1+0,B4          ; |312| 

           MVKH    .S2     RL68,B3           ; |312| 
||         MV      .S1X    B5,A4             ; |312| 
||         STW     .D2T2   B4,*+SP(4)        ; |312| 

RL68:      ; CALL OCCURS                     ; |312| 
           MVKL    .S1     _Report,A0        ; |312| 
           MVKH    .S1     _Report,A0        ; |312| 
           B       .S2X    A0                ; |312| 
           MVKL    .S2     RL70,B3           ; |312| 
           MVKH    .S2     RL70,B3           ; |312| 
           NOP             3
RL70:      ; CALL OCCURS                     ; |312| 
           MVK     .S1     2024,A0           ; |313| 

           MVKL    .S1     _sprintf,A0       ; |313| 
||         STW     .D2T1   A0,*+SP(8)        ; |313| 

           MVKH    .S1     _sprintf,A0       ; |313| 
||         MVKL    .S2     SL2+0,B4          ; |313| 

           B       .S2X    A0                ; |313| 
           MVKH    .S2     SL2+0,B4          ; |313| 
           MVKL    .S2     _tmp_string,B5    ; |313| 
           MVKH    .S2     _tmp_string,B5    ; |313| 
           MVKL    .S2     RL72,B3           ; |313| 

           STW     .D2T2   B4,*+SP(4)        ; |313| 
||         MVKH    .S2     RL72,B3           ; |313| 
||         MV      .S1X    B5,A4             ; |313| 

RL72:      ; CALL OCCURS                     ; |313| 
           MVKL    .S1     _Report,A0        ; |313| 
           MVKH    .S1     _Report,A0        ; |313| 
           B       .S2X    A0                ; |313| 
           MVKL    .S2     RL74,B3           ; |313| 
           MVKH    .S2     RL74,B3           ; |313| 
           NOP             3
RL74:      ; CALL OCCURS                     ; |313| 
           MVKL    .S2     SL3+0,B4          ; |314| 
           MVKL    .S2     0x20003fc,B5      ; |314| 
           MVKH    .S2     SL3+0,B4          ; |314| 

           MVKH    .S2     0x20003fc,B5      ; |314| 
||         STW     .D2T2   B4,*+SP(4)        ; |314| 

           LDW     .D2T2   *B5,B4            ; |314| 
           MVKL    .S1     0x20003fc,A0      ; |314| 
           MVKH    .S1     0x20003fc,A0      ; |314| 
           MVKL    .S1     _tmp_string,A4    ; |314| 
           MVKL    .S2     RL76,B3           ; |314| 
           EXTU    .S2     B4,16,24,B4       ; |314| 
           STW     .D2T2   B4,*+SP(8)        ; |314| 

           MVKL    .S1     _sprintf,A0       ; |314| 
||         LDW     .D1T1   *A0,A3            ; |314| 

           MVKH    .S1     _sprintf,A0       ; |314| 
           B       .S2X    A0                ; |314| 
           MVKH    .S2     RL76,B3           ; |314| 
           MVKH    .S1     _tmp_string,A4    ; |314| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |314| 
           STW     .D2T1   A3,*+SP(12)       ; |314| 
RL76:      ; CALL OCCURS                     ; |314| 
           MVKL    .S1     _Report,A0        ; |314| 
           MVKH    .S1     _Report,A0        ; |314| 
           B       .S2X    A0                ; |314| 
           MVKL    .S2     RL78,B3           ; |314| 
           MVKH    .S2     RL78,B3           ; |314| 
           NOP             3
RL78:      ; CALL OCCURS                     ; |314| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _GIE,B4           ; |317| 
           MVKH    .S2     _GIE,B4           ; |317| 
           B       .S2     B4                ; |317| 
           MVKL    .S2     RL80,B3           ; |317| 
           ZERO    .D2     B5                ; |316| 
           MVKL    .S1     _TFlag,A0         ; |316| 
           MVKH    .S1     _TFlag,A0         ; |316| 

           STW     .D1T2   B5,*A0            ; |316| 
||         MVKH    .S2     RL80,B3           ; |317| 

RL80:      ; CALL OCCURS                     ; |317| 
           MVKL    .S1     _WaitTFlagCnt,A5  ; |326| 
           MVKL    .S1     _currentPhaseIndex,A3 ; |321| 
           MVKL    .S1     _currentDir,A4    ; |323| 
           MVKH    .S1     _WaitTFlagCnt,A5  ; |326| 
           MVKL    .S1     _previousDir,A6   ; |324| 

           B       .S2X    A5                ; |326| 
||         MVKL    .S1     0x200004c,A0      ; |319| 

           MVK     .S2     1,B4              ; |319| 
||         MVKH    .S1     0x200004c,A0      ; |319| 

           STW     .D1T2   B4,*A0            ; |319| 
||         MVKH    .S1     _currentPhaseIndex,A3 ; |321| 

           ZERO    .D2     B4                ; |323| 
||         STW     .D1T2   B4,*A3            ; |321| 
||         MVKH    .S1     _currentDir,A4    ; |323| 

           STW     .D1T2   B4,*A4            ; |323| 
||         ZERO    .L1     A0                ; |324| 
||         MVKL    .S2     RL82,B3           ; |326| 
||         MVKH    .S1     _previousDir,A6   ; |324| 

           STW     .D1T1   A0,*A6            ; |324| 
||         MVK     .S1     0x2710,A4         ; |326| 
||         MVKH    .S2     RL82,B3           ; |326| 

RL82:      ; CALL OCCURS                     ; |326| 

           MVK     .S2     3000,B5           ; |330| 
||         MVK     .S1     1,A5              ; |332| 

           STW     .D2T2   B5,*+SP(24)       ; |330| 
||         MVK     .S2     -360,B4           ; |330| 
||         MVKL    .S1     _currentPhaseIndex,A3 ; |332| 

           STW     .D2T2   B4,*+SP(20)       ; |330| 
||         MVK     .S2     20000,B5          ; |330| 
||         MVKH    .S1     _currentPhaseIndex,A3 ; |332| 

           STW     .D2T2   B5,*+SP(28)       ; |330| 
||         CMPGT   .L1X    B4,0,A1           ; |331| 
||         MVKL    .S1     _currentPhaseIndex,A0 ; |331| 

   [!A1]   STW     .D1T1   A5,*A3            ; |332| 
||         MVKH    .S1     _currentPhaseIndex,A0 ; |331| 
||         ZERO    .L1     A4                ; |331| 

   [ A1]   STW     .D1T1   A4,*A0            ; |331| 
           LDW     .D2T2   *+SP(28),B4       ; |334| 
           LDW     .D2T2   *+SP(24),B8       ; |334| 
           LDW     .D2T2   *+SP(20),B6       ; |334| 
           MVKL    .S2     _StepMoveVP,B5    ; |334| 
           MVKH    .S2     _StepMoveVP,B5    ; |334| 
           B       .S2     B5                ; |334| 
           INTSP   .L2     B4,B7             ; |334| 

           INTSP   .L1X    B6,A4             ; |334| 
||         INTSP   .L2     B8,B4             ; |334| 

           MVKL    .S2     RL84,B3           ; |334| 
           MVKH    .S2     RL84,B3           ; |334| 
           MV      .S1X    B7,A6             ; |334| 
RL84:      ; CALL OCCURS                     ; |334| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L23:    
           B       .S1     L23               ; |336| 
           NOP             5
           ; BRANCH OCCURS                   ; |336| 


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
	.global	_sqrt
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	__divd
	.global	__divf
