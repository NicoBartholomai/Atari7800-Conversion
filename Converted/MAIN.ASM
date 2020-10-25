	processor 6502 
;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*

;*;*;*;*;*;*;*;*;*;*;*;                    3600 DIG DUG                       ;*;*;*;*;*;*;*;*;*;*;*;*;*

;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
MAIN
          SEI
          CLD
          LDA     #$17;                   ;LOCK 3600 MODE.
          STA     $1
          LDX     #STACK
          TXS
          LDA     #$7F
          STA     CTRL
          LDA     #0;                     ;UNFREEZE JOYSTICKS.
          STA     $1

          JSR     INIT;                   ;INIT DISPLAY LIST, VARIABLES, ETC.

          JSR     WAITVBL;                ;WE WANT TO SYNC OURSELVES WITH MARIA:
          LDA     #$50;                   ;  WAIT FOR VBLANK.
          STA     CTRL;                   ;ENABLE DMA.

PLAYTITL  JSR     TITLEPAG;               ;START OFF IN TITLE PAGE.


PLAYGAME
          LDA     SYNCFRAM
          BPL     PLAYGAME

DOCODE
          LDA     FRMCNT
          STA     AVAROBIN
;*         LDY     DOOMPTR+1
;*         CPY     #$A0
;*         BEQ     DOOMOVER
;*         LDY     #0
;*         STA     (DOOMPTR),Y
;*         INC     DOOMPTR
;*         BNE     DOCODE2
;*         INC     DOOMPTR+1
;*         BNE     DOCODE2
;*DOOMOVER  NOP
DOCODE2   INC     RACKTIME
          JSR     CHKDEATH;               ;CHKDEATH SHOULD PRECEDE CHKSTATE
          JSR     CHKSTATE
          JSR     CHKRACK

          LDA     DETHWISH
          BNE     DOFALL

          JSR     DDMOVE;                 ;DDMOVE SHOULD PRECEDE COLLISON
;         ;                               ; DDMOVE SHOULD PRECEDE ALL GAMEPLAY
          ;                               ;DDMOVE SHOULD PRECEDE PUMPER
          JSR     EATVEG;                 ;EATVEG SHOULD PRECEDE FRUITER
          JSR     MONSTERS;               ;INCLUDES PUMPER,FRUITER,FLAMER,FLAMCOL
          ;                               ;PUMPER SHOULD PRECEDE COLLISONS+FALL
          JSR     COLLISON

;*         LDA     DETHWISH;               ; PROBABLY NOT NECESSARY ANYMORE
;*         BNE     DOFALL

          JSR     BLOWUP
DOFALL    JSR     FALL

          JSR     GENDPL;                 ;GENERATE NEW DISPLAY LIST.

          LDA     FRMCNT;                 ;IF WE TOOK LONGER THAN ONE FRAME, GO
          CMP     AVAROBIN;               ;  BACK TO PLAYGAME TO EXECUTE AGAIN IN
;*         BEQ     WAIT1FRM
DOCODE4   BNE     PLAYGAME;               ;  CASE THE FRAME WE SKIPPED SHOULD
          ;                               ;  HAVE BEEN EXECUTED.

WAIT1FRM  CMP     FRMCNT;                 ;WE TOOK LESS THAN OR EQUAL TO ONE
          BEQ     WAIT1FRM;               ;  FRAME TO EXECUTE DOCODE.  WAIT FOR
          BNE     PLAYGAME;               ;  NEXT FRAME BEFORE CONTINUING.


;*         AND     #$07;                   ;DO STUFF 5 OUT OF 8 FRAMES
;*         BEQ     DOCODE
;*         CMP     #1
;*         BEQ     DOCODE
;*         CMP     #3
;*         BEQ     DOCODE
;*         CMP     #4
;*         BEQ     DOCODE
;*         CMP     #6
;*         BNE     PLAYGAME

;*         LDA     AVAROBIN
;*WAITARC   CMP     FRMCNT
;*         BEQ     WAITARC
;*         BNE     PLAYGAME
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
; end of header code for the simulator added by Aaron LantermanEND