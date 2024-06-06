;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Thu Jun 06 14:20:38 2024                                *
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

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_pend_prevErr+0,32
	.word	000000000h		; _pend_prevErr @ 0
	.sect	".text"
	.global	_pend_prevErr
_pend_prevErr:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_pend_sumErr+0,32
	.word	000000000h		; _pend_sumErr @ 0
	.sect	".text"
	.global	_pend_sumErr
_pend_sumErr:	.usect	.far,4,4

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
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\opqrs\AppData\Local\Temp\TI20716_2 --template_info_file C:\Users\opqrs\AppData\Local\Temp\TI20716_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
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
           B       .S2     IRP               ; |20| 
           NOP             5
           ; BRANCH OCCURS                   ; |20| 


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
           STW     .D2T2   B9,*SP--(88)      ; |23| 
           STW     .D2T1   A0,*+SP(12)       ; |23| 
           STW     .D2T2   B7,*+SP(80)       ; |23| 
           STW     .D2T2   B6,*+SP(76)       ; |23| 
           STW     .D2T2   B5,*+SP(72)       ; |23| 
           STW     .D2T2   B4,*+SP(68)       ; |23| 
           STW     .D2T2   B3,*+SP(64)       ; |23| 
           STW     .D2T2   B2,*+SP(60)       ; |23| 
           STW     .D2T2   B1,*+SP(56)       ; |23| 
           STW     .D2T2   B0,*+SP(52)       ; |23| 
           STW     .D2T1   A9,*+SP(48)       ; |23| 
           STW     .D2T1   A8,*+SP(44)       ; |23| 
           STW     .D2T1   A7,*+SP(40)       ; |23| 
           STW     .D2T1   A6,*+SP(36)       ; |23| 
           STW     .D2T1   A5,*+SP(32)       ; |23| 
           STW     .D2T1   A4,*+SP(28)       ; |23| 
           STW     .D2T1   A3,*+SP(24)       ; |23| 
           STW     .D2T1   A2,*+SP(20)       ; |23| 

           STW     .D2T1   A1,*+SP(16)       ; |23| 
||         MVKL    .S1     0x2000008,A0      ; |26| 

           MVKH    .S1     0x2000008,A0      ; |26| 
||         STW     .D2T2   B8,*+SP(84)       ; |23| 

           LDW     .D1T1   *A0,A0            ; |26| 
           NOP             4
           AND     .S1     15,A0,A0          ; |26| 
           CMPEQ   .L1     A0,1,A1           ; |26| 
   [ A1]   B       .S1     L8                ; |26| 
           STW     .D2T1   A0,*+SP(4)        ; |26| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |60| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |60| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |60| 
   [ A1]   LDW     .D2T2   *+SP(68),B4       ; |60| 
           ; BRANCH OCCURS                   ; |26| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(4),B4        ; |27| 
           NOP             3
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L1
;** --------------------------------------------------------------------------*
L1:    
           NOP             1
           CMPEQ   .L2     B4,4,B0           ; |27| 
   [!B0]   B       .S1     L3                ; |27| 

   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |39| 
|| [ B0]   MVKL    .S1     0x2000014,A0      ; |28| 

   [ B0]   MVKH    .S1     0x2000014,A0      ; |28| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |28| 
           NOP             2
           ; BRANCH OCCURS                   ; |27| 
;** --------------------------------------------------------------------------*
           NOP             2
           AND     .S1     1,A0,A1           ; |28| 
   [!A1]   B       .S1     L7                ; |28| 
   [!A1]   MVKL    .S1     0x2000008,A0      ; |59| 
   [!A1]   MVKH    .S1     0x2000008,A0      ; |59| 

   [ A1]   ZERO    .D2     B4                ; |29| 
|| [ A1]   MVKL    .S2     _compacket+124,B5 ; |29| 
|| [!A1]   LDW     .D1T1   *A0,A0            ; |59| 

   [ A1]   MVKH    .S2     0x2000000,B4      ; |29| 

   [ A1]   MVKH    .S2     _compacket+124,B5 ; |29| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |29| 

           ; BRANCH OCCURS                   ; |28| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *B5,B5            ; |29| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L2:    
           MVKL    .S1     _compacket+124,A0 ; |30| 
           MVKH    .S1     _compacket+124,A0 ; |30| 
           EXTU    .S2     B4,24,24,B4       ; |29| 
           STB     .D2T2   B4,*B5            ; |29| 
           LDW     .D1T1   *A0,A3            ; |30| 
           MVKL    .S1     _SendByte,A0      ; |30| 
           MVKH    .S1     _SendByte,A0      ; |30| 
           MVKL    .S2     RL0,B3            ; |30| 
           B       .S2X    A0                ; |30| 
           LDB     .D1T1   *A3,A4            ; |30| 
           MVKH    .S2     RL0,B3            ; |30| 
           NOP             3
RL0:       ; CALL OCCURS                     ; |30| 
           MVKL    .S2     _compacket+124,B4 ; |31| 
           MVKH    .S2     _compacket+124,B4 ; |31| 
           LDW     .D2T2   *B4,B4            ; |31| 
           MVKL    .S1     _compacket+99,A0  ; |31| 
           MVKH    .S1     _compacket+99,A0  ; |31| 
           NOP             2
           CMPEQ   .L1X    B4,A0,A1          ; |31| 
   [!A1]   MVKL    .S2     _compacket+124,B4 ; |35| 
   [!A1]   MVKH    .S2     _compacket+124,B4 ; |35| 
   [!A1]   LDW     .D2T2   *B4,B5            ; |35| 
   [ A1]   MVKL    .S2     _compacket+124,B4 ; |32| 
   [ A1]   MVKL    .S1     _compacket,A0     ; |32| 
   [ A1]   MVKH    .S2     _compacket+124,B4 ; |32| 
   [ A1]   MVKH    .S1     _compacket,A0     ; |32| 

           MVKL    .S2     0x2000014,B5      ; |37| 
|| [!A1]   ADD     .D2     1,B5,B6           ; |35| 

   [!A1]   STW     .D2T2   B6,*B4            ; |35| 

   [ A1]   STW     .D2T1   A0,*B4            ; |32| 
||         MVKH    .S2     0x2000014,B5      ; |37| 

           LDW     .D2T2   *B5,B4            ; |37| 
           NOP             4
           AND     .S2     1,B4,B0           ; |37| 
   [ B0]   B       .S1     L2                ; |37| 

   [ B0]   ZERO    .D2     B4                ; |29| 
|| [ B0]   MVKL    .S2     _compacket+124,B5 ; |29| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |29| 

   [ B0]   MVKH    .S2     _compacket+124,B5 ; |29| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |29| 

   [ B0]   LDW     .D2T2   *B5,B5            ; |29| 
           NOP             1
           ; BRANCH OCCURS                   ; |37| 
;** --------------------------------------------------------------------------*
           B       .S1     L7                ; |38| 
           MVKL    .S1     0x2000008,A0      ; |59| 
           MVKH    .S1     0x2000008,A0      ; |59| 
           LDW     .D1T1   *A0,A0            ; |59| 
           NOP             2
           ; BRANCH OCCURS                   ; |38| 
;** --------------------------------------------------------------------------*
L3:    
           CMPEQ   .L2     B4,2,B0           ; |39| 
   [!B0]   B       .S1     L4                ; |39| 
   [ B0]   MVKL    .S2     _respacket+200,B4 ; |40| 
           NOP             3
   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |48| 
           ; BRANCH OCCURS                   ; |39| 
;** --------------------------------------------------------------------------*
           MVKH    .S2     _respacket+200,B4 ; |40| 
           LDW     .D2T2   *B4,B5            ; |40| 
           NOP             4
           CMPGT   .L2     B5,0,B0           ; |40| 

   [ B0]   MVKL    .S1     _respacket+204,A0 ; |41| 
||         SUB     .D2     B5,1,B5           ; |40| 

   [ B0]   MVKH    .S1     _respacket+204,A0 ; |41| 
||         STW     .D2T2   B5,*B4            ; |40| 

   [ B0]   LDW     .D1T1   *A0,A3            ; |41| 
   [ B0]   MVKL    .S1     _respacket,A4     ; |41| 
   [ B0]   MVKH    .S1     _respacket,A4     ; |41| 
   [!B0]   MVKL    .S1     0x2000004,A0      ; |44| 
   [!B0]   MVKL    .S2     _respacket+208,B4 ; |45| 
   [ B0]   ADD     .D1     1,A3,A5           ; |41| 
   [ B0]   STW     .D1T1   A5,*A0            ; |41| 

           B       .S1     L6                ; |47| 
|| [ B0]   LDB     .D1T1   *+A3[A4],A0       ; |41| 

   [!B0]   MVKH    .S1     0x2000004,A0      ; |44| 
   [!B0]   MVK     .S2     1,B5              ; |44| 

   [!B0]   ZERO    .D2     B5                ; |45| 
|| [ B0]   ZERO    .L2     B4                ; |41| 
|| [!B0]   MVKH    .S2     _respacket+208,B4 ; |45| 
|| [!B0]   STW     .D1T2   B5,*A0            ; |44| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |41| 
|| [!B0]   STW     .D2T2   B5,*B4            ; |45| 

   [ B0]   STW     .D2T1   A0,*B4            ; |41| 
           ; BRANCH OCCURS                   ; |47| 
;** --------------------------------------------------------------------------*
L4:    
           NOP             4
           CMPEQ   .L2     B4,12,B0          ; |48| 
   [!B0]   B       .S1     L6                ; |48| 
           NOP             2
   [ B0]   MVKL    .S1     0x2000014,A0      ; |49| 
   [ B0]   MVKH    .S1     0x2000014,A0      ; |49| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |49| 
           ; BRANCH OCCURS                   ; |48| 
;** --------------------------------------------------------------------------*
           NOP             4
           AND     .S1     1,A0,A1           ; |49| 
   [!A1]   B       .S1     L6                ; |49| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |50| 
           ; BRANCH OCCURS                   ; |49| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    

           MVKH    .S2     0x2000000,B4      ; |50| 
||         MVKL    .S1     _compacket+124,A0 ; |50| 

           LDW     .D2T2   *B4,B4            ; |50| 
||         MVKH    .S1     _compacket+124,A0 ; |50| 

           LDW     .D1T1   *A0,A3            ; |50| 
           MVKL    .S1     _compacket+124,A0 ; |51| 
           MVKH    .S1     _compacket+124,A0 ; |51| 
           NOP             1
           EXTU    .S2     B4,24,24,B4       ; |50| 
           STB     .D1T2   B4,*A3            ; |50| 
           LDW     .D1T1   *A0,A0            ; |51| 
           MVKL    .S2     _compacket+99,B4  ; |51| 
           MVKH    .S2     _compacket+99,B4  ; |51| 
           NOP             2
           CMPEQ   .L2X    A0,B4,B0          ; |51| 
   [!B0]   MVKL    .S1     _compacket+124,A0 ; |55| 
   [!B0]   MVKH    .S1     _compacket+124,A0 ; |55| 
   [!B0]   MV      .D1     A0,A4             ; |55| 
   [!B0]   LDW     .D1T1   *A4,A0            ; |55| 
   [ B0]   MVKL    .S1     _compacket+124,A0 ; |52| 
   [ B0]   MVKL    .S2     _compacket,B4     ; |52| 
   [ B0]   MVKH    .S1     _compacket+124,A0 ; |52| 
   [ B0]   MVKH    .S2     _compacket,B4     ; |52| 

           MVKL    .S1     0x2000014,A0      ; |57| 
|| [!B0]   ADD     .L1     1,A0,A3           ; |55| 
|| [ B0]   STW     .D1T2   B4,*A0            ; |52| 

           MVKH    .S1     0x2000014,A0      ; |57| 
|| [!B0]   STW     .D1T1   A3,*A4            ; |55| 

           LDW     .D1T1   *A0,A0            ; |57| 
           NOP             4
           AND     .S1     1,A0,A1           ; |57| 
   [ A1]   B       .S1     L5                ; |57| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |50| 
           ; BRANCH OCCURS                   ; |57| 
;** --------------------------------------------------------------------------*
L6:    
           MVKL    .S1     0x2000008,A0      ; |59| 
           MVKH    .S1     0x2000008,A0      ; |59| 
           LDW     .D1T1   *A0,A0            ; |59| 
           NOP             2
;** --------------------------------------------------------------------------*
L7:    
           NOP             2
           AND     .S1     15,A0,A0          ; |59| 
           CMPEQ   .L1     A0,1,A1           ; |59| 
   [!A1]   B       .S1     L1                ; |59| 
           STW     .D2T1   A0,*+SP(4)        ; |59| 
   [!A1]   LDW     .D2T2   *+SP(4),B4        ; |27| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |60| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |60| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |60| 
           ; BRANCH OCCURS                   ; |59| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(68),B4       ; |60| 
;** --------------------------------------------------------------------------*
L8:    
           LDW     .D2T2   *+SP(64),B3       ; |60| 
           LDW     .D2T2   *+SP(60),B2       ; |60| 
           LDW     .D2T2   *+SP(56),B1       ; |60| 
           LDW     .D2T2   *+SP(52),B0       ; |60| 
           LDW     .D2T1   *+SP(48),A9       ; |60| 
           LDW     .D2T1   *+SP(44),A8       ; |60| 
           LDW     .D2T1   *+SP(40),A7       ; |60| 
           LDW     .D2T1   *+SP(36),A6       ; |60| 
           LDW     .D2T1   *+SP(32),A5       ; |60| 
           LDW     .D2T1   *+SP(28),A4       ; |60| 
           LDW     .D2T1   *+SP(24),A3       ; |60| 
           LDW     .D2T1   *+SP(20),A2       ; |60| 
           LDW     .D2T1   *+SP(16),A1       ; |60| 
           LDW     .D2T1   *+SP(12),A0       ; |60| 

           B       .S2     IRP               ; |60| 
||         LDW     .D2T2   *+SP(84),B8       ; |60| 

           LDW     .D2T2   *++SP(88),B9      ; |60| 
           NOP             4
           ; BRANCH OCCURS                   ; |60| 


	.sect	".text"
	.global	_ISRtimer0

;******************************************************************************
;* FUNCTION NAME: _ISRtimer0                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,B0,B1,B2,B3,B4,B5, *
;*                           B6,B7,B8,B9,B10,B11,B12,SP                       *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,B0,B1,B2,B3,B4,B5, *
;*                           B6,B7,B8,B9,B10,B11,B12,SP                       *
;*   Local Frame Size  : 0 Args + 28 Auto + 100 Save = 128 byte               *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -128,SP           ; |80| 
           STW     .D2T2   B4,*+SP(96)       ; |80| 
           STW     .D2T2   B3,*+SP(92)       ; |80| 
           STW     .D2T2   B10,*+SP(120)     ; |80| 
           STW     .D2T2   B9,*+SP(116)      ; |80| 
           STW     .D2T2   B8,*+SP(112)      ; |80| 
           STW     .D2T2   B7,*+SP(108)      ; |80| 
           STW     .D2T2   B6,*+SP(104)      ; |80| 
           STW     .D2T2   B5,*+SP(100)      ; |80| 
           STW     .D2T2   B2,*+SP(88)       ; |80| 
           STW     .D2T2   B1,*+SP(84)       ; |80| 
           STW     .D2T2   B0,*+SP(80)       ; |80| 
           STW     .D2T1   A10,*+SP(76)      ; |80| 
           STW     .D2T1   A9,*+SP(72)       ; |80| 
           STW     .D2T1   A8,*+SP(68)       ; |80| 
           STW     .D2T1   A7,*+SP(64)       ; |80| 
           STW     .D2T1   A6,*+SP(60)       ; |80| 

           STW     .D2T1   A5,*+SP(56)       ; |80| 
||         MVKL    .S2     _GetPendulumAngle,B4 ; |86| 

           STW     .D2T1   A4,*+SP(52)       ; |80| 
||         MVKH    .S2     _GetPendulumAngle,B4 ; |86| 

           B       .S2     B4                ; |86| 
||         STW     .D2T2   B11,*+SP(124)     ; |80| 

           STW     .D2T1   A3,*+SP(48)       ; |80| 
           STW     .D2T1   A2,*+SP(44)       ; |80| 
           STW     .D2T1   A1,*+SP(40)       ; |80| 

           STW     .D2T1   A0,*+SP(36)       ; |80| 
||         MVKL    .S2     RL2,B3            ; |86| 

           MVKH    .S2     RL2,B3            ; |86| 
||         STW     .D2T2   B12,*+SP(128)     ; |80| 

RL2:       ; CALL OCCURS                     ; |86| 
           MVKL    .S2     _GetCartPos,B4    ; |87| 
           MVKH    .S2     _GetCartPos,B4    ; |87| 
           B       .S2     B4                ; |87| 
           STW     .D2T1   A4,*+SP(4)        ; |86| 
           NOP             2
           MVKL    .S2     RL4,B3            ; |87| 
           MVKH    .S2     RL4,B3            ; |87| 
RL4:       ; CALL OCCURS                     ; |87| 

           MVKL    .S2     _pend_R,B4        ; |90| 
||         STW     .D2T1   A4,*+SP(16)       ; |87| 

           MVKH    .S2     _pend_R,B4        ; |90| 
||         LDW     .D2T1   *+SP(4),A0        ; |90| 

           LDW     .D2T2   *B4,B4            ; |90| 
           ZERO    .D1     A6                ; |94| 
           MVKL    .S1     _cart_R,A3        ; |91| 
           MVKL    .S2     _PWMOut,B10       ; |110| 
           MVKL    .S1     _cart_prevErr,A10 ; |106| 
           SUBSP   .L2X    B4,A0,B4          ; |90| 
           MVKL    .S2     _cart_sumErr,B2   ; |104| 
           MVKL    .S1     0xb951b717,A2     ; |105| 
           MVKL    .S2     _cart_prevErr,B11 ; |105| 

           SPDP    .S2     B4,B5:B4          ; |94| 
||         STW     .D2T2   B4,*+SP(8)        ; |90| 

           ZERO    .D1     A7                ; |94| 
           ABSDP   .S2     B5:B4,B7:B6       ; |94| 
           MVKH    .S1     0x402e0000,A7     ; |94| 
           MVKL    .S2     _pend_prevErr,B5  ; |101| 

           MVKL    .S2     _SwingUpControl,B4 ; |95| 
||         CMPGTDP .S1X    B7:B6,A7:A6,A1    ; |94| 

           MVKL    .S2     0xbe4ccccd,B1     ; |105| 

           MVKL    .S1     _pend_prevErr,A8  ; |100| 
||         MVKH    .S2     _pend_prevErr,B5  ; |101| 

           MVKL    .S1     0x3e0f5c29,A9     ; |100| 
||         MVKL    .S2     0xbd4ccccd,B12    ; |105| 

           MVKH    .S1     _cart_R,A3        ; |91| 
||         MVKH    .S2     _SwingUpControl,B4 ; |95| 

           LDW     .D1T1   *A3,A5            ; |91| 
||         MVKH    .S2     _cart_sumErr,B2   ; |104| 
||         MVKH    .S1     _cart_prevErr,A10 ; |106| 
||         LDW     .D2T2   *+SP(16),B0       ; |91| 

           ZERO    .D2     B9                ; |100| 
||         MVKH    .S1     0xb951b717,A2     ; |105| 
||         MVKH    .S2     _PWMOut,B10       ; |110| 

           ZERO    .D2     B8                ; |100| 
||         MVKH    .S2     0x41a00000,B9     ; |100| 
||         MVKH    .S1     _pend_prevErr,A8  ; |100| 

           MVKH    .S2     0x41200000,B8     ; |100| 
||         MVKH    .S1     0x3e0f5c29,A9     ; |100| 

           MVKL    .S1     _pend_sumErr,A3   ; |100| 
|| [!A1]   B       .S2     L9                ; |94| 

           SUBSP   .L2X    A5,B0,B6          ; |91| 
||         MVKH    .S2     0xbe4ccccd,B1     ; |105| 
||         MVKL    .S1     _cart_sumErr,A4   ; |105| 

           MVKH    .S2     _cart_prevErr,B11 ; |105| 
||         MVKH    .S1     _pend_sumErr,A3   ; |100| 

           MVKH    .S2     0xbd4ccccd,B12    ; |105| 
||         MVKL    .S1     _pend_sumErr,A0   ; |99| 

           LDW     .D2T1   *+SP(8),A6        ; |99| 
||         MVKL    .S2     RL6,B3            ; |95| 
||         MVKH    .S1     _cart_sumErr,A4   ; |105| 

           STW     .D2T2   B6,*+SP(20)       ; |91| 
||         MVKH    .S2     RL6,B3            ; |95| 
||         MV      .L1X    B2,A5             ; |104| 
||         MVKH    .S1     _pend_sumErr,A0   ; |99| 

           ; BRANCH OCCURS                   ; |94| 
;** --------------------------------------------------------------------------*
           B       .S2     B4                ; |95| 
           NOP             5
RL6:       ; CALL OCCURS                     ; |95| 
           B       .S1     L10               ; |96| 
           MVKL    .S2     _UMAddData,B5     ; |114| 
           LDW     .D2T1   *+SP(12),A6       ; |114| 
           MVKH    .S2     _UMAddData,B5     ; |114| 
           LDW     .D2T2   *+SP(24),B6       ; |114| 
           NOP             1
           ; BRANCH OCCURS                   ; |96| 
;** --------------------------------------------------------------------------*
L9:    
           LDW     .D1T1   *A0,A7            ; |99| 
           MVKL    .S2     RL8,B3            ; |110| 
           MVKH    .S2     RL8,B3            ; |110| 
           NOP             2
           ADDSP   .L1     A6,A7,A6          ; |99| 
           NOP             3
           STW     .D1T1   A6,*A0            ; |99| 
           LDW     .D1T1   *A3,A0            ; |100| 

           LDW     .D1T1   *A8,A3            ; |100| 
||         LDW     .D2T2   *+SP(8),B6        ; |100| 

           NOP             4

           SUBSP   .L2X    B6,A3,B6          ; |100| 
||         MPYSP   .M2     B6,B9,B4
||         MPYSP   .M1     A0,A9,A0          ; |100| 

           NOP             3

           MPYSP   .M2     B6,B8,B4          ; |100| 
||         ADDSP   .L1X    A0,B4,A0          ; |100| 

           NOP             3

           LDW     .D2T1   *+SP(8),A0        ; |101| 
||         ADDSP   .L2X    B4,A0,B4          ; |100| 

           NOP             3
           STW     .D2T2   B4,*+SP(12)       ; |100| 
           STW     .D2T1   A0,*B5            ; |101| 

           LDW     .D1T1   *A5,A0            ; |104| 
||         LDW     .D2T2   *+SP(20),B4       ; |104| 

           NOP             4
           ADDSP   .L2X    B4,A0,B4          ; |104| 
           NOP             3
           STW     .D1T2   B4,*A5            ; |104| 
           LDW     .D2T2   *+SP(20),B6       ; |105| 
           LDW     .D2T2   *B11,B5           ; |105| 
           LDW     .D1T1   *A4,A0            ; |105| 
           NOP             3
           SUBSP   .L2     B6,B5,B4

           MPYSP   .M2     B6,B1,B5          ; |105| 
||         MPYSP   .M1     A0,A2,A0          ; |105| 

           NOP             3

           MPYSP   .M2     B4,B12,B4         ; |105| 
||         ADDSP   .L1X    A0,B5,A0          ; |105| 

           NOP             3
           ADDSP   .L2X    B4,A0,B4          ; |105| 
           MV      .S1X    B6,A0             ; |105| 
           NOP             2
           STW     .D2T2   B4,*+SP(24)       ; |105| 
           STW     .D1T1   A0,*A10           ; |106| 
           LDW     .D2T2   *+SP(12),B4       ; |109| 
           LDW     .D2T2   *+SP(24),B5       ; |109| 
           NOP             3
           B       .S2     B10               ; |110| 
           ADDSP   .L2     B5,B4,B4          ; |109| 
           NOP             3

           MV      .S1X    B4,A4             ; |110| 
||         STW     .D2T2   B4,*+SP(28)       ; |109| 

RL8:       ; CALL OCCURS                     ; |110| 

           LDW     .D2T1   *+SP(12),A6       ; |114| 
||         MVKL    .S2     _UMAddData,B5     ; |114| 

           LDW     .D2T2   *+SP(24),B6       ; |114| 
||         MVKH    .S2     _UMAddData,B5     ; |114| 

;** --------------------------------------------------------------------------*
L10:    

           B       .S2     B5                ; |114| 
||         LDW     .D2T2   *+SP(20),B4       ; |114| 

           LDW     .D2T1   *+SP(8),A4        ; |114| 
           MVKL    .S2     RL10,B3           ; |114| 
           MVKH    .S2     RL10,B3           ; |114| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |114| 
           MVKL    .S1     _TINTCnt,A3       ; |117| 
           MVKH    .S1     _TINTCnt,A3       ; |117| 
           LDW     .D1T1   *A3,A0            ; |117| 
           MVK     .S2     1,B4              ; |118| 
           NOP             3

           MVKL    .S1     _TFlag,A0         ; |118| 
||         ADD     .D1     1,A0,A4           ; |117| 

           STW     .D1T1   A4,*A3            ; |117| 
||         MVKH    .S1     _TFlag,A0         ; |118| 

           STW     .D1T2   B4,*A0            ; |118| 
           LDW     .D2T2   *+SP(128),B12     ; |119| 
           LDW     .D2T2   *+SP(124),B11     ; |119| 
           LDW     .D2T2   *+SP(120),B10     ; |119| 
           LDW     .D2T2   *+SP(116),B9      ; |119| 
           LDW     .D2T2   *+SP(112),B8      ; |119| 
           LDW     .D2T2   *+SP(108),B7      ; |119| 
           LDW     .D2T2   *+SP(88),B2       ; |119| 
           LDW     .D2T2   *+SP(84),B1       ; |119| 
           LDW     .D2T2   *+SP(80),B0       ; |119| 
           LDW     .D2T1   *+SP(76),A10      ; |119| 
           LDW     .D2T1   *+SP(72),A9       ; |119| 
           LDW     .D2T1   *+SP(68),A8       ; |119| 
           LDW     .D2T1   *+SP(64),A7       ; |119| 
           LDW     .D2T1   *+SP(56),A5       ; |119| 
           LDW     .D2T1   *+SP(44),A2       ; |119| 
           LDW     .D2T1   *+SP(40),A1       ; |119| 
           LDW     .D2T2   *+SP(100),B5      ; |119| 
           LDW     .D2T2   *+SP(92),B3       ; |119| 
           LDW     .D2T2   *+SP(104),B6      ; |119| 
           LDW     .D2T1   *+SP(60),A6       ; |119| 
           LDW     .D2T1   *+SP(48),A3       ; |119| 
           LDW     .D2T1   *+SP(52),A4       ; |119| 

           B       .S2     IRP               ; |119| 
||         LDW     .D2T2   *+SP(96),B4       ; |119| 

           LDW     .D2T1   *+SP(36),A0       ; |119| 
           ADDK    .S2     128,SP            ; |119| 
           NOP             3
           ; BRANCH OCCURS                   ; |119| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_SendByte
	.global	_PWMOut
	.global	_GetPendulumAngle
	.global	_GetCartPos
	.global	_UMAddData
	.global	_SwingUpControl
	.global	_compacket
	.global	_respacket
	.global	_TINTCnt
	.global	_pend_R
	.global	_cart_R
