;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Fri Apr 05 17:14:20 2024                                *
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
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\user\AppData\Local\Temp\TI7312_2 --template_info_file C:\Users\user\AppData\Local\Temp\TI7312_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
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
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 16 Auto + 84 Save = 100 byte                *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B9,*SP--(104)     ; |70| 
           STW     .D2T1   A0,*+SP(28)       ; |70| 
           STW     .D2T2   B3,*+SP(80)       ; |70| 
           STW     .D2T2   B6,*+SP(92)       ; |70| 
           STW     .D2T2   B5,*+SP(88)       ; |70| 
           STW     .D2T2   B4,*+SP(84)       ; |70| 
           STW     .D2T2   B2,*+SP(76)       ; |70| 
           STW     .D2T2   B1,*+SP(72)       ; |70| 
           STW     .D2T2   B0,*+SP(68)       ; |70| 
           STW     .D2T1   A9,*+SP(64)       ; |70| 
           STW     .D2T1   A8,*+SP(60)       ; |70| 
           STW     .D2T1   A7,*+SP(56)       ; |70| 

           STW     .D2T1   A6,*+SP(52)       ; |70| 
||         MVKL    .S1     _GetAngle,A0      ; |81| 

           STW     .D2T1   A5,*+SP(48)       ; |70| 
||         MVKH    .S1     _GetAngle,A0      ; |81| 

           B       .S2X    A0                ; |81| 
||         STW     .D2T2   B7,*+SP(96)       ; |70| 

           STW     .D2T1   A4,*+SP(44)       ; |70| 
           STW     .D2T1   A3,*+SP(40)       ; |70| 
           STW     .D2T1   A2,*+SP(36)       ; |70| 

           STW     .D2T1   A1,*+SP(32)       ; |70| 
||         MVKL    .S2     RL2,B3            ; |81| 

           MVKH    .S2     RL2,B3            ; |81| 
||         STW     .D2T2   B8,*+SP(100)      ; |70| 

RL2:       ; CALL OCCURS                     ; |81| 

           MV      .S2X    A4,B4             ; |81| 
||         MVKL    .S1     _R,A0             ; |84| 

           STW     .D2T2   B4,*+SP(4)        ; |81| 
||         MVKH    .S1     _R,A0             ; |84| 

           LDW     .D1T1   *A0,A0            ; |84| 
           MVKL    .S2     RL4,B3            ; |92| 
           MVKH    .S2     RL4,B3            ; |92| 
           NOP             2
           SUBSP   .L2X    A0,B4,B5          ; |84| 
           MVKL    .S2     _sumErr,B4        ; |87| 
           MVKH    .S2     _sumErr,B4        ; |87| 
           MV      .S1X    B4,A0             ; |87| 
           STW     .D2T2   B5,*+SP(8)        ; |84| 
           LDW     .D1T2   *A0,B4            ; |87| 
           MV      .S1X    B5,A3             ; |87| 
           NOP             3
           ADDSP   .L1X    A3,B4,A3          ; |87| 
           MVKL    .S2     _prevErr,B4       ; |88| 
           MVKH    .S2     _prevErr,B4       ; |88| 
           NOP             1
           STW     .D1T1   A3,*A0            ; |87| 
           MVKL    .S1     _sumErr,A0        ; |88| 

           MVKH    .S1     _sumErr,A0        ; |88| 
||         LDW     .D2T2   *+SP(8),B7        ; |88| 

           LDW     .D2T2   *B4,B6            ; |88| 
||         LDW     .D1T1   *A0,A3            ; |88| 

           MVKL    .S2     0x358637bd,B4     ; |88| 
           MVKL    .S1     0x3eb33333,A0     ; |88| 
           MVKH    .S2     0x358637bd,B4     ; |88| 
           MV      .D2     B7,B5             ; |88| 

           MVKH    .S1     0x3eb33333,A0     ; |88| 
||         SUBSP   .L2     B5,B6,B4          ; |88| 
||         MPYSP   .M2X    A3,B4,B5          ; |88| 

           MPYSP   .M2X    B7,A0,B7          ; |88| 
           ZERO    .D1     A0                ; |88| 
           MVKH    .S1     0x40900000,A0     ; |88| 
           LDW     .D2T1   *+SP(8),A3        ; |89| 

           MPYSP   .M2X    B4,A0,B4          ; |88| 
||         ADDSP   .L2     B5,B7,B5          ; |88| 

           MVKL    .S1     _prevErr,A0       ; |89| 
           MVKH    .S1     _prevErr,A0       ; |89| 
           NOP             1
           ADDSP   .L2     B4,B5,B5          ; |88| 
           MVKL    .S2     _PWMOut,B4        ; |92| 
           MVKH    .S2     _PWMOut,B4        ; |92| 
           NOP             1
           STW     .D2T2   B5,*+SP(12)       ; |88| 

           STW     .D1T1   A3,*A0            ; |89| 
||         B       .S2     B4                ; |92| 

           LDW     .D2T1   *+SP(12),A4       ; |92| 
           NOP             4
RL4:       ; CALL OCCURS                     ; |92| 
           MVKL    .S1     _overshoot,A0     ; |95| 

           STW     .D2T1   A4,*+SP(16)       ; |92| 
||         MVKH    .S1     _overshoot,A0     ; |95| 

           LDW     .D1T1   *A0,A0            ; |95| 
||         LDW     .D2T2   *+SP(4),B5        ; |95| 

           MVKL    .S2     _overshoot,B4     ; |95| 
           MVKH    .S2     _overshoot,B4     ; |95| 
           MVKL    .S2     RL6,B3            ; |98| 
           MVKH    .S2     RL6,B3            ; |98| 

           CMPGTSP .S1X    B5,A0,A1          ; |95| 
||         MV      .D2     B5,B6             ; |95| 

           MVKL    .S2     _UMAddData,B5     ; |98| 
|| [ A1]   STW     .D2T2   B6,*B4            ; |95| 

           MVKH    .S2     _UMAddData,B5     ; |98| 
||         MVKL    .S1     _R,A0             ; |98| 
||         LDW     .D2T2   *+SP(16),B6       ; |98| 

           LDW     .D2T1   *+SP(12),A6       ; |98| 
||         MVKH    .S1     _R,A0             ; |98| 
||         B       .S2     B5                ; |98| 

           LDW     .D1T1   *A0,A4            ; |98| 
||         LDW     .D2T2   *+SP(4),B4        ; |98| 

           NOP             4
RL6:       ; CALL OCCURS                     ; |98| 
           MVKL    .S2     _TINTCnt,B4       ; |100| 
           MVKH    .S2     _TINTCnt,B4       ; |100| 
           MV      .S1X    B4,A4             ; |100| 
           LDW     .D1T1   *A4,A0            ; |100| 
           MVK     .S2     1,B4              ; |101| 
           NOP             3

           MVKL    .S1     _TFlag,A0         ; |101| 
||         ADD     .D1     1,A0,A3           ; |100| 

           STW     .D1T1   A3,*A4            ; |100| 
||         MVKH    .S1     _TFlag,A0         ; |101| 

           STW     .D1T2   B4,*A0            ; |101| 
           LDW     .D2T2   *+SP(84),B4       ; |102| 
           LDW     .D2T1   *+SP(28),A0       ; |102| 
           LDW     .D2T1   *+SP(40),A3       ; |102| 
           LDW     .D2T1   *+SP(32),A1       ; |102| 
           LDW     .D2T2   *+SP(100),B8      ; |102| 
           LDW     .D2T2   *+SP(76),B2       ; |102| 
           LDW     .D2T2   *+SP(72),B1       ; |102| 
           LDW     .D2T2   *+SP(68),B0       ; |102| 
           LDW     .D2T1   *+SP(64),A9       ; |102| 
           LDW     .D2T1   *+SP(60),A8       ; |102| 
           LDW     .D2T1   *+SP(56),A7       ; |102| 
           LDW     .D2T1   *+SP(48),A5       ; |102| 
           LDW     .D2T1   *+SP(36),A2       ; |102| 
           LDW     .D2T1   *+SP(44),A4       ; |102| 
           LDW     .D2T2   *+SP(96),B7       ; |102| 
           LDW     .D2T2   *+SP(88),B5       ; |102| 
           LDW     .D2T2   *+SP(80),B3       ; |102| 
           LDW     .D2T1   *+SP(52),A6       ; |102| 

           B       .S2     IRP               ; |102| 
||         LDW     .D2T2   *+SP(92),B6       ; |102| 

           LDW     .D2T2   *++SP(104),B9     ; |102| 
           NOP             4
           ; BRANCH OCCURS                   ; |102| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_SendByte
	.global	_PWMOut
	.global	_GetAngle
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_TINTCnt
	.global	_overshoot
	.global	_R
