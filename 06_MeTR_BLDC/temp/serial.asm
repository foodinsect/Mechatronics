;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Fri May 17 14:23:43 2024                                *
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

	.global	_compacket
_compacket:	.usect	.far,236,4
	.global	_respacket
_respacket:	.usect	.far,212,4
	.global	_tmp_string
_tmp_string:	.usect	.far,200,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\user\AppData\Local\Temp\TI3360_2 --template_info_file C:\Users\user\AppData\Local\Temp\TI3360_3 --object_file serial.obj --opt_shell 9 serial.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 serial.c 
	.sect	".text"
	.global	_InitUART

;******************************************************************************
;* FUNCTION NAME: _InitUART                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A3,B0,B1,B2,B4,B5,B6,B7,B8,B9,SP                  *
;*   Regs Used         : A0,A3,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,SP               *
;*   Local Frame Size  : 0 Args + 4 Auto + 0 Save = 4 byte                    *
;******************************************************************************
_InitUART:
;** --------------------------------------------------------------------------*
           MVKL    .S2     _compacket+120,B4 ; |22| 
           MVKL    .S2     _compacket+124,B8 ; |23| 
           MVKL    .S2     _compacket+232,B7 ; |24| 
           MVKL    .S2     _respacket+208,B9 ; |25| 
           MVKL    .S2     0x200000c,B5      ; |27| 
           MVKL    .S2     0x2000004,B0      ; |29| 
           MVKL    .S2     0x200000c,B1      ; |31| 
           MVKH    .S2     _compacket+120,B4 ; |22| 
           MVKH    .S2     _compacket+124,B8 ; |23| 
           MVKH    .S2     _compacket+232,B7 ; |24| 

           MVKH    .S2     _respacket+208,B9 ; |25| 
||         MVKL    .S1     _compacket,A3     ; |22| 

           MVKH    .S2     0x200000c,B5      ; |27| 
||         MVKL    .S1     _compacket,A0     ; |23| 
||         ZERO    .D2     B6                ; |28| 

           MVKH    .S2     0x2000000,B6      ; |28| 
||         MVKH    .S1     _compacket,A3     ; |22| 

           MVKH    .S2     0x2000004,B0      ; |29| 
||         STW     .D2T1   A3,*B4            ; |22| 
||         MVKH    .S1     _compacket,A0     ; |23| 

           STW     .D2T1   A0,*B8            ; |23| 
||         MVKH    .S2     0x200000c,B1      ; |31| 
||         ZERO    .L2     B2                ; |24| 

           STW     .D2T2   B2,*B7            ; |24| 
||         ZERO    .D1     A0                ; |25| 
||         MVKL    .S2     0x2000008,B4      ; |32| 

           MVK     .S1     128,A0            ; |27| 
||         STW     .D2T1   A0,*B9            ; |25| 
||         MVKH    .S2     0x2000008,B4      ; |32| 

           MVK     .S1     6,A0              ; |28| 
||         STW     .D2T1   A0,*B5            ; |27| 
||         MVKL    .S2     0x2000008,B8      ; |33| 

           ZERO    .L2     B6                ; |29| 
||         STW     .D2T1   A0,*B6            ; |28| 
||         MVKH    .S2     0x2000008,B8      ; |33| 

           STW     .D2T2   B6,*B0            ; |29| 
||         MVK     .S1     3,A0              ; |31| 
||         MVKL    .S2     0x2000004,B7      ; |34| 

           MVK     .S1     1,A0              ; |32| 
||         STW     .D2T1   A0,*B1            ; |31| 
||         MVKH    .S2     0x2000004,B7      ; |34| 

           MVK     .S1     7,A0              ; |33| 
||         STW     .D2T1   A0,*B4            ; |32| 
||         MVKL    .S2     0x2000010,B9      ; |35| 

           MVK     .S1     1,A0              ; |34| 
||         STW     .D2T1   A0,*B8            ; |33| 
||         MVKH    .S2     0x2000010,B9      ; |35| 

           ZERO    .D1     A0                ; |37| 
||         STW     .D2T1   A0,*B7            ; |34| 
||         MVK     .S2     8,B5              ; |35| 

           STW     .D2T2   B5,*B9            ; |35| 
||         MVKH    .S1     0x2000000,A0      ; |37| 

           B       .S2     B3                ; |38| 
||         LDW     .D1T1   *A0,A0            ; |37| 

           SUB     .D2     SP,8,SP           ; |19| 
           NOP             3

           ADD     .S2     8,SP,SP           ; |38| 
||         STW     .D2T1   A0,*+SP(4)        ; |37| 

           ; BRANCH OCCURS                   ; |38| 


	.sect	".text"
	.global	_ReceiveByte

;******************************************************************************
;* FUNCTION NAME: _ReceiveByte                                                *
;*                                                                            *
;*   Regs Modified     : A0,A4                                                *
;*   Regs Used         : A0,A4,B3                                             *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ReceiveByte:
;** --------------------------------------------------------------------------*
           ZERO    .D1     A0                ; |42| 
           MVKH    .S1     0x2000000,A0      ; |42| 
           LDW     .D1T1   *A0,A0            ; |42| 
           B       .S2     B3                ; |43| 
           NOP             3
           EXTU    .S1     A0,24,24,A0       ; |42| 
           EXT     .S1     A0,24,24,A4       ; |42| 
           ; BRANCH OCCURS                   ; |43| 


	.sect	".text"
	.global	_SendByte

;******************************************************************************
;* FUNCTION NAME: _SendByte                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A1,B4,SP                                          *
;*   Regs Used         : A0,A1,A4,B3,B4,SP                                    *
;*   Local Frame Size  : 0 Args + 4 Auto + 0 Save = 4 byte                    *
;******************************************************************************
_SendByte:
;** --------------------------------------------------------------------------*

           SUB     .D2     SP,8,SP           ; |46| 
||         MVKL    .S1     0x2000014,A0      ; |47| 

           STB     .D2T1   A4,*+SP(4)        ; |46| 
||         MVKH    .S1     0x2000014,A0      ; |47| 

           LDW     .D1T1   *A0,A0            ; |47| 
           NOP             4
           EXTU    .S1     A0,25,30,A1       ; |47| 
   [ A1]   B       .S1     L2                ; |47| 
   [!A1]   MVKL    .S1     0x2000014,A0      ; |47| 
   [!A1]   MVKH    .S1     0x2000014,A0      ; |47| 
   [!A1]   LDW     .D1T1   *A0,A0            ; |47| 
           NOP             2
           ; BRANCH OCCURS                   ; |47| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
           NOP             2
           EXTU    .S1     A0,25,30,A1       ; |47| 
   [!A1]   B       .S1     L1                ; |47| 
   [!A1]   MVKL    .S1     0x2000014,A0      ; |47| 
   [!A1]   MVKH    .S1     0x2000014,A0      ; |47| 
   [!A1]   LDW     .D1T1   *A0,A0            ; |47| 
           NOP             2
           ; BRANCH OCCURS                   ; |47| 
;** --------------------------------------------------------------------------*
L2:    

           B       .S2     B3                ; |50| 
||         LDB     .D2T2   *+SP(4),B4        ; |49| 

           ADD     .D2     8,SP,SP           ; |50| 
           NOP             1
           ZERO    .D1     A0                ; |49| 
           MVKH    .S1     0x2000000,A0      ; |49| 
           STW     .D1T2   B4,*A0            ; |49| 
           ; BRANCH OCCURS                   ; |50| 


	.sect	".text"
	.global	_CheckSum

;******************************************************************************
;* FUNCTION NAME: _CheckSum                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 8 Auto + 4 Save = 12 byte                   *
;******************************************************************************
_CheckSum:
;** --------------------------------------------------------------------------*
           B       .S1     L4                ; |57| 

           ZERO    .S2     B4                ; |54| 
||         STW     .D2T2   B3,*SP--(16)      ; |53| 

           STW     .D2T2   B4,*+SP(8)        ; |57| 
||         MVKL    .S1     _compacket+228,A0 ; |59| 

           MVKH    .S1     _compacket+228,A0 ; |59| 
||         STW     .D2T2   B4,*+SP(4)        ; |58| 

           LDW     .D1T1   *A0,A0            ; |59| 
           NOP             1
           ; BRANCH OCCURS                   ; |57| 
;** --------------------------------------------------------------------------*
L3:    
           ADD     .D2     1,B5,B5
           STW     .D2T2   B5,*+SP(8)        ; |59| 
           MVKL    .S1     _compacket+228,A0 ; |59| 
           MVKH    .S1     _compacket+228,A0 ; |59| 
           ADD     .S2     B4,B6,B4          ; |58| 
           STW     .D2T2   B4,*+SP(4)        ; |58| 
           LDW     .D1T1   *A0,A0            ; |59| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L4:    
           LDW     .D2T2   *+SP(8),B5        ; |59| 
           MVKL    .S2     _compacket+128,B4 ; |59| 
           MVKH    .S2     _compacket+128,B4 ; |59| 
           SUB     .L2X    A0,B4,B4          ; |59| 
           SUB     .D2     B4,2,B4           ; |59| 
           CMPLT   .L2     B5,B4,B0          ; |59| 
   [ B0]   B       .S1     L3                ; |59| 
   [!B0]   MVKL    .S2     __remi,B5         ; |60| 
   [!B0]   MVKH    .S2     __remi,B5         ; |60| 
   [ B0]   MVKL    .S2     _compacket+128,B4 ; |58| 

   [ B0]   LDW     .D2T2   *+SP(4),B6        ; |58| 
|| [ B0]   MVKH    .S2     _compacket+128,B4 ; |58| 

   [ B0]   LDB     .D2T2   *+B5[B4],B4       ; |58| 
           ; BRANCH OCCURS                   ; |59| 
;** --------------------------------------------------------------------------*
           B       .S2     B5                ; |60| 
           LDW     .D2T1   *+SP(4),A4
           MVKL    .S2     RL0,B3            ; |60| 
           MVKH    .S2     RL0,B3            ; |60| 
           NOP             1
           MVK     .S2     0x64,B4           ; |60| 
RL0:       ; CALL OCCURS                     ; |60| 
           MVKL    .S2     _compacket+228,B4 ; |62| 

           MVKH    .S2     _compacket+228,B4 ; |62| 
||         STW     .D2T1   A4,*+SP(4)        ; |60| 

           LDW     .D2T2   *B4,B5            ; |62| 
           MVKL    .S1     _compacket+228,A0 ; |63| 
           ZERO    .D2     B4                ; |62| 
           MVKH    .S1     _compacket+228,A0 ; |63| 
           MVKL    .S2     RL2,B3            ; |63| 
           STB     .D2T2   B4,*B5            ; |62| 

           MVKL    .S1     _atoi,A0          ; |63| 
||         LDW     .D1T1   *A0,A3            ; |63| 

           MVKH    .S1     _atoi,A0          ; |63| 
           B       .S2X    A0                ; |63| 
           MVKH    .S2     RL2,B3            ; |63| 
           NOP             3
           SUB     .D1     A3,2,A4           ; |63| 
RL2:       ; CALL OCCURS                     ; |63| 
           LDW     .D2T2   *+SP(4),B4        ; |63| 
           LDW     .D2T2   *++SP(16),B3      ; |69| 
           NOP             4
           B       .S2     B3                ; |69| 
           CMPEQ   .L2X    A4,B4,B0          ; |63| 
           MVK     .S1     0x1,A4            ; |64| 
   [!B0]   ZERO    .D1     A4                ; |67| 
           NOP             2
           ; BRANCH OCCURS                   ; |69| 


	.sect	".text"
	.global	_SendData

;******************************************************************************
;* FUNCTION NAME: _SendData                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 4 Save = 4 byte                    *
;******************************************************************************
_SendData:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _strlen,A0        ; |74| 

           MVKL    .S2     _respacket,B4     ; |74| 
||         MVKH    .S1     _strlen,A0        ; |74| 

           B       .S2X    A0                ; |74| 
           MVKL    .S2     _respacket+208,B5 ; |73| 

           MVKL    .S2     RL4,B3            ; |74| 
||         STW     .D2T2   B3,*SP--(8)       ; |72| 

           MVKH    .S2     _respacket,B4     ; |74| 

           MVKH    .S2     _respacket+208,B5 ; |73| 
||         MVK     .S1     1,A3              ; |73| 

           STW     .D2T1   A3,*B5            ; |73| 
||         MV      .S1X    B4,A4             ; |74| 
||         MVKH    .S2     RL4,B3            ; |74| 

RL4:       ; CALL OCCURS                     ; |74| 

           MVK     .S1     1,A5              ; |75| 
||         MVKL    .S2     _respacket+200,B4 ; |74| 

           MVKL    .S1     _respacket,A3     ; |76| 
||         SUB     .D1     A4,1,A0           ; |74| 
||         MVKH    .S2     _respacket+200,B4 ; |74| 

           MVKL    .S1     _SendByte,A0      ; |76| 
||         STW     .D2T1   A0,*B4            ; |74| 
||         MVKL    .S2     _respacket+204,B5 ; |75| 

           MVKH    .S1     _SendByte,A0      ; |76| 
||         MVKH    .S2     _respacket+204,B5 ; |75| 

           B       .S2X    A0                ; |76| 
||         STW     .D2T1   A5,*B5            ; |75| 
||         MVKH    .S1     _respacket,A3     ; |76| 

           LDB     .D1T1   *A3,A4            ; |76| 
           MVKL    .S2     RL6,B3            ; |76| 
           MVKH    .S2     RL6,B3            ; |76| 
           NOP             2
RL6:       ; CALL OCCURS                     ; |76| 
           MVKL    .S2     0x2000004,B4      ; |77| 

           MVKH    .S2     0x2000004,B4      ; |77| 
||         MVK     .S1     3,A0              ; |77| 

           STW     .D2T1   A0,*B4            ; |77| 
           LDW     .D2T2   *++SP(8),B3       ; |78| 
           NOP             4
           B       .S2     B3                ; |78| 
           NOP             5
           ; BRANCH OCCURS                   ; |78| 


	.sect	".text"
	.global	_Report

;******************************************************************************
;* FUNCTION NAME: _Report                                                     *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 8 Auto + 4 Save = 12 byte                   *
;******************************************************************************
_Report:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _strcpy,A0        ; |84| 
           MVKH    .S1     _strcpy,A0        ; |84| 
           B       .S2X    A0                ; |84| 
           MVKL    .S2     _tmp_string,B4    ; |84| 
           STW     .D2T2   B3,*SP--(16)      ; |81| 
           MVKL    .S2     RL8,B3            ; |84| 

           MVKH    .S2     _tmp_string,B4    ; |84| 
||         MVKL    .S1     _respacket,A4     ; |84| 

           MVKH    .S2     RL8,B3            ; |84| 
||         MVKH    .S1     _respacket,A4     ; |84| 

RL8:       ; CALL OCCURS                     ; |84| 
           MVKL    .S2     _strlen,B4        ; |86| 
           MVKH    .S2     _strlen,B4        ; |86| 
           B       .S2     B4                ; |86| 
           MVKL    .S1     _respacket,A4     ; |86| 
           MVKL    .S2     RL10,B3           ; |86| 
           ZERO    .D2     B5                ; |86| 
           STW     .D2T2   B5,*+SP(4)        ; |86| 

           MVKH    .S1     _respacket,A4     ; |86| 
||         MVKH    .S2     RL10,B3           ; |86| 

RL10:      ; CALL OCCURS                     ; |86| 
           LDW     .D2T2   *+SP(4),B4        ; |86| 
           NOP             4
           CMPLTU  .L2X    B4,A4,B0          ; |86| 
   [!B0]   B       .S1     L8                ; |86| 
   [!B0]   LDW     .D2T2   *++SP(16),B3      ; |90| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |87| 
   [ B0]   MVKL    .S1     _SendByte,A0      ; |87| 
   [ B0]   MVKL    .S2     _respacket,B4     ; |87| 

   [ B0]   MVKH    .S1     _SendByte,A0      ; |87| 
|| [ B0]   MVKH    .S2     _respacket,B4     ; |87| 

           ; BRANCH OCCURS                   ; |86| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L5
;** --------------------------------------------------------------------------*
L5:    
           B       .S2X    A0                ; |87| 
           LDB     .D2T1   *+B5[B4],A4       ; |87| 
           MVKL    .S2     RL12,B3           ; |87| 
           MVKH    .S2     RL12,B3           ; |87| 
           NOP             2
RL12:      ; CALL OCCURS                     ; |87| 
           ZERO    .D2     B4                ; |88| 

           INTDPU  .L2     B4,B5:B4          ; |88| 
||         STW     .D2T2   B4,*+SP(8)        ; |88| 

           MVKL    .S1     0x407f4000,A1     ; |88| 
           MVKH    .S1     0x407f4000,A1     ; |88| 
           ZERO    .D1     A0                ; |88| 
           NOP             1
           CMPLTDP .S1X    B5:B4,A1:A0,A1    ; |88| 
           NOP             1
   [!A1]   B       .S1     L7                ; |88| 
           NOP             4
   [ A1]   LDW     .D2T2   *+SP(8),B4        ; |88| 
           ; BRANCH OCCURS                   ; |88| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L6:    
           MVKL    .S1     0x407f4000,A1     ; |88| 
           MVKH    .S1     0x407f4000,A1     ; |88| 
           NOP             2
           ADD     .D2     1,B4,B4           ; |88| 

           INTDPU  .L2     B4,B5:B4          ; |88| 
||         STW     .D2T2   B4,*+SP(8)        ; |88| 

           NOP             4
           CMPLTDP .S1X    B5:B4,A1:A0,A1    ; |88| 
           NOP             1
   [ A1]   B       .S1     L6                ; |88| 
           NOP             4
   [ A1]   LDW     .D2T2   *+SP(8),B4        ; |88| 
           ; BRANCH OCCURS                   ; |88| 
;** --------------------------------------------------------------------------*
L7:    
           MVKL    .S2     _strlen,B4        ; |89| 

           LDW     .D2T2   *+SP(4),B5        ; |89| 
||         MVKH    .S2     _strlen,B4        ; |89| 

           B       .S2     B4                ; |89| 
           MVKL    .S2     RL14,B3           ; |89| 
           MVKL    .S1     _respacket,A4     ; |89| 
           MVKH    .S1     _respacket,A4     ; |89| 
           ADD     .D2     1,B5,B5           ; |89| 

           STW     .D2T2   B5,*+SP(4)        ; |89| 
||         MVKH    .S2     RL14,B3           ; |89| 

RL14:      ; CALL OCCURS                     ; |89| 
           LDW     .D2T2   *+SP(4),B4        ; |89| 
           NOP             4
           CMPLTU  .L2X    B4,A4,B0          ; |89| 
   [ B0]   B       .S1     L5                ; |89| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |87| 
   [!B0]   LDW     .D2T2   *++SP(16),B3      ; |90| 
   [ B0]   MVKL    .S1     _SendByte,A0      ; |87| 
   [ B0]   MVKL    .S2     _respacket,B4     ; |87| 

   [ B0]   MVKH    .S1     _SendByte,A0      ; |87| 
|| [ B0]   MVKH    .S2     _respacket,B4     ; |87| 

           ; BRANCH OCCURS                   ; |89| 
;** --------------------------------------------------------------------------*
           NOP             1
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B3                ; |90| 
           NOP             5
           ; BRANCH OCCURS                   ; |90| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_strlen
	.global	_strcpy
	.global	_atoi
	.global	__remi
