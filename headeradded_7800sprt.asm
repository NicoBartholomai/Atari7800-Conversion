; Atari 7800 sprite sample
; Written by Daniel Boris (dboris@home.com)
;
; Assemble with DASM
;

	processor 6502

; ************ Hardware Adresses ***************************

INPTCTRL        equ     $01     ;Input control
AUDC0           equ     $15     ;Audio Control Channel 0
AUDC1           equ     $16     ;Audio Control Channel 1
AUDF0           equ     $17     ;Audio Frequency Channel 0
AUDF1           equ     $18     ;Audio Frequency Channel 1
AUDV0           equ     $19     ;Audio Volume Channel 0
AUDV1           equ     $1A     ;Audio Volume Channel 1
INPT0           equ     $08     ;Paddle Control Input 0
INPT1           equ     $09     ;Paddle Control Input 1
INPT2           equ     $0A     ;Paddle Control Input 2
INPT3           equ     $0B     ;Paddle Control Input 3
INPT4           equ     $0C     ;Player 0 Fire Button Input
INPT5           equ     $0D     ;Player 1 Fire Button Input

BACKGRND        equ     $20     ;Background Color
P0C1            equ     $21     ;Palette 0 - Color 1
P0C2            equ     $22     ;Palette 0 - Color 2
P0C3            equ     $23     ;Palette 0 - Color 3
WSYNC           equ     $20     ;Wait For Sync
P1C1            equ     $21     ;Palette 1 - Color 1
P1C2            equ     $22     ;Palette 1 - Color 2
P1C3            equ     $23     ;Palette 1 - Color 3
MSTAT           equ     $28     ;Maria Status
P2C1            equ     $29     ;Palette 2 - Color 1
P2C2            equ     $2A     ;Palette 2 - Color 2
P2C3            equ     $2B     ;Palette 2 - Color 3
DPPH            equ     $2C     ;Display List List Pointer High
P3C1            equ     $2D     ;Palette 3 - Color 1
P3C2            equ     $2E     ;Palette 3 - Color 2
P3C3            equ     $2F     ;Palette 3 - Color 3
DPPL            equ     $30     ;Display List List Pointer Low
P4C1            equ     $31     ;Palette 4 - Color 1
P4C2            equ     $32     ;Palette 4 - Color 2
P4C3            equ     $33     ;Palette 4 - Color 3
CHARBASE        equ     $34     ;Character Base Address
P5C1            equ     $35     ;Palette 5 - Color 1
P5C2            equ     $36     ;Palette 5 - Color 2
P5C3            equ     $37     ;Palette 5 - Color 3
OFFSET          equ     $38     ;Unused - Store zero here
P6C1            equ     $39     ;Palette 6 - Color 1
P6C2            equ     $3A     ;Palette 6 - Color 2
P6C3            equ     $3B     ;Palette 6 - Color 3
CTRL            equ     $3C     ;Maria Control Register
P7C1            equ     $3D     ;Palette 7 - Color 1
P7C2            equ     $3E     ;Palette 7 - Color 2
P7C3            equ     $3F     ;Palette 7 - Color 3

SWCHA           equ     $280    ;P0, P1 Joystick Directional Input
SWCHB           equ     $282    ;Console Switches
CTLSWA          equ     $281    ;I/O Control for SCHWA
CTLSWB          equ     $283    ;I/O Control for SCHWB

	SEG.U data


;******* Vairables ********************************

	org $40

xpos	ds.b	1	      	;X Position of sprite
ypos    ds.b    1            	;Y Position of sprite
temp    ds.b    1		
dlpnt	ds.w	1
dlend	ds.b	12		;Index of end of each DL




;**********************************************************
; Aaron Lanterman (1/30/2020) replaced this original line:
; SEG code
; With this big chunk of header code for the simulator:
;**********************************************************
 	    SEG     ROM
HEADER  ORG     code-128
        DC.B    1  ; 0   Header version     - 1 byte
        DC.B    "ATARI7800"     ; 1..16  "ATARI7800   "  - 16 bytes
        DS      7,32
        DC.B    "Your Name Here"; 17..48 Cart title      - 32 bytes
        DS      HEADER+49-.,0
        DC.B    $00,$00,256->code,$00; 49..52 data length      - 4 bytes
        DC.B    $00,$00  ; 53..54 cart type      - 2 bytes
    ;    bit 0 - pokey at $4000
    ;    bit 1 - supergame bank switched
    ;    bit 2 - supergame ram at $4000
    ;    bit 3 - rom at $4000
    ;    bit 4 - bank 6 at $4000
    ;    bit 5 - supergame banked ram
    ;    bit 6 - pokey at $450
    ;    bit 7 - mirror ram at $4000
    ;    bit 8-15 - Special
    ;   0 = Normal cart
        DC.B    1  ; 55   controller 1 type  - 1 byte
        DC.B    1  ; 56   controller 2 type  - 1 byte
    ;    0 = None
    ;    1 = Joystick
    ;    2 = Light Gun
        DC.B    0  ; 57 0 = NTSC 1 = PA
        DC.B    0  ; 58   Save data peripheral - 1 byte (version 2)
    ;    0 = None / unknown (default)
    ;    1 = High Score Cart (HSC)
    ;    2 = SaveKey
        ORG     HEADER+63
        DC.B    0  ; 63   Expansion module
    ;    0 = No expansion module (default on all currently released games)
    ;    1 = Expansion module required
        ORG     HEADER+100      ; 100..127 "ACTUAL CART DATA STARTS HERE" - 28 bytes
        DC.B    "ACTUAL CART DATA STARTS HERE"
; end of header code for the simulator added by Aaron Lanterman
 	
; Aaron Lanterman added "code" at the start of the next line (1/30/2020)	 
code    org     $8000           ;Start of code
        
START
	sei                     ;Disable interrupts
	cld                     ;Clear decimal mode
	

;******** Atari recommended startup procedure

	lda     #$07
	sta     INPTCTRL        ;Lock into 7800 mode
	lda     #$7F
	sta     CTRL            ;Disable DMA
	lda     #$00            
	sta     OFFSET
	sta     INPTCTRL
	ldx     #$FF            ;Reset stack pointer
	txs
	
;************** Clear zero page and hardware ******

	ldx     #$40
	lda     #$00
crloop1    
	sta     $00,x           ;Clear zero page
	sta	$100,x		;Clear page 1
	inx
	bne     crloop1

;************* Clear RAM **************************

        ldy     #$00            ;Clear Ram
        lda     #$18            ;Start at $1800
        sta     $81             
        lda     #$00
        sta     $80
crloop3
        lda     #$00
        sta     ($80),y         ;Store data
        iny                     ;Next byte
        bne     crloop3         ;Branch if not done page
        inc     $81             ;Next page
        lda     $81
        cmp     #$20            ;End at $1FFF
        bne     crloop3         ;Branch if not

        ldy     #$00            ;Clear Ram
        lda     #$22            ;Start at $2200
        sta     $81             
        lda     #$00
        sta     $80
crloop4
        lda     #$00
        sta     ($80),y         ;Store data
        iny                     ;Next byte
        bne     crloop4         ;Branch if not done page
        inc     $81             ;Next page
        lda     $81
        cmp     #$27            ;End at $27FF
        bne     crloop4         ;Branch if not

        ldx     #$00
        lda     #$00
crloop5                         ;Clear 2100-213F
        sta     $2100,x
        inx
        cpx     #$40
        bne     crloop5
        
;************* Build DLL *******************

; 20 blank lines

       	ldx	#$00                   
        lda     #$4F            ;16 lines
        sta     $1800,x  	      
        inx
        lda     #$21		;$2100 = blank DL
        sta	$1800,x
        inx
        lda     #$00
    	sta	$1800,x
    	inx                   
	lda     #$44            ;4 lines
	sta     $1800,x        
	inx
	lda     #$21
	sta	$1800,x
	inx
	lda     #$00
	sta	$1800,x
    	inx
        
; 192 mode lines divided into 12 regions

        ldy     #$00
DLLloop2                         
        lda     #$4F            ;16 lines
        sta     $1800,x        
        inx
        lda     DLPOINTH,y
        sta	$1800,x
        inx
        lda     DLPOINTL,y
    	sta	$1800,x
    	inx
        iny
        cpy     #$0D            ;12 DLL entries
        bne     DLLloop2


; 26 blank lines
                 
        lda     #$4F            ;16 lines
        sta     $1800,x  	      
        inx
        lda     #$21		;$2100 = blank DL
        sta	$1800,x
        inx
        lda     #$00
    	sta	$1800,x
    	inx                   
	lda     #$4A            ;10 lines
	sta     $1800,x        
	inx
	lda     #$21
	sta	$1800,x
	inx
	lda     #$00
	sta	$1800,x

    	
;***************** Setup Maria Registers ****************
	
        lda     #$18            ;DLL at $1800
	sta	DPPH
	lda	#$00
	sta	DPPL
	lda	#$18		;Setup Palette 0
	sta	P0C1
	lda	#$38
	sta	P0C2
	lda	#$58
	sta	P0C3
	lda	#$43		;Enable DMA
	sta	CTRL
	lda	#$00		;Setup ports to read mode
	sta	CTLSWA
	sta	CTLSWB
	
	lda	#$40		;Set initial X position of sprite
	sta	xpos
        
mainloop
	lda	MSTAT		;Wait for VBLANK
	and	#$80
	beq 	mainloop
	
	lda	SWCHA		;Read stick
	and	#$80		;Pushed Right?
	bne	skip1
	ldx	xpos		;Move sprite to right
	inx
	stx	xpos
skip1
	lda	SWCHA		;Read stick
	and 	#$40		;Pushed Left?
	bne 	skip2
	ldx 	xpos		;Move sprite to left
	dex
	stx 	xpos
skip2
        lda     SWCHA		;Read stick
        and     #$20		;Pushed Down?
        bne     skip3		
        ldx     ypos		;Move sprite down
        cpx	#176	
        beq	skip3		;Don't move if we are at the bottom
        inx
        stx     ypos	
skip3
        lda     SWCHA		;Read stick
        and     #$10		;Pushed Up?
        bne     skip4		
        ldx     ypos		;Move sprite up
        beq	skip4		;Don't move if we are at the top
        dex			
        stx     ypos
skip4

;********************** reset DL ends ******************
	
	ldx 	#$0C
	lda	#$00
dlclearloop
	dex
	sta	dlend,x
	bne	dlclearloop
	
	
;******************** build DL entries *********************

        lda     ypos		;Get Y position
   	and	#$F0		
   	lsr 			;Divide by 16
   	lsr	
   	lsr	
   	lsr	
   	tax
   	lda	DLPOINTL,x	;Get pointer to DL that this sprite starts in
   	sta	dlpnt
   	lda	DLPOINTH,x
   	sta	dlpnt+1
   	
   	;Create DL entry for upper part of sprite
   	
   	ldy	dlend,x		;Get the index to the end of this DL
   	lda	#$00				
	sta     (dlpnt),y	;Low byte of data address
	iny
	lda	#$40		;Mode 320x1
	sta     (dlpnt),y
	iny 
	lda	ypos		
	and	#$0F		
	ora	#$a0
	sta     (dlpnt),y
	iny
	lda	#$1F		;Palette 0, 1 byte wide
	sta     (dlpnt),y
	iny
	lda	xpos		;Horizontal position
        sta     (dlpnt),y
        sty	dlend,x
        
        lda	ypos
        and	#$0F		;See if sprite is entirely within this region
        beq	doneDL		;branch if it is
        
        ;Create DL entry for lower part of sprite 
        
        inx			;Next region
        lda	DLPOINTL,x	;Get pointer to next DL
   	sta	dlpnt
   	lda	DLPOINTH,x
   	sta	dlpnt+1
        ldy	dlend,x		;Get the index to the end of this DL
	lda	#$00				
	sta     (dlpnt),y
	iny
	lda	#$40		;Mode 320x1
	sta     (dlpnt),y
	iny 
	lda	ypos
	and	#$0F
	eor	#$0F
	sta	temp
	lda	#$a0
	clc
	sbc 	temp
	sta     (dlpnt),y
	iny
	lda	#$1F		;Palette 0, 1 byte wide
	sta     (dlpnt),y
	iny
	lda	xpos		;Horizontal position
	sta     (dlpnt),y
	sty	dlend,x
doneDL

;************** add DL end entry on each DL *****************************

	ldx	#$0C
dlendloop
	dex
	lda	DLPOINTL,x
	sta	dlpnt
	lda	DLPOINTH,x
   	sta	dlpnt+1
   	ldy 	dlend,x
   	iny
   	lda	#$00
   	sta	(dlpnt),y
   	txa
	bne 	dlendloop   	
   	
vbloop
	lda	MSTAT		;Wait for VBLANK to end
	and	#$80
	bne 	vbloop
	
	jmp     mainloop	;Loop

redraw
      

NMI
	RTI
	
IRQ
	RTI
	

;Pointers to the DLs

DLPOINTH
        .byte   $22,$22,$22,$22,$23,$23,$23,$23,$24,$24,$24,$24
DLPOINTL
        .byte   $00,$40,$80,$C0,$00,$40,$80,$C0,$00,$40,$80,$C0




;************** Graphic Data *****************************
        org $a000
        .byte     %00111100
        org $a100
        .byte     %00111100
        org $a200
        .byte     %01000010 
        org $a300
        .byte     %01000010 
        org $a400
        .byte     %10011001
        org $a500
        .byte     %10011001
        org $a600
        .byte     %10100101
        org $a700
        .byte     %10100101
        org $a800
        .byte     %10000001
        org $a900
        .byte     %10000001
        org $aA00
        .byte     %10100101
        org $aB00
        .byte     %10100101
        org $aC00
        .byte     %01000010
        org $aD00
        .byte     %01000010
        org $aE00
        .byte     %00111100
        org $aF00
        .byte     %00111100


;************** Cart reset vector **************************

	 org     $fff8
	.byte   $FF         ;Region verification
	.byte   $87         ;ROM start $4000
	.word   #NMI
	.word   #START
	.word   #IRQ


