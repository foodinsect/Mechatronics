;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Fri Jun 07 17:50:58 2024                                *
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
	.field  	_TFlag+0,32
	.field  	0,32			; _TFlag @ 0
	.sect	".text"
	.global	_TFlag
_TFlag:	.usect	.far,4,4
	.global	_y_pend
_y_pend:	.usect	.far,4,4
	.global	_err_pend
_err_pend:	.usect	.far,4,4
	.global	_u_pend
_u_pend:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prevErr_pend+0,32
	.word	000000000h		; _prevErr_pend @ 0
	.sect	".text"
	.global	_prevErr_pend
_prevErr_pend:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sumErr_pend+0,32
	.word	0c3480000h		; _sumErr_pend @ 0
	.sect	".text"
	.global	_sumErr_pend
_sumErr_pend:	.usect	.far,4,4
	.global	_y_cart
_y_cart:	.usect	.far,4,4
	.global	_err_cart
_err_cart:	.usect	.far,4,4
	.global	_u_cart
_u_cart:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prevErr_cart+0,32
	.word	000000000h		; _prevErr_cart @ 0
	.sect	".text"
	.global	_prevErr_cart
_prevErr_cart:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sumErr_cart+0,32
	.word	000000000h		; _sumErr_cart @ 0
	.sect	".text"
	.global	_sumErr_cart
_sumErr_cart:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\opqrs\AppData\Local\Temp\TI3500_2 --template_info_file C:\Users\opqrs\AppData\Local\Temp\TI3500_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
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
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP                                           *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP                                           *
;*   Local Frame Size  : 0 Args + 16 Auto + 124 Save = 140 byte               *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -144,SP           ; |82| 
           STW     .D2T2   B4,*+SP(108)      ; |82| 
           STW     .D2T2   B3,*+SP(104)      ; |82| 
           STW     .D2T2   B11,*+SP(136)     ; |82| 
           STW     .D2T2   B10,*+SP(132)     ; |82| 
           STW     .D2T2   B9,*+SP(128)      ; |82| 
           STW     .D2T2   B8,*+SP(124)      ; |82| 
           STW     .D2T2   B7,*+SP(120)      ; |82| 
           STW     .D2T2   B6,*+SP(116)      ; |82| 
           STW     .D2T2   B5,*+SP(112)      ; |82| 
           STW     .D2T2   B2,*+SP(100)      ; |82| 
           STW     .D2T2   B1,*+SP(96)       ; |82| 
           STW     .D2T2   B0,*+SP(92)       ; |82| 
           STW     .D2T1   A15,*+SP(88)      ; |82| 
           STW     .D2T1   A14,*+SP(84)      ; |82| 
           STW     .D2T1   A13,*+SP(80)      ; |82| 
           STW     .D2T1   A12,*+SP(76)      ; |82| 
           STW     .D2T1   A11,*+SP(72)      ; |82| 
           STW     .D2T1   A10,*+SP(68)      ; |82| 
           STW     .D2T1   A9,*+SP(64)       ; |82| 
           STW     .D2T1   A8,*+SP(60)       ; |82| 
           STW     .D2T1   A7,*+SP(56)       ; |82| 
           STW     .D2T1   A6,*+SP(52)       ; |82| 

           STW     .D2T1   A5,*+SP(48)       ; |82| 
||         MVKL    .S2     _GetPendulumAngle,B4 ; |86| 

           STW     .D2T1   A4,*+SP(44)       ; |82| 
||         MVKH    .S2     _GetPendulumAngle,B4 ; |86| 

           B       .S2     B4                ; |86| 
||         STW     .D2T2   B12,*+SP(140)     ; |82| 

           STW     .D2T1   A3,*+SP(40)       ; |82| 
           STW     .D2T1   A2,*+SP(36)       ; |82| 
           STW     .D2T1   A1,*+SP(32)       ; |82| 

           STW     .D2T1   A0,*+SP(28)       ; |82| 
||         MVKL    .S2     RL2,B3            ; |86| 

           MVKH    .S2     RL2,B3            ; |86| 
||         STW     .D2T2   B13,*+SP(144)     ; |82| 

RL2:       ; CALL OCCURS                     ; |86| 
           MVKL    .S1     _GetCartPos,A0    ; |87| 
           MVKH    .S1     _GetCartPos,A0    ; |87| 
           B       .S2X    A0                ; |87| 
           MVKL    .S2     _y_pend,B4        ; |86| 
           MVKH    .S2     _y_pend,B4        ; |86| 
           MVKL    .S2     RL4,B3            ; |87| 
           STW     .D2T1   A4,*B4            ; |86| 
           MVKH    .S2     RL4,B3            ; |87| 
RL4:       ; CALL OCCURS                     ; |87| 
           MVKL    .S2     _y_cart,B4        ; |87| 
           MVKL    .S2     _R_pend,B5        ; |90| 

           MV      .L2X    A4,B6             ; |87| 
||         MVKH    .S2     _y_cart,B4        ; |87| 
||         MVKL    .S1     _y_pend,A0        ; |90| 

           STW     .D2T2   B6,*B4            ; |87| 
||         MVKH    .S1     _y_pend,A0        ; |90| 
||         MVKH    .S2     _R_pend,B5        ; |90| 

           LDW     .D1T1   *A0,A0            ; |90| 
||         LDW     .D2T2   *B5,B4            ; |90| 

           ZERO    .D1     A5                ; |95| 
           MVKH    .S1     0x41200000,A5     ; |95| 
           NOP             2
           SUBSP   .L2X    B4,A0,B5          ; |90| 
           MVKL    .S1     _y_cart,A3        ; |91| 
           MVKL    .S1     _err_pend,A0      ; |90| 

           MVKL    .S2     _R_cart,B4        ; |91| 
||         MVKH    .S1     _err_pend,A0      ; |90| 

           MVKH    .S1     _y_cart,A3        ; |91| 
||         MVKH    .S2     _R_cart,B4        ; |91| 
||         STW     .D1T2   B5,*A0            ; |90| 

           LDW     .D1T1   *A3,A0            ; |91| 
||         LDW     .D2T2   *B4,B4            ; |91| 

           NOP             4
           SUBSP   .L1X    B4,A0,A3          ; |91| 
           MVKL    .S2     _err_cart,B4      ; |91| 
           MVKL    .S1     _mode,A0          ; |94| 
           MVKH    .S2     _err_cart,B4      ; |91| 

           STW     .D2T1   A3,*B4            ; |91| 
||         MVKH    .S1     _mode,A0          ; |94| 

           LDW     .D1T1   *A0,A0            ; |94| 
           NOP             4
           CMPEQ   .L1     A0,1,A1           ; |94| 
   [!A1]   B       .S1     L10               ; |94| 
           MVKL    .S1     _err_pend,A6      ; |95| 
           MVKH    .S1     _err_pend,A6      ; |95| 
   [ A1]   MVKL    .S2     0xbd4ccccd,B4     ; |103| 

   [ A1]   MVKL    .S2     _prevErr_cart,B4  ; |103| 
|| [!A1]   MVKL    .S1     _mode,A0          ; |113| 
|| [ A1]   STW     .D2T2   B4,*+SP(12)       ; |103| 

   [ A1]   MVKL    .S2     _sumErr_cart,B4   ; |103| 
|| [!A1]   MVKH    .S1     _mode,A0          ; |113| 
|| [ A1]   STW     .D2T2   B4,*+SP(16)       ; |103| 

           ; BRANCH OCCURS                   ; |94| 
;** --------------------------------------------------------------------------*

           MVKL    .S2     0xb951b717,B4     ; |103| 
||         MV      .S1X    B4,A0             ; |103| 

           LDW     .D2T2   *+SP(12),B4       ; |103| 
||         MV      .S2     B4,B6

           MVKL    .S1     _err_pend,A14     ; |95| 
           MVKL    .S2     _err_pend,B8      ; |98| 
           MVKL    .S1     _prevErr_pend,A7  ; |99| 
           MVKL    .S2     _prevErr_pend,B5  ; |98| 
           MVKH    .S2     0xbd4ccccd,B4     ; |103| 
           STW     .D2T2   B4,*+SP(12)       ; |103| 
           LDW     .D2T2   *+SP(16),B4       ; |98| 
           MVKL    .S1     0xbe4ccccd,A11    ; |103| 

           MVKL    .S2     _u_pend,B11       ; |98| 
||         MVKL    .S1     _sumErr_pend,A4   ; |97| 

           MVKL    .S2     RL6,B3            ; |108| 
||         MVKL    .S1     _err_cart,A2      ; |103| 

           MVKL    .S1     _err_pend,A8      ; |99| 
||         MVKL    .S2     _err_cart,B1      ; |102| 

           MVKH    .S2     _prevErr_cart,B4  ; |103| 
||         MVKL    .S1     _err_cart,A1      ; |103| 

           STW     .D2T2   B4,*+SP(16)       ; |97| 
||         MVKL    .S1     _err_pend,A10     ; |98| 
||         MVKL    .S2     _PWMOut,B7        ; |108| 

           LDW     .D1T1   *A6,A15           ; |95| 
||         MVKL    .S1     _u_cart,A9        ; |103| 
||         MVKL    .S2     _prevErr_cart,B2  ; |104| 

           MVKL    .S2     _u_cart,B10       ; |107| 
||         MVKL    .S1     _err_cart,A12     ; |104| 

           MVKL    .S2     _err_pend,B13     ; |97| 
||         MVKL    .S1     _u_pend,A13       ; |107| 
||         ZERO    .D2     B12               ; |95| 

           MVKH    .S2     0xc1200000,B12    ; |95| 
||         MVKH    .S1     _err_pend,A14     ; |95| 
||         ZERO    .D2     B9                ; |98| 

           MVKH    .S1     _prevErr_pend,A7  ; |99| 
||         MVKH    .S2     0x41a00000,B9     ; |98| 

           CMPGTSP .S1     A15,A5,A5         ; |95| 
||         MVKH    .S2     _err_pend,B8      ; |98| 

           XOR     .L2X    1,A5,B0           ; |95| 
||         MVKH    .S2     _prevErr_pend,B5  ; |98| 
||         MVKH    .S1     0xbe4ccccd,A11    ; |103| 

   [ B0]   LDW     .D1T1   *A14,A5           ; |95| 
||         MVKH    .S2     _u_pend,B11       ; |98| 
||         MVKH    .S1     _sumErr_pend,A4   ; |97| 

           MVKH    .S2     RL6,B3            ; |108| 
||         MVKH    .S1     _err_cart,A2      ; |103| 

           MVKH    .S1     _err_pend,A8      ; |99| 
||         MVKH    .S2     _err_cart,B1      ; |102| 

           MVKH    .S2     _PWMOut,B7        ; |108| 
||         MVKH    .S1     _err_cart,A1      ; |103| 

           MVKH    .S1     _err_pend,A10     ; |98| 
||         MVKH    .S2     _prevErr_cart,B2  ; |104| 

   [ B0]   CMPLTSP .S2X    A5,B12,B12        ; |95| 
||         MVKH    .S1     _u_cart,A9        ; |103| 

   [ B0]   XOR     .L2     1,B12,B0          ; |95| 
||         MVKH    .S2     _u_cart,B10       ; |107| 
||         MVKH    .S1     _err_cart,A12     ; |104| 

   [!B0]   B       .S1     L9                ; |95| 
||         MV      .L2X    A0,B4             ; |98| 
||         MVKH    .S2     0xb951b717,B6     ; |103| 

           MVKH    .S2     _sumErr_cart,B4   ; |103| 
||         MVKH    .S1     _u_pend,A13       ; |107| 

           MVKL    .S2     _sumErr_cart,B4   ; |102| 
||         MV      .L1X    B4,A0             ; |103| 
||         MVKL    .S1     _sumErr_pend,A6   ; |98| 

           MVKH    .S1     _sumErr_pend,A6   ; |98| 
||         MVKH    .S2     _sumErr_cart,B4   ; |102| 
||         ZERO    .D2     B6                ; |98| 
||         MV      .L1X    B6,A3             ; |99| 

           MV      .D2     B13,B4            ; |102| 
||         MV      .L1X    B4,A5             ; |102| 
||         MVKL    .S1     0x3e0f5c29,A15    ; |98| 
||         MVKH    .S2     0x41200000,B6     ; |98| 

           MVKH    .S2     _err_pend,B4      ; |97| 
||         MVKH    .S1     0x3e0f5c29,A15    ; |98| 

           ; BRANCH OCCURS                   ; |95| 
;** --------------------------------------------------------------------------*

           LDW     .D2T2   *B4,B4            ; |97| 
||         LDW     .D1T1   *A4,A14           ; |97| 

           NOP             4
           ADDSP   .L1X    B4,A14,A14        ; |97| 
           NOP             3
           STW     .D1T1   A14,*A4           ; |97| 

           LDW     .D1T1   *A6,A6            ; |98| 
||         LDW     .D2T2   *B5,B5            ; |98| 

           LDW     .D1T1   *A10,A4           ; |98| 
||         LDW     .D2T2   *B8,B4            ; |98| 

           NOP             4

           MPYSP   .M1     A6,A15,A4         ; |98| 
||         MPYSP   .M2     B4,B9,B4          ; |98| 
||         SUBSP   .L2X    A4,B5,B5          ; |98| 

           NOP             3

           ADDSP   .L2X    A4,B4,B4          ; |98| 
||         MPYSP   .M2     B5,B6,B5          ; |98| 

           NOP             3
           ADDSP   .L2     B5,B4,B4          ; |98| 
           NOP             3
           STW     .D2T2   B4,*B11           ; |98| 
           LDW     .D1T1   *A8,A4            ; |99| 
           NOP             4
           STW     .D1T1   A4,*A7            ; |99| 

           LDW     .D2T2   *B1,B4            ; |102| 
||         LDW     .D1T1   *A5,A4            ; |102| 

           NOP             4
           ADDSP   .L1X    B4,A4,A4          ; |102| 
           MV      .S2X    A0,B4             ; |102| 
           NOP             2
           STW     .D1T1   A4,*A5            ; |102| 
           LDW     .D2T2   *+SP(16),B5       ; |103| 
           LDW     .D1T1   *A1,A0            ; |103| 
           LDW     .D2T2   *B4,B4            ; |103| 
           LDW     .D1T1   *A2,A4            ; |103| 
           LDW     .D2T2   *+SP(12),B6
           LDW     .D2T2   *B5,B5            ; |103| 
           NOP             4
           SUBSP   .L2X    A0,B5,B5          ; |103| 

           MPYSP   .M1     A4,A11,A0         ; |103| 
||         MPYSP   .M2X    B4,A3,B4

           NOP             3

           MPYSP   .M2     B5,B6,B4          ; |103| 
||         ADDSP   .L1X    B4,A0,A0          ; |103| 

           NOP             3
           ADDSP   .L1X    B4,A0,A0          ; |103| 
           NOP             3
           STW     .D1T1   A0,*A9            ; |103| 
           LDW     .D1T2   *A12,B4           ; |104| 
           NOP             4
           STW     .D2T2   B4,*B2            ; |104| 

           LDW     .D1T1   *A13,A0           ; |107| 
||         LDW     .D2T2   *B10,B4           ; |107| 

           NOP             3
           B       .S2     B7                ; |108| 
           ADDSP   .L2X    B4,A0,B4          ; |107| 
           NOP             3

           STW     .D2T2   B4,*+SP(4)        ; |107| 
||         MV      .S1X    B4,A4             ; |107| 

RL6:       ; CALL OCCURS                     ; |108| 
           STW     .D2T1   A4,*+SP(8)        ; |108| 
;** --------------------------------------------------------------------------*
L9:    
           MVKL    .S1     _mode,A0          ; |113| 
           MVKH    .S1     _mode,A0          ; |113| 
;** --------------------------------------------------------------------------*
L10:    
           LDW     .D1T1   *A0,A1            ; |113| 
           NOP             4
   [ A1]   B       .S1     L11               ; |113| 
           MVKL    .S2     RL8,B3            ; |114| 
           MVKL    .S2     _SwingUpControl,B4 ; |114| 
           MVKH    .S2     RL8,B3            ; |114| 
           MVKH    .S2     _SwingUpControl,B4 ; |114| 
   [ A1]   MVKL    .S2     _err_pend,B4      ; |118| 
           ; BRANCH OCCURS                   ; |113| 
;** --------------------------------------------------------------------------*
           B       .S2     B4                ; |114| 
           NOP             5
RL8:       ; CALL OCCURS                     ; |114| 
           MVKL    .S2     _err_pend,B4      ; |118| 
;** --------------------------------------------------------------------------*
L11:    
           MVKL    .S2     _UMAddData,B5     ; |118| 
           MVKL    .S2     _R_pend,B7        ; |118| 
           MVKH    .S2     _err_pend,B4      ; |118| 
           MVKH    .S2     _UMAddData,B5     ; |118| 

           LDW     .D2T2   *+SP(8),B6        ; |118| 
||         MVKH    .S2     _R_pend,B7        ; |118| 
||         MVKL    .S1     _err_cart,A0      ; |118| 

           B       .S2     B5                ; |118| 
||         LDW     .D2T1   *B4,A6            ; |118| 
||         MVKH    .S1     _err_cart,A0      ; |118| 

           LDW     .D1T2   *A0,B4            ; |118| 
||         LDW     .D2T1   *B7,A4            ; |118| 

           MVKL    .S2     RL10,B3           ; |118| 
           MVKH    .S2     RL10,B3           ; |118| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |118| 
           MVKL    .S1     _TINTCnt,A0       ; |121| 
           MVKH    .S1     _TINTCnt,A0       ; |121| 
           LDW     .D1T1   *A0,A3            ; |121| 
           MVK     .S2     1,B4              ; |122| 
           NOP             3

           MVKL    .S1     _TFlag,A3         ; |122| 
||         ADD     .D1     1,A3,A4           ; |121| 

           STW     .D1T1   A4,*A0            ; |121| 
||         MVKH    .S1     _TFlag,A3         ; |122| 

           STW     .D1T2   B4,*A3            ; |122| 
           LDW     .D2T2   *+SP(144),B13     ; |123| 
           LDW     .D2T2   *+SP(140),B12     ; |123| 
           LDW     .D2T2   *+SP(136),B11     ; |123| 
           LDW     .D2T2   *+SP(132),B10     ; |123| 
           LDW     .D2T2   *+SP(128),B9      ; |123| 
           LDW     .D2T2   *+SP(124),B8      ; |123| 
           LDW     .D2T2   *+SP(100),B2      ; |123| 
           LDW     .D2T2   *+SP(96),B1       ; |123| 
           LDW     .D2T2   *+SP(92),B0       ; |123| 
           LDW     .D2T1   *+SP(88),A15      ; |123| 
           LDW     .D2T1   *+SP(84),A14      ; |123| 
           LDW     .D2T1   *+SP(80),A13      ; |123| 
           LDW     .D2T1   *+SP(76),A12      ; |123| 
           LDW     .D2T1   *+SP(72),A11      ; |123| 
           LDW     .D2T1   *+SP(68),A10      ; |123| 
           LDW     .D2T1   *+SP(64),A9       ; |123| 
           LDW     .D2T1   *+SP(60),A8       ; |123| 
           LDW     .D2T1   *+SP(56),A7       ; |123| 
           LDW     .D2T1   *+SP(48),A5       ; |123| 
           LDW     .D2T1   *+SP(36),A2       ; |123| 
           LDW     .D2T1   *+SP(32),A1       ; |123| 
           LDW     .D2T2   *+SP(120),B7      ; |123| 
           LDW     .D2T2   *+SP(112),B5      ; |123| 
           LDW     .D2T2   *+SP(104),B3      ; |123| 
           LDW     .D2T2   *+SP(116),B6      ; |123| 
           LDW     .D2T1   *+SP(52),A6       ; |123| 
           LDW     .D2T1   *+SP(28),A0       ; |123| 
           LDW     .D2T1   *+SP(44),A4       ; |123| 

           B       .S2     IRP               ; |123| 
||         LDW     .D2T2   *+SP(108),B4      ; |123| 

           LDW     .D2T1   *+SP(40),A3       ; |123| 
           ADDK    .S2     144,SP            ; |123| 
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
	.global	_R_pend
	.global	_R_cart
	.global	_mode
