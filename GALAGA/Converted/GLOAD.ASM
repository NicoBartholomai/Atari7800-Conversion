	processor 6502 
; JU
; MGG;GRAPHA.S,R:M1:$
; MGG;GRAPHB.S,R:M1:$
; MGG;GLOADER.S,R:$
; MGG;GMAIN.S,R:$
; MGG;GMIV.S,R:$
; MGG;GSCORE.S,R:$
; MGG;GDAC1.S,R:$
; MGG;GDAC2.S,R:$
; MGG;GDAC3.S,R:$
; MGG;GDAC4.S,R:$
; MGG;DOALL,R:M1:$
; MGG;SET,R:M1:$
; MGG;GAME.Z,R:$
 	    SEG     ROM
HEADER  ORG     $0000
        DC.B    1  ; 0   Header version     - 1 byte
        DC.B    "ATARI7800"     ; 1..16  "ATARI7800   "  - 16 bytes
        DS      7,32
        DC.B    "Your Name Here"; 17..48 Cart title      - 32 bytes
        DS      HEADER+49-.,0
		; Hack of changing the 256->code line to the $00,$00,$80,$00 code line
		; added by Aaron Lanterman, 9/4/2020, to stop assembler from complaining...
		; Basically, I'm telling it you have a 32K cartridge, but that doesn't
		; seem to break the emulator (at least)
		DC.B    $00,$00,$80,$00;
        ;DC.B    $00,$00,256->code,$00; 49..52 data length      - 4 bytes
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

	include GRAPHA1.ASM
	include GMAIN.ASM
	include GMIV.ASM
	include GSCORE.ASM
	include GDAC1_1.ASM
	include GDAC4_2.ASM
    include GRAPHA2.ASM
	include GLOADER1.ASM
	include GDAC4_3.ASM
	include GRAPHB.ASM
	include GDAC1_2.ASM
	include GDAC2.ASM
	include GDAC3.ASM
	include GDAC4_1.ASM
	include GLOADER2.ASM