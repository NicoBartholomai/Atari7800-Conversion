	processor 6502 
;GDAC4.S
;
;
;
;THIS TABLE IS A MOTION TABLE WHICH CAUSES A SHIP TO ENTER IN THE FIRST, FOURTH,
;AND FIFTH WAVES.  X AND ANGLE MUST BE NEGATED FOR HALF OF THE FIRST WAVE AND
;THE FIFTH WAVE.
;THERE ARE 110 ENTRIES.
;
MOTION1   DC.B      $F6,$04
          DC.B      $56,$04
          DC.B      $E5,$04,$E4,$04,$E4,$04,$E4,$04
          DC.B      $56,$E4,$C4,$E4,$C4,$E4
          DC.B      $C4,$E4,$C4,$E4,$C4,$E4,$C4,$E4,$C4,$E4
          DC.B      $C4,$E4,$C4,$E4,$C4,$F6,$E4
          DC.B      $E4,$E4,$04,$E4,$04,$46
          DC.B      $E4,$04,$E4,$04,$E4,$04,$E4,$04,$E4,$04
          DC.B      $E4,$04,$E4,$04,$E4,$26,$04,$E7,$04
          DC.B      $E4,$C6
          DC.B      $04,$27,$04,$24,$04,$36,$24
          DC.B      $44,$24,$44,$24,$24,$20,$24,$40
          DC.B      $27,$20,$24
          DC.B      $F6,$20
          DC.B      $26,$20,$3F,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $5C,$3C,$5C,$36,$3C,$1C,$3C
          DC.B      $66,$1C,$1F,$26,$1C
          DC.B      $3C,$1C,$3C,$A6
          DC.B      $1C,$02

;
;THIS IS THE TABLE WHICH CAUSES A SHIP TO ENTER IN THE SECOND AND THIRD WAVES.
;X AND ANGLE MUST BE NEGATED FOR THE THIRD WAVE.
;141 ENTRIES
MOTION2   DC.B      $3C,$20,$3C,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $3C,$20,$3C,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $3C,$20,$3C,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $3C,$20,$3C,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $3C,$3C,$3C,$20,$3C,$20,$3C,$3C,$3C,$20
          DC.B      $3C,$20
          DC.B      $F6,$3C
          DC.B      $46,$3C,$1C,$3C,$1C,$3C,$1C,$3F,$66,$1C
          DC.B      $FC,$1C,$FC,$26
          DC.B      $1C,$FC,$1C,$FF,$1C,$26,$FC,$E0
          DC.B      $FC,$E0,$E3,$86
          DC.B      $E0,$E7,$E0,$E4,$E0,$E4,$E0,$E4,$E0
          DC.B      $E4,$04,$E4,$04,$E4,$04,$E7,$86
          DC.B      $04,$27,$04,$24,$04
          DC.B      $24,$04,$24,$04,$26,$24,$20,$24,$20
          DC.B      $23
          DC.B      $A6,$20,$3F,$20,$3C,$20,$26,$3C,$1C
          DC.B      $3C,$1C,$3C,$1C,$3C,$1C,$3C,$1C,$3C
          DC.B      $46,$1C,$1F,$26,$1C,$3C,$1C
          DC.B      $3C
          DC.B      $C6,$1C,$02


;THIS TABLE IS A MOTION TABLE WHICH IS FOLLOWED BY AN ATTACKING BLUE SHIP.
;IT IS GONE THROUGH TWICE.
;THERE ARE TWO PARTS, ONLY THE SECOND PART IS REPEATED.
;THERE ARE A TOTAL OF 58 ENTRIES
;
BATBL1    DC.B      $FF,$1C,$DF,$FC,$C7,$E4,$E7
BATBL1B   DC.B      $F6,$04
          DC.B      $D6,$04
BATBL1A   DC.B      $56,$04,$24,$04,$27,$04
          DC.B      $24,$04,$24,$04,$26,$24,$00,$24,$00
          DC.B      $27,$20,$24,$66,$20
          DC.B      $24,$20,$25,$20,$24,$20,$24,$20,$24,$20
          DC.B      $24,$20,$24,$20,$28,$24,$28,$24,$24,$04
          DC.B      $24,$04,$25,$04,$24,$04,$02

;THIS TABLE INDEXED BY RACK TELLS HOW MANY MISSLES CAN EXIST AT A TIME
;DURING THE SPECIFIC RACK
;32 ENTRIES
NUMMIS    DC.B      53,47,48,46,48,49,49,46      ;46=0,47=1,ETC
          DC.B      49,49,49,46,49,50,50,46
          DC.B      48,49,49,46,49,49,50,46
          DC.B      49,49,49,46,50,50,51
          DC.B      46

;THESE TABLES ARE THE MOTION TABLES FOR BOSS ATTACK
;9 ENTRIES
BOTBL1    DC.B      $FF,$1C,$DF,$FC,$C7,$E4,$E7,$04,$02

;THIS IS A HSC GAMEPOLL ROUTINE
GAMEPOLL
          LDX     SWCHA
          INX
          BNE     FUCKYES;                YES, THERE IS AN INPUT
          LDA     SWCHB
          AND     #$03
          CMP     #$03
          BNE     FUCKYES;                YES, THERE IS AN INPUT
          LDA     INPT4
          AND     INPT5
          BPL     FUCKYES
          CLC;                            SIGNAL NO INPUT
          RTS
FUCKYES   SEC;                            SIGNAL INPUT FOUND
          RTS

; THIS TABLE IS COPIED INTO RAM WHEN HSC IS CALLED.  IT"S THE ARGUMENT BLOCK
;         NEEDED BY THE HSC.

HSCROM    DC.B      $86,$26;                ; CARTRIDGE ID NUMBER
          ;                               ; trailing zero bit set
          DC.B      $00;                    ; DIFFICULTY LEVEL
          ;                               ;  + PLAYER NUMBER (BOTTOM 2 BITS)
          DC.B      $00;                    ; CONTROLLER TYPE

          DC.B      0
          DC.B      0;                      ;USE ZEROS FOR GAMENAME
          DC.B      <DNAME0;            ; POINTER TO DIFFICULTY NAME
          DC.B      >DNAME0;              ;26 BYTES LONG
          DC.B      <HSCORE,>HSCORE  ; POINTER TO THE SCORE
          ;                               ;   WILL BE PL0SCORE OR PL1SCORE
          DC.B      <HSCDLL,>HSCDLL    ; DLIST LIST POINTER FOR LOGO

          DC.B      <TWINKEL,>TWINKEL ; TWINKLE ROUTINE

          DC.B      $04;                    ; SECONDS TO WAIT BEFORE RETURNING
          ;                               ;  (FOR EACH DIFFICULTY LEVEL)


DNTABL    DC.B      <DNAME0,<DNAME1,<DNAME2  ;NOVICE,ADVANCED,EXPERT
DNTABH    DC.B      >DNAME0,>DNAME1,>DNAME2
TWINKY    DC.B      $43,$50,$41,$48,$52,$50,$5D
END3      DC.B      $49


          ORG     $DF76
;COPYRIGHT GCC 1984
          DC.B      $47,$43,$43,$28,$63,$29,$31,$39,$38,$34

