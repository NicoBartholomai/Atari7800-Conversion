    processor 6502
;*
;*	PIA AND TIMER (6532) LOCATIONS
;*
	.ORG	$280
;*
SWCHA:	DS.B	1	;LEFT & RIGHT JOYSTICKS
;*
;*	LEFT RITE
;*	7654 3210	;BIT POSITION (=0 IF SWITCH IS CLOSED)
;*	---- ----
;*	RLDU RLDU	;RIGHT/LEFT/DOWN/UP
;*
CTLSWA:	DS.B	1	;SWCHA DATA DIRECTION (0=INPUT)
;*
SWCHB:	DS.B	1	;CONSOLE SWITCHES
;*
;*	D7-RITE DIFFICULTY
;*	D6-LEFT DIFFICULTY
;*	D5/D4 NOT USED
;*	D3-PAUSE
;*	D2-NOT USED
;*	D1-GAME SELECT
;*	D0-GAME RESET
;*
CTLSWB:	DS.B	1	;SWCHB DATA DIRECTION (0=INPUT)
;*
INTIM:	DS.B	1	;INTERVAL TIMER READ
	DS.B	15
TIM1T:	DS.B	1	;SET 1    CLK INTERVAL (838   NSEC/INTERVAL)
TIM8T:	DS.B	1	;SET 8    CLK INTERVAL (6.7   USEC/INTERVAL)
TIM64T:	DS.B	1	;SET 64   CLK INTERVAL (53.6  USEC/INTERVAL)
T1024T:	DS.B	1	;SET 1024 CLK INTERVAL (858.2 USEC/INTERVAL)
	DS.B	6
TIM64TI:
	DS.B	1	;INTERRUPT TIMER 64T
;*
;*
;*
;*
RESET	=	1	;bits for consle switches
SELECT	=	2
PAUSE	=	8

RAM1	=	$1800	;FIRST SEGMENT OF MEMORY MINUS THE ZP,STACK, AND CHIPS
RAM2	=	$2100	;FIRST SEGMENT OF MEMORY MINUS THE ZP,STACK, AND CHIPS
RAM3	=	$2200	;FIRST SEGMENT OF MEMORY MINUS THE ZP,STACK, AND CHIPS
R1SIZE	=	($2040-RAM1)	;SIZE OF THE RAM1 BLOCK
R2SIZE	=	($2140-RAM2)	;SIZE OF THE RAM2 BLOCK
R3SIZE	=	($2800-RAM3)	;SIZE OF THE RAM3 BLOCK

	; .subttl	"system macros 7800"
;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;*	MARIA MACROS FOR EASIER GRAPHICS CONSTRUCTION	;*
;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;*
;*
;*this macro constructs a 4 byte header for display lists
;*
	.macro	header	address,palette,width,hpos
	dc.b	\address & $ff
	dc.b	(\palette;*$20) | ($1f & -\width)
	dc.b	\address >> 8
	dc.b	\hpos
	.endm
;
;this macro constructs a 5 byte header for display lists
;
	.macro	xheader	address,palette,width,hpos,wm,ind

	dc.b	\address & $ff
	dc.b	((\wm;*$80) | $40 | (\ind;*$20))
	dc.b	\address >> 8
	dc.b	((\palette;*$20) | ($1F & -\width))
	dc.b	\hpos
	.endm

;
;this macro constructs a end-of-display-list header
;
	.macro	nullhdr

	dc.b	0,0
	.endm

;
;this macro constructs a display list entry for the display list list
;
	.macro	display	dli,h16,h8,offset,address

	dc.b	((\dli;*$80) | (\h16;*$40) | (\h8;*$20) | \offset)
	dc.b	\address >> 8
	dc.b	\address & $ff
	.endm

;
;this macro loads a palette register with a color
;
	.macro	paint	palnum,colornum,color,lum

	lda	#(\color;*$10) | \lum
	sta	\bkgrnd | ((\palnum;*4) | (\colornum))
	.endm

;
;this macro writes to the crtl register
;
ckoff	=	$0	;normal color
ckon	=	$1	;kill the color

dmaoff	=	$3	;turn off dma
dmaon	=	$2	;normal dma

char1b	=	$0	;one byte character definition
char2b	=	$1	;two byte character definition

bcoff	=	$0	;black border
bcback	=	$1	;background colored border

kangoff	=	$0	;transparency
kangon	=	$1	;"kangaroo" mode : no transparency!

mode1	=	$0	;160x2 or 160x4 modes
modebd	=	$2	;320b or 320d modes
modeac	=	$3	;320a or 320c modes

	.macro	screen	ck,dma,cw,bc,km,mode
	lda	#((\ck;*$80) | (\dma;*$20) | (\cw;*$10) | (\bc;*8) | (\km;*4)|\mode)
	sta	CTRL
	.endm

	.macro	dppload	adr
	lda	#\adr & $ff
	sta	DPPL
	sta	sdppl
	lda	#\adr >> 8
	sta	DPPH
	sta	sdpph
	.endm

;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;	end of the system macros definitions		;*
;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*