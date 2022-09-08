;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"lab1.c"
	list	p=12f675
	radix dec
	include "p12f675.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_ANSEL
	extern	_VRCON
	extern	_TRISIO
	extern	_CMCON
	extern	_GPIO
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_print
	global	_msdelay

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_lab1_0	udata
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
r0x100D	res	1
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x1016	res	1
r0x1009	res	1
r0x1008	res	1
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_lab1	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _print
;   _msdelay
;   _print
;   _msdelay
;   _print
;   _msdelay
;   _print
;   _msdelay
;14 compiler assigned registers:
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;   r0x1013
;   r0x1014
;   r0x1015
;   STK00
;   r0x1016
;; Starting pCode block
S_lab1__main	code
_main:
; 2 exit points
;	.line	16; "lab1.c"	ANSEL  = 0x00;   
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	17; "lab1.c"	CMCON  = 0x07;   
	MOVLW	0x07
	BANKSEL	_CMCON
	MOVWF	_CMCON
;	.line	18; "lab1.c"	VRCON  = 0x00;   
	BANKSEL	_VRCON
	CLRF	_VRCON
;	.line	19; "lab1.c"	TRISIO = 0b00001000;
	MOVLW	0x08
	MOVWF	_TRISIO
;	.line	20; "lab1.c"	GPIO = 0x00; 
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	26; "lab1.c"	unsigned int num1=0;
	CLRF	r0x100A
	CLRF	r0x100B
;	.line	27; "lab1.c"	unsigned int num2=0;
	CLRF	r0x100C
	CLRF	r0x100D
;	.line	29; "lab1.c"	unsigned int rand1=0;
	CLRF	r0x100E
	CLRF	r0x100F
;	.line	30; "lab1.c"	unsigned int rand2=0;
	CLRF	r0x1010
	CLRF	r0x1011
;	.line	36; "lab1.c"	while(1)
	CLRF	r0x1012
	CLRF	r0x1013
_00119_DS_:
;	.line	38; "lab1.c"	rand1+=1;
	INCF	r0x100E,F
	BTFSC	STATUS,2
	INCF	r0x100F,F
;	.line	39; "lab1.c"	rand2+=1;
	MOVLW	0x01
	ADDWF	r0x1010,W
	MOVWF	r0x1014
	CLRF	r0x1015
	RLF	r0x1015,F
	MOVF	r0x1011,W
	ADDWF	r0x1015,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
;	.line	41; "lab1.c"	if (rand1>9){
	MOVLW	0x00
	SUBWF	r0x100F,W
	BTFSS	STATUS,2
	GOTO	_00163_DS_
	MOVLW	0x0a
	SUBWF	r0x100E,W
_00163_DS_:
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3307: created from rifx:0x7fff6f25f280
;	.line	42; "lab1.c"	rand1=0;
	CLRF	r0x100E
	CLRF	r0x100F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
_00106_DS_:
;	.line	44; "lab1.c"	if (rand2>9){
	MOVLW	0x00
	SUBWF	r0x1015,W
	BTFSS	STATUS,2
	GOTO	_00164_DS_
	MOVLW	0x0a
	SUBWF	r0x1014,W
_00164_DS_:
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3307: created from rifx:0x7fff6f25f280
;	.line	45; "lab1.c"	rand2=0;
	CLRF	r0x1014
	CLRF	r0x1015
_00108_DS_:
;	.line	48; "lab1.c"	GP4=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
;	.line	49; "lab1.c"	print(num1);
	MOVF	r0x100A,W
	MOVWF	STK00
	MOVF	r0x100B,W
	PAGESEL	_print
	CALL	_print
	PAGESEL	$
;	.line	50; "lab1.c"	msdelay(time);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_msdelay
	CALL	_msdelay
	PAGESEL	$
;	.line	51; "lab1.c"	GP4=0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
;	.line	52; "lab1.c"	print(num2);
	MOVF	r0x100C,W
	MOVWF	STK00
	MOVF	r0x100D,W
	PAGESEL	_print
	CALL	_print
	PAGESEL	$
;	.line	53; "lab1.c"	rand2+=1;
	MOVLW	0x01
	ADDWF	r0x1014,W
	MOVWF	r0x1010
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x1015,W
	ADDWF	r0x1011,F
;	.line	54; "lab1.c"	msdelay(time);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_msdelay
	CALL	_msdelay
	PAGESEL	$
;	.line	56; "lab1.c"	if (GP3==1){
	CLRF	r0x1014
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1014,F
	MOVF	r0x1014,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00119_DS_
;	.line	58; "lab1.c"	btn=1;
	MOVLW	0x01
	MOVWF	r0x1014
	CLRF	r0x1015
;	.line	59; "lab1.c"	stop+=1;
	INCF	r0x1012,F
	BTFSC	STATUS,2
	INCF	r0x1013,F
_00111_DS_:
;	.line	64; "lab1.c"	while (btn==1){
	MOVF	r0x1014,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00113_DS_
	MOVF	r0x1015,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00113_DS_
;	.line	65; "lab1.c"	num1=rand1;
	MOVF	r0x100E,W
	MOVWF	r0x100A
	MOVF	r0x100F,W
	MOVWF	r0x100B
;	.line	66; "lab1.c"	num2=rand2;
	MOVF	r0x1010,W
	MOVWF	r0x100C
	MOVF	r0x1011,W
	MOVWF	r0x100D
;	.line	68; "lab1.c"	if (GP3==1){
	CLRF	r0x1016
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1016,F
	MOVF	r0x1016,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00111_DS_
;	.line	69; "lab1.c"	btn=0;
	CLRF	r0x1014
	CLRF	r0x1015
	GOTO	_00111_DS_
;;unsigned compare: left < lit(0xA0=160), size=2
_00113_DS_:
;	.line	74; "lab1.c"	if (stop>=160){
	MOVLW	0x00
	SUBWF	r0x1013,W
	BTFSS	STATUS,2
	GOTO	_00165_DS_
	MOVLW	0xa0
	SUBWF	r0x1012,W
_00165_DS_:
	BTFSS	STATUS,0
	GOTO	_00119_DS_
;;genSkipc:3307: created from rifx:0x7fff6f25f280
;	.line	75; "lab1.c"	num1=9;
	MOVLW	0x09
	MOVWF	r0x100A
	CLRF	r0x100B
;	.line	76; "lab1.c"	num2=9;
	MOVLW	0x09
	MOVWF	r0x100C
	CLRF	r0x100D
	GOTO	_00119_DS_
;	.line	84; "lab1.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
S_lab1__msdelay	code
_msdelay:
; 2 exit points
;	.line	161; "lab1.c"	void msdelay(unsigned int time)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	164; "lab1.c"	for (i=0;i<time;i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00210_DS_:
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00231_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00231_DS_:
	BTFSC	STATUS,0
	GOTO	_00212_DS_
;;genSkipc:3307: created from rifx:0x7fff6f25f280
;	.line	165; "lab1.c"	for (j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x1004
	MOVLW	0x04
	MOVWF	r0x1005
_00208_DS_:
	MOVLW	0xff
	ADDWF	r0x1004,W
	MOVWF	r0x1006
	MOVLW	0xff
	MOVWF	r0x1007
	MOVF	r0x1005,W
	BTFSC	STATUS,0
	INCFSZ	r0x1005,W
	ADDWF	r0x1007,F
	MOVF	r0x1006,W
	MOVWF	r0x1004
	MOVF	r0x1007,W
	MOVWF	r0x1005
	MOVF	r0x1007,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00208_DS_
;	.line	164; "lab1.c"	for (i=0;i<time;i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00210_DS_
_00212_DS_:
;	.line	166; "lab1.c"	}
	RETURN	
; exit point of _msdelay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1008
;   STK00
;   r0x1009
;; Starting pCode block
S_lab1__print	code
_print:
; 2 exit points
;	.line	87; "lab1.c"	void print(unsigned int num)
	MOVWF	r0x1008
	MOVF	STK00,W
;	.line	89; "lab1.c"	if (num==0){
	MOVWF	r0x1009
	IORWF	r0x1008,W
	BTFSS	STATUS,2
	GOTO	_00197_DS_
;	.line	90; "lab1.c"	GPIO0=0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	91; "lab1.c"	GPIO1=0;
	BCF	_GPIObits,1
;	.line	92; "lab1.c"	GPIO2=0;
	BCF	_GPIObits,2
;	.line	93; "lab1.c"	GPIO5=0;
	BCF	_GPIObits,5
	GOTO	_00199_DS_
_00197_DS_:
;	.line	96; "lab1.c"	else if (num==1){
	MOVF	r0x1009,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00194_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00194_DS_
;	.line	97; "lab1.c"	GPIO0=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	98; "lab1.c"	GPIO1=0;
	BCF	_GPIObits,1
;	.line	99; "lab1.c"	GPIO2=0;
	BCF	_GPIObits,2
;	.line	100; "lab1.c"	GPIO5=0;
	BCF	_GPIObits,5
	GOTO	_00199_DS_
_00194_DS_:
;	.line	103; "lab1.c"	else if (num==2){
	MOVF	r0x1009,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00191_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00191_DS_
;	.line	104; "lab1.c"	GPIO0=0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	105; "lab1.c"	GPIO1=1;
	BSF	_GPIObits,1
;	.line	106; "lab1.c"	GPIO2=0;
	BCF	_GPIObits,2
;	.line	107; "lab1.c"	GPIO5=0;
	BCF	_GPIObits,5
	GOTO	_00199_DS_
_00191_DS_:
;	.line	110; "lab1.c"	else if (num==3){
	MOVF	r0x1009,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00188_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00188_DS_
;	.line	111; "lab1.c"	GPIO0=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	112; "lab1.c"	GPIO1=1;
	BSF	_GPIObits,1
;	.line	113; "lab1.c"	GPIO2=0;
	BCF	_GPIObits,2
;	.line	114; "lab1.c"	GPIO5=0;
	BCF	_GPIObits,5
	GOTO	_00199_DS_
_00188_DS_:
;	.line	117; "lab1.c"	else if (num==4){
	MOVF	r0x1009,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00185_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00185_DS_
;	.line	118; "lab1.c"	GPIO0=0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	119; "lab1.c"	GPIO1=0;
	BCF	_GPIObits,1
;	.line	120; "lab1.c"	GPIO2=1;
	BSF	_GPIObits,2
;	.line	121; "lab1.c"	GPIO5=0;
	BCF	_GPIObits,5
	GOTO	_00199_DS_
_00185_DS_:
;	.line	124; "lab1.c"	else if (num==5){
	MOVF	r0x1009,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00182_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00182_DS_
;	.line	125; "lab1.c"	GPIO0=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	126; "lab1.c"	GPIO1=0;
	BCF	_GPIObits,1
;	.line	127; "lab1.c"	GPIO2=1;
	BSF	_GPIObits,2
;	.line	128; "lab1.c"	GPIO5=0;
	BCF	_GPIObits,5
	GOTO	_00199_DS_
_00182_DS_:
;	.line	131; "lab1.c"	else if (num==6){
	MOVF	r0x1009,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00179_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00179_DS_
;	.line	132; "lab1.c"	GPIO0=0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	133; "lab1.c"	GPIO1=1;
	BSF	_GPIObits,1
;	.line	134; "lab1.c"	GPIO2=1;
	BSF	_GPIObits,2
;	.line	135; "lab1.c"	GPIO5=0;
	BCF	_GPIObits,5
	GOTO	_00199_DS_
_00179_DS_:
;	.line	138; "lab1.c"	else if (num==7){
	MOVF	r0x1009,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00176_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00176_DS_
;	.line	139; "lab1.c"	GPIO0=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	140; "lab1.c"	GPIO1=1;
	BSF	_GPIObits,1
;	.line	141; "lab1.c"	GPIO2=1;
	BSF	_GPIObits,2
;	.line	142; "lab1.c"	GPIO5=0;
	BCF	_GPIObits,5
	GOTO	_00199_DS_
_00176_DS_:
;	.line	145; "lab1.c"	else if (num==8){
	MOVF	r0x1009,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00173_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00173_DS_
;	.line	146; "lab1.c"	GPIO0=0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	147; "lab1.c"	GPIO1=0;
	BCF	_GPIObits,1
;	.line	148; "lab1.c"	GPIO2=0;
	BCF	_GPIObits,2
;	.line	149; "lab1.c"	GPIO5=1;
	BSF	_GPIObits,5
	GOTO	_00199_DS_
_00173_DS_:
;	.line	152; "lab1.c"	else if (num==9){
	MOVF	r0x1009,W
	XORLW	0x09
	BTFSS	STATUS,2
	GOTO	_00199_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00199_DS_
;	.line	153; "lab1.c"	GPIO0=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	154; "lab1.c"	GPIO1=0;
	BCF	_GPIObits,1
;	.line	155; "lab1.c"	GPIO2=0;
	BCF	_GPIObits,2
;	.line	156; "lab1.c"	GPIO5=1;
	BSF	_GPIObits,5
_00199_DS_:
;	.line	158; "lab1.c"	}
	RETURN	
; exit point of _print


;	code size estimation:
;	  294+   26 =   320 instructions (  692 byte)

	end
