PROCESSOR 6502

YRES	EQU	192		; screen resolution
DLHIGH	EQU	16		; display list height
NUMDL	EQU	YRES/DLHIGH	; number of display lists
DLLEN	EQU
NUMSPR	EQU
DLIFLAG	DS	1
DLPTR	DS	2
DLTEMP	DS	1
DLIDX	DS	NUMDL

SPRYPOS	DS	NUMSPR		; sprite Y postion, 0 = top
SPRXPOS	DS	NUMSPR		; sprite X position, 0 = left
SPRIDX	DS	NUMSPR		; sprite table index
SPRPALW	DS	NUMSPR		; palette/width

DLNULL	DS	2		; null display list
DLLON	DS	(NUMDL+4)*3
DL00	DS	DLLEN
DL10	DS	DLLEN
DL20	DS	DLLEN
DL30	DS	DLLEN
DL40	DS	DLLEN
DL50	DS	DLLEN
DL60	DS	DLLEN
DL70	DS	DLLEN
DL80	DS	DLLEN
DL90	DS	DLLEN
DLA0	DS	DLLEN
DLB0	DS	DLLEN
DLC0	DS	DLLEN
DLD0	DS	DLLEN
DLE0	DS	DLLEN

; A flag in each DLL header causes an NMI when MARIA completes DMA for the 
; previous zone.  This can be used for a variety of things (changing colours,
; resolutions, scrolling backgrounds).  Here it is just used to signal when MARIA is
; done displaying the visible screen so the display lists can be updated.

DLLNMI	INC	DLIFLAG
IRQRTI	RTI

; Start routine (stub)

START	SEI			; disable IRQ
	CLD			; binary arithmetic
	LDA	#$67
	STA	INPTCTRL	; lock in 7800 mode
	STA	CTRL		; disable DMA
	LDX	#$FF
	TXS			; set stack pointer

; Missing: Initialize MARIA/TIA/RIOT registers and zero page variables

; Build the DLL automatically.

CPYDLL	LDY	#0		; copy DLL from ROM to RAM
	STY	DLNULL+1
1$	LDA	DLLTOP,Y	; copy top from ROM
	STA	DLLON,Y
	INY
	CPY	#DLLBOT-DLLTOP
	BNE	1$
	LDX	#0		; build active screen DLLs
2$	LDA	#$4F		; 16 high zone, 4K (16 line) holey DMA 
	STA	DLLON,Y
	INY
	LDA	DLPTRM,X
	STA	DLLON,Y
	INY
	LDA	DLPTRL,X
	STA	DLLON,Y
	INY
	INX
	CPX	#NUMDL
	BNE	2$
	LDX	#0
3$	LDA	DLLBOT,X	; copy bottom from ROM
	STA	DLLON,Y
	INY
	INX
	CPX	#DLLEND-DLLBOT
	BNE	3$

; Wait for VBLANK to start, turn on DMA, and fall into the display
; list builder routine.

MSTAT0	BIT	MSTAT		; wait for MARIA enabled
	BMI	MSTAT0
MSTAT1	BIT	MSTAT		; wait for MARIA disabled
	BPL	MSTAT1
	LDA	#%01000000	; color, DMA on, single char, black border, transparent, 160
	STA	CTRL


DLINI	LDA	#0		; skip over background tile headers
	LDX	#NUMDL
1$	STA	DLIDX-1,X	; reset end of list index
	DEX
	BNE	1$		; X = 0

DLCPY	LDA	SPRYPOS,X	; determine display list
	LSR			; Y / DLHIGH
	LSR
	LSR
	LSR
	TAY
	LDA	DLPTRL,Y	; display list lookup table
	STA	DLPTR
	LDA	DLPTRM,Y
	STA	DLPTR+1
	LDA	DLIDX,Y		; fetch end of list pointer
	STY	DLTEMP		; save for later
	TAY
	LDA	SPRIDX,X
	STA	(DLPTR),Y	; low address
	INY
	LDA	SPRPALW,X
	STA	(DLPTR),Y	; palette + width
	INY
	LDA	SPRYPOS,X
	AND	#$DLHIGH-1	; mask
	ORA	#>SPRDATA	; base address
	STA	(DLPTR),Y	; high address
	INY
	LDA	SPRXPOS,X
	STA	(DLPTR),Y	; horizontal position
	INY
	TYA			; update end of list pointer
	LDY	DLTEMP
	STA	DLIDX,Y
	CPY	#NUMDL-1	; bottom of screen?
	BEQ	1$
	INY
	LDA	DLPTRL,Y	; display list lookup table
	STA	DLPTR
	LDA	DLPTRM,Y
	STA	DLPTR+1
	LDA	DLIDX,Y		; fetch end of list pointer
	TAY
	LDA	SPRIDX,X
	STA	(DLPTR),Y	; low address
	INY
	LDA	SPRPALW,X
	STA	(DLPTR),Y	; palette + width
	INY
	LDA	SPRYPOS,X
	AND	#$DLHIGH-1	; mask
	ORA	#>SPRDATA-DLHIGH	; base address
	STA	(DLPTR),Y	; high address
	INY
	LDA	SPRXPOS,X
	STA	(DLPTR),Y	; horizontal position
	INY
	TYA			; update end of list pointer
	LDY	DLTEMP
	INY			; cheaper to increment again than STY
	STA	DLIDX,Y
1$	INX			; next sprite
	CPX	#NUMSPR
	BEQ	DLCPY

DLFIN	LDX	#NUMDL
	LDA	#0
1$	LDY	DLPTRL-1,X	; display list lookup table
	STY	DLPTR
	LDY	DLPTRM-1,X
	STY	DLPTR+1
	LDY	DLIDX-1,X	; end of display list index
	INY
	STA	(DLPTR),Y	; null header
	DEX
	BNE	1$

VWAIT	LDA	DLIFLAG
1$	CMP	DLIFLAG		; wait for end of visible screen
	BEQ	1$
	JMP	DLINI


DLLTOP	DC.B	$4B, >DLNULL, <DLNULL	; 12 raster
	DC.B	$0C, >DLNULL, <DLNULL	; +13 raster = 25 blank
DLLBOT	DC.B	$8C, >DLNULL, <DLNULL	; NMI, 13 raster
	DC.B	$0C, >DLNULL, <DLNULL	; +13 raster = 26 blank
DLLEND	EQU	.


DLPTRM	DC.B	>DL00, >DL10, >DL20, >DL30, >DL40, >DL50, >DL60, >DL70
	DC.B	>DL80, >DL90, >DLA0, >DLB0, >DLC0, >DLD0, >DLE0

DLPTRL	DC.B	<DL00, <DL10, <DL20, <DL30, <DL40, <DL50, <DL60, <DL70
	DC.B	<DL80, <DL90, <DLA0, <DLB0, <DLC0, <DLD0, <DLE0

SPRDATA	ORG	$E000		; sprite table
