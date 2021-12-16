
;

    PROCESSOR 6502
    INCLUDE "vcs.h"

    ORG $F000       ; Start of "cart area" (see Atari memory map)

StartFrame:
    lda #%00000010  ; Vertical sync is signaled by VSYNC's bit 1...
    sta VSYNC
    REPEAT 3        ; ...and lasts 3 scanlines
        sta WSYNC   ; (WSYNC write => wait for end of scanline)
    REPEND
    lda #0
    sta VSYNC       ; Signal vertical sync by clearing the bit

PreparePlayfield:   ; We'll use the first VBLANK scanline for setup
    lda #$00        ; (could have done it before, just once)
    sta ENABL       ; Turn off ball, missiles and players
    sta ENAM0
    sta ENAM1
    sta GRP0
    sta GRP1
    sta COLUBK      ; Background color (black)
    sta PF0         ; PF0 and PF2 will be "off" (we'll focus on PF1)...
    sta PF2
    lda #$AB        ; Playfield collor (yellow-ish)
    sta COLUPF
    lda #$00        ; Ensure we will duplicate (and not reflect) PF
    sta CTRLPF
    ldx #0          ; X will count visible scanlines, let's reset it
    REPEAT 37       ; Wait until this (and the other 36) vertical blank
        sta WSYNC   ; scanlines are finished
    REPEND
    lda #0          ; Vertical blank is done, we can "turn on" the beam
    sta VBLANK

Scanline:
    cpx #174        ; "HELLO WORLD" = (11 chars x 8 lines - 1) x 2 scanlines =
    bcs ScanlineEnd ;   174 (0 to 173). After that, skip drawing code
    txa             ; We want each byte of the hello world phrase on 2 scanlines,
    lsr             ;   which means Y (bitmap counter) = X (scanline counter) / 2.
    tay             ;   For division by two we use (A-only) right-shift
    lda Phrase,y    ; "Phrase,Y" = mem(Phrase+Y) (Y-th address after Phrase)
    sta PF1         ; Put the value on PF bits 4-11 (0-3 is PF0, 12-15 is PF2)
ScanlineEnd:
    sta WSYNC       ; Wait for scanline end
    inx             ; Increase counter; repeat untill we got all kernel scanlines
    cpx #191
    bne Scanline

Overscan:
    lda #%01000010  ; "turn off" the beam again...
    sta VBLANK      ;
    REPEAT 30       ; ...for 30 overscan scanlines...
        sta WSYNC
    REPEND
    jmp StartFrame  ; ...and start it over!

Phrase:
    .BYTE %00000000 ; H
    .BYTE %01000010
    .BYTE %01111110
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %00000000
    .BYTE %00000000 ; E
    .BYTE %01111110
    .BYTE %01000000
    .BYTE %01111100
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01111110
    .BYTE %00000000
    .BYTE %00000000 ; L
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01111110
    .BYTE %00000000
    .BYTE %00000000 ; L
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01111110
    .BYTE %00000000 ; O
    .BYTE %00000000
    .BYTE %00111100
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %00111100
    .BYTE %00000000
    .BYTE %00000000 ; white space
    .BYTE %00000000
    .BYTE %00000000
    .BYTE %00000000
    .BYTE %00000000
    .BYTE %00000000
    .BYTE %00000000
    .BYTE %00000000
    .BYTE %00000000 ; W
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %01011010
    .BYTE %00100100
    .BYTE %00000000
    .BYTE %00000000 ; O
    .BYTE %00111100
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %00111100
    .BYTE %00000000
    .BYTE %00000000 ; R
    .BYTE %01111100
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %01111100
    .BYTE %01000100
    .BYTE %01000010
    .BYTE %00000000
    .BYTE %00000000 ; L
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01000000
    .BYTE %01111110
    .BYTE %00000000
    .BYTE %00000000 ; D
    .BYTE %01111000
    .BYTE %01000100
    .BYTE %01000010
    .BYTE %01000010
    .BYTE %01000100
    .BYTE %01111000
    .BYTE %00000000 ; Last byte written to PF1 (important, ensures lower tip
                    ;                           of letter "D" won't "bleeed")

    ORG $FFFA             ; Cart config (so 6502 can start it up)

    .WORD StartFrame      ;     NMI
    .WORD StartFrame      ;     RESET
    .WORD StartFrame      ;     IRQ

    END