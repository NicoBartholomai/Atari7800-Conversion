	processor 6502 

;*  ANIMATE.S      THE MS PAC MAN ANIMATIONS


;*  START THE ANIMATIONS
ANIMATE   STA     ANWHICH;                ;STORE WHICH ANIMATION
          JSR     CLEARTUN
          JSR     CLRSCRN;                ;TURN OFF INDICATORS
          PFILL   SCREEN,#$00,#$04       ;ERASE SCREEN
;*         JSR     LOADDLST;               ;RE-LOAD DISPLAY LIST

          LDA     #WHITE;                 ;SET UP COLOR FOR WORDS
          LDY     #$18
ANLOOP0   STA     P0C3,Y
          DEY
          DEY
          DEY
          DEY
          BPL     ANLOOP0
          JSR     BARSOFF;                ;GET BLACK BARS OFF THE SCREEN

          JSR     ANITUNE;                ;START TUNE
          JSR     ANIWORDS;               ;PUT UP ACT

          PFILL   SCREEN,#$00,#$04       ;ERASE SCREEN

          LDX     ANWHICH
          LDA     ANASTART,X;             ;GET OFFSET INTO ANIMATION DATA
          STA     ANAOFF
          LDA     ANSSTART,X;             ;GET OFFSET INTO SEGMENT DATA
          STA     ANSOFF
          LDA     ANFRAMES,X;             ;GET NUMBER OF FRAMES PER TIC
          STA     ANFRM
          JSR     ANINEXT;                ;DO ANIMATION

ABOGLOOP  JSR     SEEBNORM
          LDA     TUNON;                  ;MAKE SURE TUNE OVER
          BNE     ABOGLOOP

          RTS


;*  START THE ANIMATION TUNE
ANITUNE   LDX     ANWHICH
          LDA     TUNE1,X
          JSR     DOTUNE
          LDA     TUNE2,X
          JMP     DOTUNE


;*  PUT THE INITIAL MESSAGE UP
ANIWORDS  LDA     ANWHICH
          CLC
          ADC     #$1B
          TAY
          JSR     WRTMESG;                ;WRITE THE ACT NUMBER

          LDA     ANWHICH
          CLC
          ADC     #$1E
          TAY
          JSR     WRTMESG;                ;WRITE THE MESSAGE

          LDX     #$02;                   ;SET UP BASE OF CLAPBOARD
AWLOOP2   LDA     ACTBASH,X
          STA     HPLIST+3,X
          LDA     ACTBASV,X
          JSR     VTOZO
          STA     VOLIST+3,X
          TYA
          STA     VZLIST+3,X
          LDA     ACTBASSL,X
          STA     SLLIST+3,X
          LDA     ACTBASSH,X
          STA     SHLIST+3,X
          STA     DOLIST+3,X
          DEX
          BPL     AWLOOP2

          JSR     AWUPSTMP;               ;WRITE UP CLAPBOARD
          LDA     #$40;                   ;DO A LITTLE WAIT
          JSR     AWWAIT

          JSR     AWDNSTMP;               ;WRITE DOWN CLAPBOARD
          LDA     #$10;                   ;DO A LITTLE WAIT
          JSR     AWWAIT

          JSR     AWUPSTMP;               ;WRITE UP CLAPBOARD
          LDA     #$30;                   ;DO A LITTLE WAIT
          JSR     AWWAIT

          RTS

;*  WAIT A BIT - VALUE OF RTLOCAL+1 IN A
AWWAIT    CLC;                            ;ADD IT TO PRESENT TIME
          ADC     RTLOCAL+1
          STA     TEMP16
AWWLOOP   JSR     SEEBNORM;               ;SEE IF ANYTHING TO DO
          LDA     TEMP16;                 ;SEE IF DONE YET
          CMP     RTLOCAL+1
          BPL     AWWLOOP
          RTS


;*  SET UP STAMPS FOR UP CLAPBOARD
AWUPSTMP  LDX     #$02;                   ;SET UP BASE OF CLAPBOARD
AULOOP    LDA     ACTUPH,X
          STA     HPLIST,X
          LDA     ACTUPV,X
          JSR     VTOZO
          STA     VOLIST,X
          TYA
          STA     VZLIST,X
          LDA     ACTUPSL,X
          STA     SLLIST,X
          LDA     ACTUPSH,X
          STA     SHLIST,X
          STA     DOLIST,X
          DEX
          BPL     AULOOP
          RTS


;*  SET UP STAMPS FOR DOWN CLAPBOARD
AWDNSTMP  LDX     #$02;                   ;SET UP BASE OF CLAPBOARD
ADLOOP    LDA     ACTDNH,X
          STA     HPLIST,X
          LDA     ACTDNV,X
          JSR     VTOZO
          STA     VOLIST,X
          TYA
          STA     VZLIST,X
          LDA     ACTDNSL,X
          STA     SLLIST,X
          LDA     ACTDNSH,X
          STA     SHLIST,X
          STA     DOLIST,X
          DEX
          BPL     ADLOOP
          RTS


;* SET UP THE STATE FOR AN ANIMATION SEGMENT AND DO IT
ANINEXT   JSR     ANICLEAR;               ;CLEAR THE OLD ANIMATIONS
          LDX     ANAOFF;                 ;LOAD IN A SET OF ANIMATIONS
          INC     ANAOFF
          LDA     ANCHARS,X;              ;NUMBER TO SET UP THIS TIME
          BNE     ANCONT
          RTS;                            ;ALL DONE

ANCONT    STA     TEMP0
          LDA     ANTICS,X;               ;SEE HOW MANY TICS TILL NEXT SEGMENT
          STA     ANCOUNT
          LDA     #$00;                   ;WILL USE ANSTATE FOR WHICH CHAR SLOT
          STA     ANSTATE

ANLOOP    LDY     ANSOFF;                 ;Y IS OFFSET INTO SEGMENT DATA
          LDX     ANSTATE;                ;X IS WHAT CHARACTER SLOT WE DEAL WITH
          LDA     #$01
          STA     A0ENABLE,X;             ;TURN THIS ONE ON
          LDA     ANIHPOS,Y;              ;STORE THE STAMP INFO
          BEQ     ANLJMP0;                ;IF 0 - LEAVE CURRENT HPOS
          STA     HPLIST,X
ANLJMP0   LDA     ANIVPOS,Y
          BEQ     ANLJMP1;                ;IF 0 - LEAVE CURRENT VPOS
          STA     A0VPOS,X;               ;STORE VPOS
ANLJMP1   LDA     ANICHAR,Y;              ;STORE STARTING CHARACTER
          STA     A0CHAR,X
          LDA     ANIHPDIF,Y;             ;STORE WHERE DELTAS TO POSITION ARE
          STA     A0HPDIF,X
          LDA     ANIVPDIF,Y
          STA     A0VPDIF,X
          LDA     ANIANDIF,Y;             ;AND ANIMATION SEQUENCE
          STA     A0ANDIF,X
          LDA     ANIPALET,Y;             ;SET COLORS
          TAY;                            ;Y IS NOW OFFSET INTO PALETTE INFO
          TXA;                            ;SET X TO 4;*CHAR NUMBER
          ASL;                      ;  THUS, INDEX INTO PALETTES
          ASL
          TAX
          LDA     ANPALET1,Y
          STA     P1C1,X
          LDA     ANPALET2,Y
          STA     P1C2,X
          LDA     ANPALET3,Y
          STA     P1C3,X

          INC     ANSTATE;                ;UPDATE STATE VARIABLES
          INC     ANSOFF
          DEC     TEMP0
          BNE     ANLOOP

          JSR     CHRCLEAR;               ;CLEAR SCREEN
          LDA     #$07
          STA     ANSTATE;                ;THIS WILL NOW BE 7,6,5,4,3,2,1,0,7,...


;* MAIN LOOP FOR THE CURRENT ANIMATION
ANIDOIT   JSR     ANIMOVE;                ;MOVE THEM ALL
          LDA     RTLOCAL+1;              ;WAIT FOR A BIT
          CLC
          ADC     ANFRM
          STA     TEMP16
ADWLOOP   JSR     SEEBNORM;               ;SEE IF ANY BUTTONS HIT
          LDA     TEMP16;                 ;SEE IF WAIT OVER YET
          CMP     RTLOCAL+1
          BNE     ADWLOOP

          DEC     ANCOUNT
          BNE     ANIDOIT
          JMP     ANINEXT;                ;TIME FOR NEXT READ


;*  MOVE THE ANIMATION CHARACTERS
ANIMOVE   LDX     #$05;                   ;MOVE THEM ALL
ANMLOOP   LDA     A0ENABLE,X
          BEQ     ANMNEXT
          JSR     ANIDISP;                ;SHOW THE ANIMATION
ANMNEXT   DEX
          BPL     ANMLOOP

          LDX     #$05;                   ;SET UP FOR WHICHEVER LOOP
          DEC     ANSTATE;                ;NEXT STATE
          BPL     ANMINC;                 ;SEE IF WRAP

          LDA     ANSTATE;                ;WRAP - GET ANSTATE BACK AGAIN
          AND     #$07
          STA     ANSTATE
ANMWLOOP  LDA     A0HPDIF,X;              ;AND WRAP THE OFFSETS BACK AGAIN
          SEC
          SBC     #$07
          STA     A0HPDIF,X
          LDA     A0VPDIF,X
          SEC
          SBC     #$07
          STA     A0VPDIF,X
          LDA     A0ANDIF,X
          SEC
          SBC     #$07
          STA     A0ANDIF,X
          DEX
          BPL     ANMWLOOP
          RTS

ANMINC    INC     A0HPDIF,X;              ;INCREMENT OUR OFFSETS
          INC     A0VPDIF,X
          INC     A0ANDIF,X
          DEX
          BPL     ANMINC
          RTS


;*  THIS ROUTINE MOVES A SINGLE ANIMATION FIGURE.  THE CHARACTER IS IN X, THIS
;*  MUST BE PRESERVED
ANIDISP   LDA     HPLIST,X;               ;MODIFY HPOS
          LDY     A0HPDIF,X;              ;INDEX FOR MODIFICATION
          CLC
          ADC     ANHPMOVE,Y;             ;MODIFICATION
          STA     HPLIST,X

          LDA     A0VPOS,X;               ;MODIFY VPOS
          LDY     A0VPDIF,X;              ;INDEX FOR MODIFICATION
          CLC
          ADC     ANVPMOVE,Y;             ;MODIFICATION
          STA     A0VPOS,X
          JSR     VTOZO;                  ;CONVERT IT TO ZONE AND COLUMN
          STA     VOLIST,X
          TYA
          STA     VZLIST,X

          LDA     A0CHAR,X;               ;MODIFY CHAR
          LDY     A0ANDIF,X;              ;INDEX FOR MODIFICATION
          CLC
          ADC     ANANMOVE,Y;             ;MODIFICATION
          STA     A0CHAR,X

          TAY;                            ;GET THE NEW STAMP
          LDA     #<MSCHAR;             ;OFFSET FROM THE BASE OF MSCHAR
          CLC
          ADC     CHAROFFL,Y
          STA     SLLIST,X
          LDA     #>MSCHAR
          ADC     CHAROFFH,Y
          STA     SHLIST,X
          STA     DOLIST,X;               ;AND TELL LOADER TO DISPLAY IT
          RTS


;*  CLEAR OUT THE ANIMATION THINGS
ANICLEAR  LDY     #$05
          LDA     #$00
ACLOOP    STA     A0ENABLE,Y
          DEY
          BPL     ACLOOP
          RTS


;*  CLEAR OUT THE CHARACTER THINGS
CHRCLEAR  LDY     #$05
          LDA     #OFFSCRN
CCLOOP    LDX     A0ENABLE,Y
          BNE     CCNEXT
          STA     HPLIST,Y
          STA     DOLIST,Y
CCNEXT    DEY
          BPL     CCLOOP
          RTS


;*  TUNES FOR THE ANIMATIONS
TUNE1     DC.B      2,4,8
TUNE2     DC.B      3,6,9

;*  TABLES FOR POSITIONS OF CLAPBOARD STAMPS
ACTBASH   ;                               ;HORIZONTAL POSITIONS
ACTUPH
ACTDNH    DC.B      $0E+LEFTSIDE,$16+LEFTSIDE,$1E+LEFTSIDE
ACTBASV   DC.B      $55,$55,$55;            ;VERTICAL POSITONS
ACTUPV    DC.B      $4A,$42,$3A
ACTDNV    DC.B      $51,$51,$51
ACTBASSL  DC.B      <CLAPBRD,<CLAPBRD+24,<CLAPBRD+48    ;STAMP LOW BYTE
ACTUPSL   DC.B      <CLAPBRDU,<CLAPBRDU+24,<CLAPBRDU+48
ACTDNSL   DC.B      <CLAPBRDD,<CLAPBRDD+24,<CLAPBRDD+48
ACTBASSH  DC.B      >CLAPBRD,>CLAPBRD+24,>CLAPBRD+48    ;STAMP HI BYTE
ACTUPSH   DC.B      >CLAPBRDU,>CLAPBRDU+24,>CLAPBRDU+48
ACTDNSH   DC.B      >CLAPBRDD,>CLAPBRDD+24,>CLAPBRDD+48


;*  OFFSET TABLES FROM CHARACTER INDEX TO OFFSET
CHAROFFL  DC.B      $00,$18,$30,$48,$60,$78,$90,$A8
          DC.B      $C0,$D8,$F0,$08,$20,$38,$50,$68
          DC.B      $80,$98,$B0,$C8,$E0,$F8,$10,$28
          DC.B      $40,$58,$70,$88,$A0,$B8,$D0,$E8
          DC.B      $00,$18,$30,$48,$60,$78,$90,$A8
          DC.B      $C0,$D8,$F0,$08,$20,$38,$50,$68
CHAROFFH  DC.B      $00,$00,$00,$00,$00,$00,$00,$00
          DC.B      $00,$00,$00,$01,$01,$01,$01,$01
          DC.B      $01,$01,$01,$01,$01,$01,$02,$02
          DC.B      $02,$02,$02,$02,$02,$02,$02,$02
          DC.B      $03,$03,$03,$03,$03,$03,$03,$03
          DC.B      $03,$03,$03,$04,$04,$04,$04,$04


;*  GLOBAL INFORMATION FOR ANIMATIONS
ANASTART  DC.B      $00,$07,$0F;            ;OFFSET INTO ANIMATION INFORMATION
ANSSTART  DC.B      $00,$16,$22;            ;OFFSET INTO ANIMATION SEGMENT INFO
ANFRAMES  DC.B      $01,$01,$02;            ;FRAMES PER TIC


;*  INFORMATION ABOUT EACH ANIMATION
ANTICS    DC.B      $DB,$4D,$0E,$18,$0C,$1D,$00    ;TICS PER ANIMATION SEGMENT
          DC.B      $22,$D6,$BE,$BE,$32,$38,$60,$00
          DC.B      $30,$20,$10,$30,$00
ANCHARS   DC.B      4,4,4,4,3,3,0;                  ;CHARACTERS PER ANIMATION
          DC.B      1,2,2,2,2,2,1,0
          DC.B      6,6,6,6,0


;*  INFORMATION ABOUT EACH ANIMATION SEGMENT
ANIHPOS   DC.B      $FF,$90,$E0,$B0;                ;STARTING HPOS
          DC.B      $91,$FE,$A5,$EA
          DC.B      $00,$00,$00,$00
          DC.B      $00,$00,$00,$00
          DC.B      $00,$00,$48
          DC.B      $00,$00,$00

          DC.B      $F0
          DC.B      $E0,$FF
          DC.B      $90,$B0
          DC.B      $E0,$FF
          DC.B      $90,$B0
          DC.B      $E0,$FF
          DC.B      $F0

          DC.B      $10,$20,$8E,$90,$98,$A0
          DC.B      $00,$00,$00,$00,$00,$00
          DC.B      $00,$00,$00,$00,$00,$00
          DC.B      $00,$00,$00,$00,$00,$00


ANIVPOS   DC.B      $60,$A0,$60,$A0;                ;STARTING VPOS
          DC.B      $80,$80,$80,$80
          DC.B      $00,$00,$00,$00
          DC.B      $00,$00,$00,$00
          DC.B      $00,$00,$28
          DC.B      $00,$00,$00

          DC.B      $00
          DC.B      $40,$40
          DC.B      $80,$80
          DC.B      $60,$60
          DC.B      $40,$40
          DC.B      $80,$80
          DC.B      $00

          DC.B      $80,$80,$40,$3E,$3E,$3E
          DC.B      $00,$00,$00,$00,$00,$00
          DC.B      $00,$00,$00,$00,$00,$00
          DC.B      $00,$00,$00,$00,$00,$00


ANICHAR   DC.B      $00,$12,$18,$1C;                ;STARTING CHARACTER
          DC.B      $06,$0C,$1C,$18
          DC.B      $09,$15,$1C,$18
          DC.B      $09,$15,$18,$1C
          DC.B      $06,$0C,$26
          DC.B      $08,$0E,$26

          DC.B      $00
          DC.B      $00,$0C
          DC.B      $06,$12
          DC.B      $00,$0C
          DC.B      $06,$12
          DC.B      $00,$0C
          DC.B      $00

          DC.B      $02,$0E,$27,$29,$2A,$2C
          DC.B      $02,$0E,$27,$29,$2A,$2C
          DC.B      $02,$0E,$27,$29,$2A,$2C
          DC.B      $02,$0E,$28,$29,$2A,$2C

ANIPALET  DC.B      $00,$00,$01,$02;                ;PALETTE
          DC.B      $00,$00,$01,$02
          DC.B      $00,$00,$01,$02
          DC.B      $00,$00,$01,$02
          DC.B      $00,$00,$00
          DC.B      $00,$00,$00

          DC.B      $00
          DC.B      $00,$00
          DC.B      $00,$00
          DC.B      $00,$00
          DC.B      $00,$00
          DC.B      $00,$00
          DC.B      $00

          DC.B      $00,$00,$03,$03,$03,$03
          DC.B      $00,$00,$03,$03,$03,$03
          DC.B      $00,$00,$03,$03,$03,$03
          DC.B      $00,$00,$00,$03,$03,$03

ANIHPDIF  DC.B      $10,$28,$18,$30;                ;CHANGES TO HPOS
          DC.B      $28,$10,$30,$18
          DC.B      $00,$00,$30,$18
          DC.B      $00,$00,$08,$20
          DC.B      $00,$00,$00
          DC.B      $00,$00,$00

          DC.B      $00
          DC.B      $18,$10
          DC.B      $28,$30
          DC.B      $18,$10
          DC.B      $48,$50
          DC.B      $40,$38
          DC.B      $00

          DC.B      $00,$00,$30,$30,$30,$30
          DC.B      $00,$00,$30,$30,$30,$30
          DC.B      $00,$00,$20,$30,$30,$30
          DC.B      $00,$00,$00,$30,$30,$30

ANIVPDIF  DC.B      $00,$00,$00,$00;                ;CHANGES TO VPOS
          DC.B      $00,$00,$00,$00
          DC.B      $08,$08,$00,$00
          DC.B      $08,$08,$10,$10
          DC.B      $00,$00,$00
          DC.B      $00,$00,$00

          DC.B      $00
          DC.B      $00,$00
          DC.B      $00,$00
          DC.B      $00,$00
          DC.B      $00,$00
          DC.B      $00,$00
          DC.B      $00

          DC.B      $00,$00,$00,$00,$20,$20
          DC.B      $00,$00,$18,$00,$20,$20
          DC.B      $00,$00,$10,$00,$20,$20
          DC.B      $00,$00,$00,$00,$20,$20

ANIANDIF  DC.B      $08,$08,$10,$10;                ;CHANGES TO ANIMATION CHARS
          DC.B      $08,$08,$10,$10
          DC.B      $08,$08,$10,$10
          DC.B      $08,$08,$10,$10
          DC.B      $08,$08,$00
          DC.B      $00,$00,$00

          DC.B      $00
          DC.B      $08,$08
          DC.B      $08,$08
          DC.B      $08,$08
          DC.B      $08,$08
          DC.B      $08,$08
          DC.B      $00

          DC.B      $00,$00,$00,$00,$18,$18
          DC.B      $00,$00,$00,$00,$18,$18
          DC.B      $00,$00,$00,$00,$18,$18
          DC.B      $00,$00,$00,$00,$18,$18


;*  PALETTE TABLES
ANPALET1  DC.B      YELLOW,RED,LTBLUE,YELLOW       ;PALETTES FOR STAMPS
ANPALET2  DC.B      PINK,WHITE,WHITE,BLUE
ANPALET3  DC.B      BLACK,BLUE,BLUE,WHITE


;*  HPOS MOVEMENT TABLES
ANHPMOVE  DC.B      0,0,0,0,0,0,0,0;                ;0 POSSIBLE MOVEMENTS FOR CHARS
          DC.B      1,0,1,0,1,0,1,0;                ;8
          DC.B      1,1,1,1,1,1,1,0;                ;10
          DC.B      1,1,1,1,1,1,1,1;                ;18
          DC.B      -1,0,-1,0,-1,0,-1,0;            ;20
          DC.B      -1,-1,-1,-1,-1,-1,-1,0         ;28
          DC.B      -1,-1,-1,-1,-1,-1,-1,-1        ;30
          DC.B      3,3,2,3,3,2,3,2;                ;38
          DC.B      3,3,3,3,3,3,3,3;                ;40
          DC.B      -3,-3,-2,-3,-3,-2,-3,-2        ;48
          DC.B      -3,-3,-3,-3,-3,-3,-3,-3        ;50


;*  VPOS MOVEMENT TABLES
ANVPMOVE  DC.B      0,0,0,0,0,0,0,0;                ;0 POSSIBLE MOVEMENTS FOR CHARS
          DC.B      -2,-2,-2,-2,-2,-2,-2,-2        ;8
          DC.B      -1,-1,0,0,1,1,0,0;              ;10
          DC.B      2,2,2,2,2,2,2,2;                ;18
          DC.B      0,0,-2,0,0,0,2,0;               ;20


;*  ANIMATION TABLES
ANANMOVE  DC.B      0,0,0,0,0,0,0,0;                ;0 MOVEMENTS FOR ANIMATIONS
          DC.B      0,1,0,1,0,-1,0,-1;              ;8
          DC.B      0,1,0,-1,0,1,0,-1;              ;10
          DC.B      0,0,1,0,0,0,-1,0;               ;18


END