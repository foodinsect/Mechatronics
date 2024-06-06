;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Tue Apr 23 10:33:16 2024                                *
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
	.field  	_cnt1K$1+0,32
	.field  	0,32			; _cnt1K$1 @ 0
	.sect	".text"
_cnt1K$1:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_cnt$2+0,32
	.field  	0,32			; _cnt$2 @ 0
	.sect	".text"
_cnt$2:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_mmag$3+0,32
	.word	03e4ccccdh		; _mmag$3 @ 0
	.sect	".text"
_mmag$3:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\user\AppData\Local\Temp\TI3780_2 --template_info_file C:\Users\user\AppData\Local\Temp\TI3780_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
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
;*   Local Frame Size  : 0 Args + 40 Auto + 124 Save = 164 byte               *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -168,SP           ; |64| 
           STW     .D2T2   B7,*+SP(144)      ; |64| 
           STW     .D2T2   B6,*+SP(140)      ; |64| 
           STW     .D2T1   A3,*+SP(64)       ; |64| 
           STW     .D2T2   B4,*+SP(132)      ; |64| 
           STW     .D2T1   A1,*+SP(56)       ; |64| 
           STW     .D2T1   A2,*+SP(60)       ; |64| 
           STW     .D2T1   A4,*+SP(68)       ; |64| 
           STW     .D2T1   A5,*+SP(72)       ; |64| 
           STW     .D2T1   A6,*+SP(76)       ; |64| 
           STW     .D2T1   A7,*+SP(80)       ; |64| 
           STW     .D2T1   A8,*+SP(84)       ; |64| 
           STW     .D2T1   A9,*+SP(88)       ; |64| 
           STW     .D2T1   A10,*+SP(92)      ; |64| 
           STW     .D2T1   A11,*+SP(96)      ; |64| 
           STW     .D2T1   A12,*+SP(100)     ; |64| 
           STW     .D2T1   A13,*+SP(104)     ; |64| 
           STW     .D2T1   A14,*+SP(108)     ; |64| 
           STW     .D2T1   A15,*+SP(112)     ; |64| 
           STW     .D2T2   B0,*+SP(116)      ; |64| 
           STW     .D2T2   B1,*+SP(120)      ; |64| 
           STW     .D2T2   B2,*+SP(124)      ; |64| 
           STW     .D2T2   B3,*+SP(128)      ; |64| 
           STW     .D2T2   B5,*+SP(136)      ; |64| 
           STW     .D2T2   B8,*+SP(148)      ; |64| 
           STW     .D2T2   B9,*+SP(152)      ; |64| 
           STW     .D2T2   B10,*+SP(156)     ; |64| 
           STW     .D2T2   B11,*+SP(160)     ; |64| 
           STW     .D2T2   B12,*+SP(164)     ; |64| 

           STW     .D2T2   B13,*+SP(168)     ; |64| 
||         MVKL    .S2     _sinf,B7          ; |83| 

           MVK     .S2     1,B6              ; |71| 
||         MVKL    .S1     _TFlag,A3         ; |71| 
||         STW     .D2T1   A0,*+SP(52)       ; |64| 

           MVKL    .S2     0x2000040,B4      ; |73| 
||         STW     .D2T2   B7,*+SP(20)       ; |83| 
||         MVKH    .S1     _TFlag,A3         ; |71| 

           MVKL    .S2     _cnt$2,B6         ; |83| 
||         STW     .D1T2   B6,*A3            ; |71| 

           STW     .D2T2   B6,*+SP(24)       ; |83| 
||         MVKH    .S2     0x2000040,B4      ; |73| 

           LDW     .D2T2   *B4,B6            ; |73| 
           MVKL    .S1     0x3b4de32b,A3     ; |82| 

           STW     .D2T1   A3,*+SP(36)       ; |81| 
||         MVKL    .S2     _cosf,B4          ; |82| 

           STW     .D2T2   B4,*+SP(28)       ; |82| 
||         MVKL    .S1     _mmag$3,A3        ; |81| 
||         MVKL    .S2     0x2000040,B5      ; |73| 

           STW     .D2T1   A3,*+SP(40)       ; |81| 
||         MVKL    .S2     _cnt$2,B4         ; |82| 

           STW     .D2T2   B4,*+SP(32)       ; |82| 
||         NOT     .L2     B6,B6             ; |73| 
||         MVKH    .S2     0x2000040,B5      ; |73| 

           STW     .D2T2   B6,*B5            ; |73| 
           LDW     .D2T2   *+SP(24),B6       ; |81| 
           MVKL    .S1     _cnt1K$1,A0       ; |76| 
           MVKH    .S1     _cnt1K$1,A0       ; |76| 
           LDW     .D1T1   *A0,A6            ; |76| 
           LDW     .D2T2   *+SP(20),B5       ; |87| 
           MVKH    .S2     _cnt$2,B6         ; |83| 
           STW     .D2T2   B6,*+SP(24)       ; |79| 
           LDW     .D2T2   *+SP(28),B6       ; |79| 
           MVKL    .S1     _cnt1K$1,A5       ; |77| 
           MVKL    .S1     _cnt$2,A10        ; |87| 
           MVKL    .S1     _mmag$3,A15       ; |82| 
           MVKL    .S1     0x3b24b5bc,A13    ; |83| 
           MVKH    .S2     _cosf,B6          ; |82| 
           STW     .D2T2   B6,*+SP(28)       ; |77| 
           LDW     .D2T2   *+SP(32),B6       ; |77| 
           MVKH    .S2     _sinf,B5          ; |83| 
           MVK     .S1     100,A7            ; |77| 

           STW     .D2T2   B5,*+SP(20)       ; |81| 
||         ADD     .D1     1,A6,A6           ; |76| 
||         MVKL    .S1     _mmag$3,A14       ; |83| 
||         MVKL    .S2     __remu,B12        ; |87| 

           STW     .D1T1   A6,*A0            ; |76| 
||         MVKL    .S1     0x3983c496,A11    ; |84| 
||         MVKL    .S2     RL2,B3            ; |81| 

           LDW     .D2T1   *+SP(36),A0       ; |76| 
||         MVKH    .S2     _cnt$2,B6         ; |82| 
||         MVKL    .S1     0x3aa4b5bc,A4     ; |81| 

           STW     .D2T2   B6,*+SP(32)       ; |76| 
||         MVKH    .S1     _cnt1K$1,A5       ; |77| 
||         MVKL    .S2     _mmag$3,B13       ; |84| 

           LDW     .D1T1   *A5,A5            ; |77| 
||         MVKL    .S1     _cnt$2,A12        ; |84| 
||         MVKL    .S2     _cnt$2,B11        ; |86| 

           MVKH    .S1     _cnt$2,A10        ; |87| 
||         MVKL    .S2     _cosf,B10         ; |84| 

           MVKH    .S2     __remu,B12        ; |87| 
||         MVKH    .S1     _mmag$3,A15       ; |82| 

           MVKH    .S1     0x3b4de32b,A0     ; |82| 
||         MVKH    .S2     RL2,B3            ; |81| 

           STW     .D2T1   A0,*+SP(36)       ; |77| 
||         MVKH    .S1     0x3b24b5bc,A13    ; |83| 
||         MVKH    .S2     _mmag$3,B13       ; |84| 

           LDW     .D2T1   *+SP(40),A0       ; |77| 
||         CMPLTU  .L1     A5,A7,A1          ; |77| 
||         MVKH    .S2     _cnt$2,B11        ; |86| 
||         MVKH    .S1     _mmag$3,A14       ; |83| 

   [ A1]   B       .S2     L10               ; |77| 
||         MVKH    .S1     0x3983c496,A11    ; |84| 

           MVKH    .S1     0x3aa4b5bc,A4     ; |81| 
||         MVKH    .S2     _cosf,B10         ; |84| 

           MVKL    .S2     _sinf,B4          ; |81| 
||         MVKH    .S1     _cnt$2,A12        ; |84| 

           MVKH    .S2     _sinf,B4          ; |81| 
||         MVKL    .S1     _cnt1K$1,A3       ; |79| 

           MVKL    .S2     _cnt$2,B5         ; |81| 
||         MVKH    .S1     _mmag$3,A0        ; |81| 

           ZERO    .D1     A0                ; |79| 
||         MVKH    .S2     _cnt$2,B5         ; |81| 
||         STW     .D2T1   A0,*+SP(40)       ; |84| 
||         MVKH    .S1     _cnt1K$1,A3       ; |79| 

           ; BRANCH OCCURS                   ; |77| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A0,*A3            ; |79| 
           LDW     .D2T2   *B5,B5            ; |81| 
           NOP             4
           INTSPU  .L2     B5,B5             ; |81| 
           NOP             1
           B       .S2     B4                ; |81| 
           NOP             1
           MPYSP   .M1X    B5,A4,A4          ; |81| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |81| 
           LDW     .D2T1   *+SP(40),A0       ; |81| 
           LDW     .D2T2   *+SP(32),B4       ; |81| 
           MVKL    .S2     RL4,B3            ; |82| 
           MVKH    .S2     RL4,B3            ; |82| 
           NOP             1
           LDW     .D1T1   *A0,A0            ; |81| 
           NOP             4
           MPYSP   .M1     A4,A0,A0          ; |81| 
           NOP             3
           STW     .D2T1   A0,*+SP(4)        ; |81| 
           LDW     .D2T2   *B4,B4            ; |82| 
           LDW     .D2T1   *+SP(36),A0       ; |82| 
           NOP             3
           INTSPU  .L2     B4,B4             ; |82| 
           NOP             3

           LDW     .D2T2   *+SP(28),B4       ; |82| 
||         MPYSP   .M1X    B4,A0,A4          ; |82| 

           NOP             4
           B       .S2     B4                ; |82| 
           NOP             5
RL4:       ; CALL OCCURS                     ; |82| 
           LDW     .D1T1   *A15,A0           ; |82| 
           LDW     .D2T2   *+SP(24),B4       ; |82| 
           MVKL    .S2     RL6,B3            ; |83| 
           MVKH    .S2     RL6,B3            ; |83| 
           NOP             1
           MPYSP   .M1     A4,A0,A0          ; |82| 
           NOP             3
           STW     .D2T1   A0,*+SP(8)        ; |82| 
           LDW     .D2T2   *B4,B4            ; |83| 
           NOP             4
           INTSPU  .L2     B4,B4             ; |83| 
           NOP             3

           LDW     .D2T2   *+SP(20),B4       ; |83| 
||         MPYSP   .M1X    B4,A13,A4         ; |83| 

           NOP             4
           B       .S2     B4                ; |83| 
           NOP             5
RL6:       ; CALL OCCURS                     ; |83| 
           LDW     .D1T1   *A14,A0           ; |83| 
           MVKL    .S2     RL8,B3            ; |84| 
           MVKH    .S2     RL8,B3            ; |84| 
           NOP             2
           MPYSP   .M1     A4,A0,A0          ; |83| 
           NOP             3
           STW     .D2T1   A0,*+SP(12)       ; |83| 
           LDW     .D1T1   *A12,A0           ; |84| 
           NOP             4
           INTSPU  .L1     A0,A0             ; |84| 
           NOP             1
           B       .S2     B10               ; |84| 
           NOP             1
           MPYSP   .M1     A0,A11,A4         ; |84| 
           NOP             3
RL8:       ; CALL OCCURS                     ; |84| 
           LDW     .D2T2   *B13,B4           ; |84| 
           MVKL    .S2     RL10,B3           ; |87| 
           NOP             3
           MPYSP   .M2X    A4,B4,B4          ; |84| 
           NOP             3
           STW     .D2T2   B4,*+SP(16)       ; |84| 
           LDW     .D2T2   *B11,B4           ; |86| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |86| 

           B       .S2     B12               ; |87| 
||         STW     .D2T2   B4,*B11           ; |86| 

           LDW     .D1T1   *A10,A4           ; |87| 
           MVK     .S2     0x1388,B4         ; |87| 
           MVKH    .S2     RL10,B3           ; |87| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |87| 
           MV      .D1     A4,A1             ; |87| 
   [ A1]   B       .S1     L9                ; |87| 
           MVKL    .S1     _mmag$3,A0        ; |88| 

           MVKL    .S2     _mmag$3,B4        ; |89| 
||         MVKL    .S1     0x3c23d70a,A3     ; |88| 

           MVKH    .S2     _mmag$3,B4        ; |89| 
||         ZERO    .D2     B5                ; |89| 
||         MVKH    .S1     _mmag$3,A0        ; |88| 

   [!A1]   LDW     .D1T1   *A0,A4            ; |88| 
||         MVKH    .S1     0x3c23d70a,A3     ; |88| 
||         MVKH    .S2     0x40000000,B5     ; |89| 

   [ A1]   MVKL    .S1     _USBdelayCnt,A0   ; |94| 
|| [ A1]   MVKL    .S2     _USBacc,B4        ; |94| 

           ; BRANCH OCCURS                   ; |87| 
;** --------------------------------------------------------------------------*
           NOP             3
           ADDSP   .L1     A3,A4,A3          ; |88| 
           NOP             3
           STW     .D1T1   A3,*A0            ; |88| 
           LDW     .D2T2   *B4,B6            ; |89| 
           MVKL    .S2     _mmag$3,B4        ; |90| 
           MVKH    .S2     _mmag$3,B4        ; |90| 
           MVKL    .S1     0x3e4ccccd,A0     ; |90| 
           MVKH    .S1     0x3e4ccccd,A0     ; |90| 
           CMPGTSP .S2     B6,B5,B0          ; |89| 
   [ B0]   STW     .D2T1   A0,*B4            ; |90| 

           MVKL    .S2     _USBacc,B4        ; |94| 
||         MVKL    .S1     _USBdelayCnt,A0   ; |94| 

;** --------------------------------------------------------------------------*
L9:    

           MVKL    .S2     _UMAddData,B5     ; |94| 
||         MVKH    .S1     _USBdelayCnt,A0   ; |94| 

           LDW     .D1T1   *A0,A0            ; |94| 
||         MVKL    .S2     _USBvelocity,B6   ; |94| 

           MVKH    .S2     _USBacc,B4        ; |94| 
           MVKH    .S2     _UMAddData,B5     ; |94| 

           MVKH    .S2     _USBvelocity,B6   ; |94| 
||         MVKL    .S1     _USBposition,A3   ; |94| 

           B       .S2     B5                ; |94| 
||         LDW     .D2T1   *B4,A6            ; |94| 
||         MVKH    .S1     _USBposition,A3   ; |94| 

           LDW     .D2T2   *B6,B4            ; |94| 
||         INTSPU  .L1     A0,A0             ; |94| 
||         LDW     .D1T1   *A3,A4            ; |94| 

           MVKL    .S2     RL12,B3           ; |94| 
           MVKH    .S2     RL12,B3           ; |94| 
           NOP             1
           MV      .L2X    A0,B6             ; |94| 
RL12:      ; CALL OCCURS                     ; |94| 
;** --------------------------------------------------------------------------*
L10:    
           LDW     .D2T2   *+SP(164),B12     ; |96| 
           LDW     .D2T2   *+SP(160),B11     ; |96| 
           LDW     .D2T2   *+SP(156),B10     ; |96| 
           LDW     .D2T2   *+SP(152),B9      ; |96| 
           LDW     .D2T2   *+SP(148),B8      ; |96| 
           LDW     .D2T2   *+SP(144),B7      ; |96| 
           LDW     .D2T2   *+SP(140),B6      ; |96| 
           LDW     .D2T2   *+SP(136),B5      ; |96| 
           LDW     .D2T2   *+SP(132),B4      ; |96| 
           LDW     .D2T2   *+SP(128),B3      ; |96| 
           LDW     .D2T2   *+SP(124),B2      ; |96| 
           LDW     .D2T2   *+SP(120),B1      ; |96| 
           LDW     .D2T2   *+SP(116),B0      ; |96| 
           LDW     .D2T1   *+SP(112),A15     ; |96| 
           LDW     .D2T1   *+SP(108),A14     ; |96| 
           LDW     .D2T1   *+SP(104),A13     ; |96| 
           LDW     .D2T1   *+SP(100),A12     ; |96| 
           LDW     .D2T1   *+SP(96),A11      ; |96| 
           LDW     .D2T1   *+SP(92),A10      ; |96| 
           LDW     .D2T1   *+SP(88),A9       ; |96| 
           LDW     .D2T1   *+SP(84),A8       ; |96| 
           LDW     .D2T1   *+SP(80),A7       ; |96| 
           LDW     .D2T1   *+SP(76),A6       ; |96| 
           LDW     .D2T1   *+SP(72),A5       ; |96| 
           LDW     .D2T1   *+SP(68),A4       ; |96| 
           LDW     .D2T1   *+SP(64),A3       ; |96| 
           LDW     .D2T1   *+SP(60),A2       ; |96| 
           LDW     .D2T1   *+SP(56),A1       ; |96| 

           B       .S2     IRP               ; |96| 
||         LDW     .D2T2   *+SP(168),B13     ; |96| 

           LDW     .D2T1   *+SP(52),A0       ; |96| 
           ADDK    .S2     168,SP            ; |96| 
           NOP             3
           ; BRANCH OCCURS                   ; |96| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sinf
	.global	_cosf
	.global	_SendByte
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_USBposition
	.global	_USBvelocity
	.global	_USBacc
	.global	_USBdelayCnt
	.global	__remu
