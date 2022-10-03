	processor 6502 
;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;*								;*
;*		7800 Base Unit Rom Code				;*
;*	Modified Asteroids with a bit of O.S			;*
;*			16-May-88				;*
;*								;*
;*		Dave Staugas, programmer			;*
;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;*
;*
	include	"RASTDEF1.ASM"
	include "RASTDEF2.ASM"
	include	"STAMPS.ASM"
	include	"MAIN.ASM"
	include	"JOY.ASM"
	include	"FSM.ASM"
	include	"EXPLODE.ASM"
	include	"COLLIDE.ASM"
	include	"SCORE.ASM"
	include	"MORESTMP.ASM"
	include	"TUNES.ASM"
	include	"ROCKMOVE.ASM"
	include	"INIT.ASM"
	include	"UFO.ASM"
	include	"UTILS.ASM"
	include	"RASTLOAD.ASM"
	include	"TABLES.ASM"
	include	"OS7800.ASM"
;*
avail	equ	;*
;*
;*
	.org	$fffa
	DC.W	NMI
	DC.W	startup
	DC.W	IRQ
END