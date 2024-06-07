;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Fri Jun 07 15:01:20 2024                                *
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
	.field  	_prevErr+0,32
	.word	000000000h		; _prevErr @ 0
	.sect	".text"
	.global	_prevErr
_prevErr:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sumErr+0,32
	.word	000000000h		; _sumErr @ 0
	.sect	".text"
	.global	_sumErr
_sumErr:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_cart_prevErr+0,32
	.word	000000000h		; _cart_prevErr @ 0
	.sect	".text"
	.global	_cart_prevErr
_cart_prevErr:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_cart_sumErr+0,32
	.word	000000000h		; _cart_sumErr @ 0
	.sect	".text"
	.global	_cart_sumErr
_cart_sumErr:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_TFlag+0,32
	.field  	0,32			; _TFlag @ 0
	.sect	".text"
	.global	_TFlag
_TFlag:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\user\AppData\Local\Temp\TI8384_2 --template_info_file C:\Users\user\AppData\Local\Temp\TI8384_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
	.sect	".text"
	.global	_ISRextint4

;******************************************************************************
;* FUNCTION NAME: _ISRextint4                                                 *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRextint4:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |11| 
           NOP             5
           ; BRANCH OCCURS                   ; |11| 


	.sect	".text"
	.global	_ISRextint5

;******************************************************************************
;* FUNCTION NAME: _ISRextint5                                                 *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRextint5:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |17| 
           NOP             5
           ; BRANCH OCCURS                   ; |17| 


	.sect	".text"
	.global	_c_int08

;******************************************************************************
;* FUNCTION NAME: _c_int08                                                    *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_c_int08:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |29| 
           NOP             5
           ; BRANCH OCCURS                   ; |29| 


	.sect	".text"
	.global	_c_int09

;******************************************************************************
;* FUNCTION NAME: _c_int09                                                    *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_c_int09:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |35| 
           NOP             5
           ; BRANCH OCCURS                   ; |35| 


	.sect	".text"
	.global	_ISRNMI

;******************************************************************************
;* FUNCTION NAME: _ISRNMI                                                     *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRNMI:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |19| 
           NOP             5
           ; BRANCH OCCURS                   ; |19| 


	.sect	".text"
	.global	_ISRextint6

;******************************************************************************
;* FUNCTION NAME: _ISRextint6                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 4 Auto + 84 Save = 88 byte                  *
;******************************************************************************
_ISRextint6:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B9,*SP--(88)      ; |22| 
           STW     .D2T1   A0,*+SP(12)       ; |22| 
           STW     .D2T2   B7,*+SP(80)       ; |22| 
           STW     .D2T2   B6,*+SP(76)       ; |22| 
           STW     .D2T2   B5,*+SP(72)       ; |22| 
           STW     .D2T2   B4,*+SP(68)       ; |22| 
           STW     .D2T2   B3,*+SP(64)       ; |22| 
           STW     .D2T2   B2,*+SP(60)       ; |22| 
           STW     .D2T2   B1,*+SP(56)       ; |22| 
           STW     .D2T2   B0,*+SP(52)       ; |22| 
           STW     .D2T1   A9,*+SP(48)       ; |22| 
           STW     .D2T1   A8,*+SP(44)       ; |22| 
           STW     .D2T1   A7,*+SP(40)       ; |22| 
           STW     .D2T1   A6,*+SP(36)       ; |22| 
           STW     .D2T1   A5,*+SP(32)       ; |22| 
           STW     .D2T1   A4,*+SP(28)       ; |22| 
           STW     .D2T1   A3,*+SP(24)       ; |22| 
           STW     .D2T1   A2,*+SP(20)       ; |22| 

           STW     .D2T1   A1,*+SP(16)       ; |22| 
||         MVKL    .S1     0x2000008,A0      ; |25| 

           MVKH    .S1     0x2000008,A0      ; |25| 
||         STW     .D2T2   B8,*+SP(84)       ; |22| 

           LDW     .D1T1   *A0,A0            ; |25| 
           NOP             4
           AND     .S1     15,A0,A0          ; |25| 
           CMPEQ   .L1     A0,1,A1           ; |25| 
   [ A1]   B       .S1     L8                ; |25| 
           STW     .D2T1   A0,*+SP(4)        ; |25| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |59| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |59| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |59| 
   [ A1]   LDW     .D2T2   *+SP(68),B4       ; |59| 
           ; BRANCH OCCURS                   ; |25| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(4),B4        ; |26| 
           NOP             3
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L1
;** --------------------------------------------------------------------------*
L1:    
           NOP             1
           CMPEQ   .L2     B4,4,B0           ; |26| 
   [!B0]   B       .S1     L3                ; |26| 

   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |38| 
|| [ B0]   MVKL    .S1     0x2000014,A0      ; |27| 

   [ B0]   MVKH    .S1     0x2000014,A0      ; |27| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |27| 
           NOP             2
           ; BRANCH OCCURS                   ; |26| 
;** --------------------------------------------------------------------------*
           NOP             2
           AND     .S1     1,A0,A1           ; |27| 
   [!A1]   B       .S1     L7                ; |27| 
   [!A1]   MVKL    .S1     0x2000008,A0      ; |58| 
   [!A1]   MVKH    .S1     0x2000008,A0      ; |58| 

   [ A1]   ZERO    .D2     B4                ; |28| 
|| [ A1]   MVKL    .S2     _compacket+124,B5 ; |28| 
|| [!A1]   LDW     .D1T1   *A0,A0            ; |58| 

   [ A1]   MVKH    .S2     0x2000000,B4      ; |28| 

   [ A1]   MVKH    .S2     _compacket+124,B5 ; |28| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |28| 

           ; BRANCH OCCURS                   ; |27| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *B5,B5            ; |28| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L2:    
           MVKL    .S1     _compacket+124,A0 ; |29| 
           MVKH    .S1     _compacket+124,A0 ; |29| 
           EXTU    .S2     B4,24,24,B4       ; |28| 
           STB     .D2T2   B4,*B5            ; |28| 
           LDW     .D1T1   *A0,A3            ; |29| 
           MVKL    .S1     _SendByte,A0      ; |29| 
           MVKH    .S1     _SendByte,A0      ; |29| 
           MVKL    .S2     RL0,B3            ; |29| 
           B       .S2X    A0                ; |29| 
           LDB     .D1T1   *A3,A4            ; |29| 
           MVKH    .S2     RL0,B3            ; |29| 
           NOP             3
RL0:       ; CALL OCCURS                     ; |29| 
           MVKL    .S2     _compacket+124,B4 ; |30| 
           MVKH    .S2     _compacket+124,B4 ; |30| 
           LDW     .D2T2   *B4,B4            ; |30| 
           MVKL    .S1     _compacket+99,A0  ; |30| 
           MVKH    .S1     _compacket+99,A0  ; |30| 
           NOP             2
           CMPEQ   .L1X    B4,A0,A1          ; |30| 
   [!A1]   MVKL    .S2     _compacket+124,B4 ; |34| 
   [!A1]   MVKH    .S2     _compacket+124,B4 ; |34| 
   [!A1]   LDW     .D2T2   *B4,B5            ; |34| 
   [ A1]   MVKL    .S2     _compacket+124,B4 ; |31| 
   [ A1]   MVKL    .S1     _compacket,A0     ; |31| 
   [ A1]   MVKH    .S2     _compacket+124,B4 ; |31| 
   [ A1]   MVKH    .S1     _compacket,A0     ; |31| 

           MVKL    .S2     0x2000014,B5      ; |36| 
|| [!A1]   ADD     .D2     1,B5,B6           ; |34| 

   [!A1]   STW     .D2T2   B6,*B4            ; |34| 

   [ A1]   STW     .D2T1   A0,*B4            ; |31| 
||         MVKH    .S2     0x2000014,B5      ; |36| 

           LDW     .D2T2   *B5,B4            ; |36| 
           NOP             4
           AND     .S2     1,B4,B0           ; |36| 
   [ B0]   B       .S1     L2                ; |36| 

   [ B0]   ZERO    .D2     B4                ; |28| 
|| [ B0]   MVKL    .S2     _compacket+124,B5 ; |28| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |28| 

   [ B0]   MVKH    .S2     _compacket+124,B5 ; |28| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |28| 

   [ B0]   LDW     .D2T2   *B5,B5            ; |28| 
           NOP             1
           ; BRANCH OCCURS                   ; |36| 
;** --------------------------------------------------------------------------*
           B       .S1     L7                ; |37| 
           MVKL    .S1     0x2000008,A0      ; |58| 
           MVKH    .S1     0x2000008,A0      ; |58| 
           LDW     .D1T1   *A0,A0            ; |58| 
           NOP             2
           ; BRANCH OCCURS                   ; |37| 
;** --------------------------------------------------------------------------*
L3:    
           CMPEQ   .L2     B4,2,B0           ; |38| 
   [!B0]   B       .S1     L4                ; |38| 
   [ B0]   MVKL    .S2     _respacket+200,B4 ; |39| 
           NOP             3
   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |47| 
           ; BRANCH OCCURS                   ; |38| 
;** --------------------------------------------------------------------------*
           MVKH    .S2     _respacket+200,B4 ; |39| 
           LDW     .D2T2   *B4,B5            ; |39| 
           NOP             4
           CMPGT   .L2     B5,0,B0           ; |39| 

   [ B0]   MVKL    .S1     _respacket+204,A0 ; |40| 
||         SUB     .D2     B5,1,B5           ; |39| 

   [ B0]   MVKH    .S1     _respacket+204,A0 ; |40| 
||         STW     .D2T2   B5,*B4            ; |39| 

   [ B0]   LDW     .D1T1   *A0,A3            ; |40| 
   [ B0]   MVKL    .S1     _respacket,A4     ; |40| 
   [ B0]   MVKH    .S1     _respacket,A4     ; |40| 
   [!B0]   MVKL    .S1     0x2000004,A0      ; |43| 
   [!B0]   MVKL    .S2     _respacket+208,B4 ; |44| 
   [ B0]   ADD     .D1     1,A3,A5           ; |40| 
   [ B0]   STW     .D1T1   A5,*A0            ; |40| 

           B       .S1     L6                ; |46| 
|| [ B0]   LDB     .D1T1   *+A3[A4],A0       ; |40| 

   [!B0]   MVKH    .S1     0x2000004,A0      ; |43| 
   [!B0]   MVK     .S2     1,B5              ; |43| 

   [!B0]   ZERO    .D2     B5                ; |44| 
|| [ B0]   ZERO    .L2     B4                ; |40| 
|| [!B0]   MVKH    .S2     _respacket+208,B4 ; |44| 
|| [!B0]   STW     .D1T2   B5,*A0            ; |43| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |40| 
|| [!B0]   STW     .D2T2   B5,*B4            ; |44| 

   [ B0]   STW     .D2T1   A0,*B4            ; |40| 
           ; BRANCH OCCURS                   ; |46| 
;** --------------------------------------------------------------------------*
L4:    
           NOP             4
           CMPEQ   .L2     B4,12,B0          ; |47| 
   [!B0]   B       .S1     L6                ; |47| 
           NOP             2
   [ B0]   MVKL    .S1     0x2000014,A0      ; |48| 
   [ B0]   MVKH    .S1     0x2000014,A0      ; |48| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |48| 
           ; BRANCH OCCURS                   ; |47| 
;** --------------------------------------------------------------------------*
           NOP             4
           AND     .S1     1,A0,A1           ; |48| 
   [!A1]   B       .S1     L6                ; |48| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |49| 
           ; BRANCH OCCURS                   ; |48| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    

           MVKH    .S2     0x2000000,B4      ; |49| 
||         MVKL    .S1     _compacket+124,A0 ; |49| 

           LDW     .D2T2   *B4,B4            ; |49| 
||         MVKH    .S1     _compacket+124,A0 ; |49| 

           LDW     .D1T1   *A0,A3            ; |49| 
           MVKL    .S1     _compacket+124,A0 ; |50| 
           MVKH    .S1     _compacket+124,A0 ; |50| 
           NOP             1
           EXTU    .S2     B4,24,24,B4       ; |49| 
           STB     .D1T2   B4,*A3            ; |49| 
           LDW     .D1T1   *A0,A0            ; |50| 
           MVKL    .S2     _compacket+99,B4  ; |50| 
           MVKH    .S2     _compacket+99,B4  ; |50| 
           NOP             2
           CMPEQ   .L2X    A0,B4,B0          ; |50| 
   [!B0]   MVKL    .S1     _compacket+124,A0 ; |54| 
   [!B0]   MVKH    .S1     _compacket+124,A0 ; |54| 
   [!B0]   MV      .D1     A0,A4             ; |54| 
   [!B0]   LDW     .D1T1   *A4,A0            ; |54| 
   [ B0]   MVKL    .S1     _compacket+124,A0 ; |51| 
   [ B0]   MVKL    .S2     _compacket,B4     ; |51| 
   [ B0]   MVKH    .S1     _compacket+124,A0 ; |51| 
   [ B0]   MVKH    .S2     _compacket,B4     ; |51| 

           MVKL    .S1     0x2000014,A0      ; |56| 
|| [!B0]   ADD     .L1     1,A0,A3           ; |54| 
|| [ B0]   STW     .D1T2   B4,*A0            ; |51| 

           MVKH    .S1     0x2000014,A0      ; |56| 
|| [!B0]   STW     .D1T1   A3,*A4            ; |54| 

           LDW     .D1T1   *A0,A0            ; |56| 
           NOP             4
           AND     .S1     1,A0,A1           ; |56| 
   [ A1]   B       .S1     L5                ; |56| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |49| 
           ; BRANCH OCCURS                   ; |56| 
;** --------------------------------------------------------------------------*
L6:    
           MVKL    .S1     0x2000008,A0      ; |58| 
           MVKH    .S1     0x2000008,A0      ; |58| 
           LDW     .D1T1   *A0,A0            ; |58| 
           NOP             2
;** --------------------------------------------------------------------------*
L7:    
           NOP             2
           AND     .S1     15,A0,A0          ; |58| 
           CMPEQ   .L1     A0,1,A1           ; |58| 
   [!A1]   B       .S1     L1                ; |58| 
           STW     .D2T1   A0,*+SP(4)        ; |58| 
   [!A1]   LDW     .D2T2   *+SP(4),B4        ; |26| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |59| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |59| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |59| 
           ; BRANCH OCCURS                   ; |58| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(68),B4       ; |59| 
;** --------------------------------------------------------------------------*
L8:    
           LDW     .D2T2   *+SP(64),B3       ; |59| 
           LDW     .D2T2   *+SP(60),B2       ; |59| 
           LDW     .D2T2   *+SP(56),B1       ; |59| 
           LDW     .D2T2   *+SP(52),B0       ; |59| 
           LDW     .D2T1   *+SP(48),A9       ; |59| 
           LDW     .D2T1   *+SP(44),A8       ; |59| 
           LDW     .D2T1   *+SP(40),A7       ; |59| 
           LDW     .D2T1   *+SP(36),A6       ; |59| 
           LDW     .D2T1   *+SP(32),A5       ; |59| 
           LDW     .D2T1   *+SP(28),A4       ; |59| 
           LDW     .D2T1   *+SP(24),A3       ; |59| 
           LDW     .D2T1   *+SP(20),A2       ; |59| 
           LDW     .D2T1   *+SP(16),A1       ; |59| 
           LDW     .D2T1   *+SP(12),A0       ; |59| 

           B       .S2     IRP               ; |59| 
||         LDW     .D2T2   *+SP(84),B8       ; |59| 

           LDW     .D2T2   *++SP(88),B9      ; |59| 
           NOP             4
           ; BRANCH OCCURS                   ; |59| 


	.sect	".text"
	.global	_ISRtimer0

;******************************************************************************
;* FUNCTION NAME: _ISRtimer0                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,B0,*
;*                           B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,SP    *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,B0,*
;*                           B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,SP    *
;*   Local Frame Size  : 0 Args + 32 Auto + 120 Save = 152 byte               *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -152,SP           ; |76| 
           STW     .D2T2   B4,*+SP(116)      ; |76| 
           STW     .D2T2   B3,*+SP(112)      ; |76| 
           STW     .D2T2   B11,*+SP(144)     ; |76| 
           STW     .D2T2   B10,*+SP(140)     ; |76| 
           STW     .D2T2   B9,*+SP(136)      ; |76| 
           STW     .D2T2   B8,*+SP(132)      ; |76| 
           STW     .D2T2   B7,*+SP(128)      ; |76| 
           STW     .D2T2   B6,*+SP(124)      ; |76| 
           STW     .D2T2   B5,*+SP(120)      ; |76| 
           STW     .D2T2   B2,*+SP(108)      ; |76| 
           STW     .D2T2   B1,*+SP(104)      ; |76| 
           STW     .D2T2   B0,*+SP(100)      ; |76| 
           STW     .D2T1   A14,*+SP(96)      ; |76| 
           STW     .D2T1   A13,*+SP(92)      ; |76| 
           STW     .D2T1   A12,*+SP(88)      ; |76| 
           STW     .D2T1   A11,*+SP(84)      ; |76| 
           STW     .D2T1   A10,*+SP(80)      ; |76| 
           STW     .D2T1   A9,*+SP(76)       ; |76| 
           STW     .D2T1   A8,*+SP(72)       ; |76| 
           STW     .D2T1   A7,*+SP(68)       ; |76| 
           STW     .D2T1   A6,*+SP(64)       ; |76| 

           STW     .D2T1   A5,*+SP(60)       ; |76| 
||         MVKL    .S2     _GetPendulumAngle,B4 ; |82| 

           STW     .D2T1   A4,*+SP(56)       ; |76| 
||         MVKH    .S2     _GetPendulumAngle,B4 ; |82| 

           B       .S2     B4                ; |82| 
||         STW     .D2T2   B12,*+SP(148)     ; |76| 

           STW     .D2T1   A3,*+SP(52)       ; |76| 
           STW     .D2T1   A2,*+SP(48)       ; |76| 
           STW     .D2T1   A1,*+SP(44)       ; |76| 

           STW     .D2T1   A0,*+SP(40)       ; |76| 
||         MVKL    .S2     RL2,B3            ; |82| 

           MVKH    .S2     RL2,B3            ; |82| 
||         STW     .D2T2   B13,*+SP(152)     ; |76| 

RL2:       ; CALL OCCURS                     ; |82| 
           MVKL    .S2     _GetCartPos,B4    ; |83| 
           MVKH    .S2     _GetCartPos,B4    ; |83| 
           B       .S2     B4                ; |83| 
           STW     .D2T1   A4,*+SP(4)        ; |82| 
           NOP             2
           MVKL    .S2     RL4,B3            ; |83| 
           MVKH    .S2     RL4,B3            ; |83| 
RL4:       ; CALL OCCURS                     ; |83| 

           MVKL    .S2     _R,B4             ; |86| 
||         STW     .D2T1   A4,*+SP(16)       ; |83| 

           MVKH    .S2     _R,B4             ; |86| 
||         LDW     .D2T1   *+SP(4),A0        ; |86| 

           LDW     .D2T2   *B4,B4            ; |86| 
           MVKL    .S1     _cart_R,A6        ; |87| 
           MVKH    .S1     _cart_R,A6        ; |87| 
           LDW     .D2T2   *+SP(16),B12      ; |87| 
           ZERO    .D1     A7                ; |90| 
           SUBSP   .L2X    B4,A0,B4          ; |86| 
           MVKH    .S1     0x40240000,A7     ; |90| 
           MVKL    .S1     _prevErr,A3       ; |101| 
           MVKL    .S2     _prevErr,B11      ; |96| 
           STW     .D2T2   B4,*+SP(8)        ; |86| 
           LDW     .D1T1   *A6,A6            ; |87| 
           MVKL    .S1     _sumErr,A9        ; |100| 
           SPDP    .S2     B4,B5:B4          ; |90| 
           MVKL    .S1     _prevErr,A8       ; |102| 
           ABSDP   .S2     B5:B4,B7:B6       ; |90| 

           ZERO    .D1     A6                ; |90| 
||         SUBSP   .L2X    A6,B12,B13        ; |87| 

           CMPGTDP .S1X    B7:B6,A7:A6,A1    ; |90| 
           MVKL    .S2     _SwingUpControl,B5 ; |91| 
           MVKL    .S2     _PWMOut,B0        ; |111| 
           MVKL    .S2     0xbe4ccccd,B1     ; |106| 

           MVKL    .S1     _sumErr,A5        ; |101| 
||         MVKL    .S2     _cart_sumErr,B10  ; |94| 

           MVKL    .S1     0xb951b717,A2     ; |106| 
||         MVKL    .S2     _cart_prevErr,B8  ; |106| 

           ZERO    .D2     B4                ; |101| 
||         MVKL    .S1     _cart_prevErr,A11 ; |95| 
||         MVKL    .S2     0xbd4ccccd,B2     ; |106| 

           MVKL    .S1     _cart_prevErr,A14 ; |107| 
||         MVKH    .S2     0x41a00000,B4     ; |101| 

           ZERO    .D2     B9                ; |101| 
||         MVKL    .S1     _sumErr,A10       ; |93| 
||         MVKH    .S2     _SwingUpControl,B5 ; |91| 

           MVKH    .S2     0x41200000,B9     ; |101| 
||         MVKH    .S1     _prevErr,A3       ; |101| 

           MVKH    .S1     _sumErr,A9        ; |100| 
||         MVKH    .S2     _prevErr,B11      ; |96| 

           MVKH    .S1     _prevErr,A8       ; |102| 
||         MVKH    .S2     _PWMOut,B0        ; |111| 

           MVKH    .S2     0xbe4ccccd,B1     ; |106| 
||         MVKH    .S1     _sumErr,A5        ; |101| 

           MVKH    .S1     0xb951b717,A2     ; |106| 
||         MVKH    .S2     _cart_sumErr,B10  ; |94| 

           MVKH    .S2     _cart_prevErr,B8  ; |106| 
||         MVKH    .S1     _cart_prevErr,A11 ; |95| 

           MVKH    .S1     _cart_prevErr,A14 ; |107| 
|| [!A1]   B       .S2     L9                ; |90| 

           MVKH    .S2     0xbd4ccccd,B2     ; |106| 
||         MVKH    .S1     _sumErr,A10       ; |93| 

           MVKL    .S2     _cart_sumErr,B3   ; |105| 
||         MVKL    .S1     0x3e0f5c29,A4     ; |101| 

           MVKH    .S2     _cart_sumErr,B3   ; |105| 
||         STW     .D2T2   B13,*+SP(20)      ; |87| 
||         MVKL    .S1     _cart_sumErr,A0   ; |106| 

           MVKL    .S2     RL6,B3            ; |91| 
||         MV      .L1X    B3,A6             ; |105| 
||         ZERO    .D2     B13               ; |94| 
||         MVKH    .S1     0x3e0f5c29,A4     ; |101| 

           ZERO    .L1     A12               ; |95| 
||         ZERO    .D1     A13               ; |93| 
||         MVKH    .S2     RL6,B3            ; |91| 
||         LDW     .D2T1   *+SP(8),A7        ; |100| 
||         ZERO    .L2     B12               ; |96| 
||         MVKH    .S1     _cart_sumErr,A0   ; |106| 

           ; BRANCH OCCURS                   ; |90| 
;** --------------------------------------------------------------------------*
           B       .S2     B5                ; |91| 
           NOP             5
RL6:       ; CALL OCCURS                     ; |91| 
           B       .S1     L10               ; |97| 
           STW     .D1T1   A13,*A10          ; |93| 
           STW     .D2T2   B13,*B10          ; |94| 
           STW     .D1T1   A12,*A11          ; |95| 

           MVKL    .S2     _UMAddData,B5     ; |117| 
||         STW     .D2T2   B12,*B11          ; |96| 

           MVKL    .S1     _R,A0             ; |117| 
||         MVKH    .S2     _UMAddData,B5     ; |117| 
||         LDW     .D2T2   *+SP(20),B4       ; |117| 

           ; BRANCH OCCURS                   ; |97| 
;** --------------------------------------------------------------------------*
L9:    
           LDW     .D1T1   *A9,A1            ; |100| 
           MVKL    .S2     RL8,B3            ; |111| 
           MVKH    .S2     RL8,B3            ; |111| 
           NOP             2
           ADDSP   .L1     A7,A1,A7          ; |100| 
           NOP             3
           STW     .D1T1   A7,*A9            ; |100| 
           LDW     .D1T1   *A3,A3            ; |101| 

           LDW     .D1T1   *A5,A5            ; |101| 
||         LDW     .D2T2   *+SP(8),B6        ; |101| 

           NOP             4

           MPYSP   .M1     A5,A4,A3          ; |101| 
||         MPYSP   .M2     B6,B4,B4
||         SUBSP   .L2X    B6,A3,B5          ; |101| 

           NOP             3

           MPYSP   .M2     B5,B9,B4          ; |101| 
||         ADDSP   .L1X    A3,B4,A3          ; |101| 

           NOP             3
           ADDSP   .L2X    B4,A3,B4          ; |101| 
           MV      .S1X    B6,A3             ; |101| 
           NOP             2
           STW     .D2T2   B4,*+SP(12)       ; |101| 
           STW     .D1T1   A3,*A8            ; |102| 

           LDW     .D1T1   *A6,A3            ; |105| 
||         LDW     .D2T2   *+SP(20),B4       ; |105| 

           NOP             4
           ADDSP   .L2X    B4,A3,B4          ; |105| 
           NOP             3
           STW     .D1T2   B4,*A6            ; |105| 
           LDW     .D2T2   *+SP(20),B6       ; |106| 

           LDW     .D2T2   *B8,B5            ; |106| 
||         LDW     .D1T1   *A0,A0            ; |106| 

           NOP             4

           MPYSP   .M2     B6,B1,B5          ; |106| 
||         MPYSP   .M1     A0,A2,A0          ; |106| 
||         SUBSP   .L2     B6,B5,B4

           NOP             3

           MPYSP   .M2     B4,B2,B4          ; |106| 
||         ADDSP   .L1X    A0,B5,A0          ; |106| 

           NOP             3
           ADDSP   .L2X    B4,A0,B4          ; |106| 
           MV      .S1X    B6,A0             ; |106| 
           NOP             2
           STW     .D2T2   B4,*+SP(24)       ; |106| 
           STW     .D1T1   A0,*A14           ; |107| 
           LDW     .D2T2   *+SP(12),B4       ; |110| 
           LDW     .D2T2   *+SP(24),B5       ; |110| 
           NOP             3
           B       .S2     B0                ; |111| 
           ADDSP   .L2     B5,B4,B4          ; |110| 
           NOP             3

           MV      .S1X    B4,A4             ; |111| 
||         STW     .D2T2   B4,*+SP(28)       ; |110| 

RL8:       ; CALL OCCURS                     ; |111| 
           STW     .D2T1   A4,*+SP(32)       ; |111| 
           MVKL    .S2     _UMAddData,B5     ; |117| 

           LDW     .D2T2   *+SP(20),B4       ; |117| 
||         MVKH    .S2     _UMAddData,B5     ; |117| 
||         MVKL    .S1     _R,A0             ; |117| 

;** --------------------------------------------------------------------------*
L10:    

           B       .S2     B5                ; |117| 
||         MVKH    .S1     _R,A0             ; |117| 
||         LDW     .D2T1   *+SP(8),A6        ; |117| 

           LDW     .D1T1   *A0,A4            ; |117| 
||         LDW     .D2T2   *+SP(32),B6       ; |117| 

           MVKL    .S2     RL10,B3           ; |117| 
           MVKH    .S2     RL10,B3           ; |117| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |117| 
           MVKL    .S2     _TINTCnt,B4       ; |120| 
           MVKH    .S2     _TINTCnt,B4       ; |120| 
           LDW     .D2T2   *B4,B5            ; |120| 
           MVKL    .S1     _INTRR_cnt,A3     ; |121| 
           MVKH    .S1     _INTRR_cnt,A3     ; |121| 
           NOP             2
           ADD     .D2     1,B5,B5           ; |120| 
           STW     .D2T2   B5,*B4            ; |120| 
           LDW     .D1T1   *A3,A0            ; |121| 
           MVK     .S2     1,B4              ; |122| 
           NOP             3

           MVKL    .S1     _TFlag,A0         ; |122| 
||         ADD     .D1     1,A0,A4           ; |121| 

           MVKH    .S1     _TFlag,A0         ; |122| 
||         STW     .D1T1   A4,*A3            ; |121| 

           STW     .D1T2   B4,*A0            ; |122| 
           LDW     .D2T2   *+SP(152),B13     ; |123| 
           LDW     .D2T2   *+SP(148),B12     ; |123| 
           LDW     .D2T2   *+SP(144),B11     ; |123| 
           LDW     .D2T2   *+SP(140),B10     ; |123| 
           LDW     .D2T2   *+SP(136),B9      ; |123| 
           LDW     .D2T2   *+SP(132),B8      ; |123| 
           LDW     .D2T2   *+SP(128),B7      ; |123| 
           LDW     .D2T2   *+SP(108),B2      ; |123| 
           LDW     .D2T2   *+SP(104),B1      ; |123| 
           LDW     .D2T2   *+SP(100),B0      ; |123| 
           LDW     .D2T1   *+SP(96),A14      ; |123| 
           LDW     .D2T1   *+SP(92),A13      ; |123| 
           LDW     .D2T1   *+SP(88),A12      ; |123| 
           LDW     .D2T1   *+SP(84),A11      ; |123| 
           LDW     .D2T1   *+SP(80),A10      ; |123| 
           LDW     .D2T1   *+SP(76),A9       ; |123| 
           LDW     .D2T1   *+SP(72),A8       ; |123| 
           LDW     .D2T1   *+SP(68),A7       ; |123| 
           LDW     .D2T1   *+SP(60),A5       ; |123| 
           LDW     .D2T1   *+SP(48),A2       ; |123| 
           LDW     .D2T1   *+SP(44),A1       ; |123| 
           LDW     .D2T2   *+SP(112),B3      ; |123| 
           LDW     .D2T2   *+SP(124),B6      ; |123| 
           LDW     .D2T1   *+SP(64),A6       ; |123| 
           LDW     .D2T2   *+SP(120),B5      ; |123| 
           LDW     .D2T1   *+SP(52),A3       ; |123| 
           LDW     .D2T1   *+SP(56),A4       ; |123| 

           LDW     .D2T2   *+SP(116),B4      ; |123| 
||         B       .S2     IRP               ; |123| 

           LDW     .D2T1   *+SP(40),A0       ; |123| 
           ADDK    .S2     152,SP            ; |123| 
           NOP             3
           ; BRANCH OCCURS                   ; |123| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_SendByte
	.global	_PWMOut
	.global	_GetPendulumAngle
	.global	_GetCartPos
	.global	_SwingUpControl
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_TINTCnt
	.global	_INTRR_cnt
	.global	_R
	.global	_cart_R
