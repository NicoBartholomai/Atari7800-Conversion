	processor 6502 
          ORG     $A000
ENDA000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;                                           ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;  ARRAYS:  PUT RANDOM ARRAYS HERE SO       ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;           THEY CAN BE OVERLAPPED TO       ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;           SAVE ROOM.                      ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;                                           ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;                                           ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;                                           ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;                                           ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

          ORG     $C000
RANDROKS  DC.B      $29,$35,$64,$82,$8D,$9A,$A5,$C9

PALWBYTE  DC.B      $1E,$7E,$5E,$3F,$3E,$3C,$3A,$3E
          DC.B      $3C,$3A,$3C,$3E,$3B,$3C,$3D,$3E
          DC.B      $3F,$1C,$5E,$1D,$3F,$1E,$5E,$3E
          DC.B      $7E,$3E,$1E,$7E,$3E,$5E,$3F,$1D
          DC.B      $1C,$3E,$7E,$B0,$F0,$D0,$F0,$D0
          DC.B      $F0

DANIMIX   DC.B      4,9,9,4

CWALK     DC.B      1,$FF,1
MESGOFST  DC.B      89,123
MESGDPLY  DC.B      34
;         DC.B      38

; SNGLEN IS INDEXED BY SONG NUMBER.
; IT CONTAINS THE SONG LENGTH.
;  20 BYTES
ASNGLEN
SNGLEN    DC.B      38,16,26,26,1,8,8,5,9,15,20,8,5,14,6,7,12,15,14  ;,22



; SNGDM  IS INDEXED BY SONG NUMBER.
; IT CONTAINS THE DURATION. DURATION FOR 2 VOICE SONGS IS SAME BOTH VOICES.
;  20 BYTES
ASNGDM
SNGDM     DC.B      22,1,2,1,7,1,1,1,2,0,0,2,3,3,2,6,3,6,3,4


;*;*;*;*;*  FULL
ENDC000


          ORG     $C100
ROCKS     DC.B      $35,$B4,$9B,$00,$00
          DC.B      $23,$39,$8D,$B5,$00
          DC.B      $23,$6C,$BD,$94,$00
          DC.B      $43,$2B,$5C,$BD,$84
          DC.B      $63,$29,$3D,$BB,$A6
          DC.B      $28,$6B,$97,$B3,$00
          DC.B      $29,$52,$6D,$AC,$00
          DC.B      $54,$6D,$96,$B8,$00
          DC.B      $28,$3C,$7A,$72,$B6
          DC.B      $34,$72,$8C,$B8,$00
          DC.B      $33,$3B,$BC,$A6,$00
          DC.B      $39,$7B,$82,$CA,$00
          DC.B      $32,$29,$BA,$A3,$00
          DC.B      $32,$4B,$B9,$83,$00
          DC.B      $52,$39,$9A,$B4,$00
          DC.B      $53,$9B,$00,$00,$00    ;BONZO LEVEL 0
          DC.B      $3B,$00,$00,$00,$00    ;BONZO LEVEL 1

;* ADEATH: STAMP INDICES FOR DEATH ANIMATION.
ADEATH    DC.B      ZBLANK,SDEATH,HRDEATH3,HRDEATH2,HRDEATH1
          DC.B      ZBLANK,SDEATH,HLDEATH3,HLDEATH2,HLDEATH1


          ORG     $C15F
GENEJMP   DC.B      $4C,<DLIJMP,>DLIJMP
ENDC100



          ORG     $C200

ASNGLBF0
; SNGLBF0 IS INDEXED BY SONG NUMBER.
; IT CONTAINS THE LOW BYTE FOR FREQUENCY OF FIRST VOICE.
;  20 BYTES
SNGLBF0   DC.B      $00,<SNGCF0,<SNGDF0,<SNGDF0,<SNGNULLF
          DC.B      <SNG1F0,<SNG2F0,<SNG3F0
          DC.B      <SNG5F0,<SNG4F0,<SNG6F0,<SNG7F0
          DC.B      <SNG8F0,<SNG9F0,<SNG10F0,<SNG11F0
          DC.B      <SNG12F0,<SNG13F0,<SNG14F0    ;,<SNG15F0


ASNGLBF1
; SNGLBF1 IS INDEXED BY SONG NUMBER.
; IT CONTAINS THE LOW BYTE FOR FREQUENCY OF SECOND VOICE, IF THERE IS ONE.
; HIGH BYTE IS ASSUMED TO BE SNGHBF0.
;  20 BYTES
SNGLBF1   DC.B      <SNG15F0,0,<SNGDF1,<SNGDF1
          DC.B      0,<SNG1F1,0,<SNG3F1
          DC.B      0,0,0,0
          DC.B      <SNG8F1,<SNG9F1,0,0
          DC.B      <SNG12F1,<SNG13F1,<SNG14F1    ;,<SNG15F1


; SNGC0 IS INDEXED BY SONG NUMBER.
; IT CONTAINS THE VALUES FOR THE FIRST VOICE.
; 0 VALUE MEANS SPECIAL CASE - ROCK FALLING.
;  20 BYTES
ASNGC0
SNGC0     DC.B      <SNG15F1,$04,$D4,$D4,$00,$11,$0D,$47,$04,$04
          DC.B      $04,$00,$D4,$D4,$04,$04,$DD,$D4,$DD      ;,$D4



; SNGVV0 IS INDEXED BY SONG NUMBER.
; IT CONTAINS 0 IF THERE ARE SEPARATE VOLUME TABLES, OR VOLUME ITSELF.
;  20 BYTES
ASNGVV0
SNGVV0    DC.B      $D4,$03,$22,$22,$00,$33,$03,$33,$03,$00
          DC.B      $04,$07,$74,$34,$07,$05,$33,$44,$00,$44

SETDFAST  LDA     #DHFASTL
          STA     DHORSPDL
          LDA     #DHFASTH
          STA     DHORSPDH
          LDA     #DIGFAST
          STA     DIGSPEED
          RTS;                            ;15

HARPXPL   DC.B      $02,$FE;                ;          ,$00,$00
HARPYPL   DC.B      $00,$00,$FC,$04

;*;*;*;*;* 98 BYTES FULL
ENDC200



          ORG     $C300
; ROCKPUSH MUST IMMEDIATELY PRECEDE CALCINDX
ROCKPUSH  LDA     ROCKSX,X;               ;ENTRANCE POINT FROM FALL
          PHA
          LDA     ROCKSY,X
          SEC
          SBC     #12
          TAX
          PLA
;  EXPECTS X POSITION IN A, Y POSITION IN X.
;  RETURNS DIRT CHAR IN A, INDEX INTO DIRTMAP IN X.
;  USES TEMP.
CALCINDX  LSR
          LSR
          LSR
          STA     TEMP;                   ;COLUMN
          TXA
          LSR
          LSR
          TAX
          LDA     DIV3TAB,X
          TAX;                            ;ROW
          LDA     MAPLOW,X;               ;ROW ADDRESS
          CLC
          ADC     TEMP
          TAX;                            ;INDEX INTO DIRTMAP
          LDA     DIRTMAP,X
          RTS;                            ;34


;  USES X,A,Y.
;  EXPECTS DIRTMAP,X IN A.
;  USES TEMP.
;  ASSUMES NEVER CALLED WHEN A<36.
DIGGER    STA     TEMP;                   ;DIRTMAP,X
          JSR     BORE;                   ;FOUND IN FALL FILE
          CMP     #30;                    ;NEVER GOT HERE IF ALREADY < 30.
          BCS     DIGGER5
          LDA     #10;                    ;ADD PTS FIRST TIME <30.
          LDY     #0
          JSR     ADDSCORE
          LDX     TEMP;                   ;DON"T SLOW DOWN FOR HOURGLASS+BOWTIE
          CPX     #46
          BCS     DIGGER6
DIGGER3   LDA     #1;                     ;WANT HARPOON AND SLOW SPEED
          STA     DIGTEMP
          RTS
DIGGER5   CMP     TEMP;                   ;ANY CHANGE?
          BNE     DIGGER3
DIGGER6   RTS;                            ;32


CHKNXTD   CLC
          ADC     LASTMOVE
          TAY
          JSR     ADJUSTTO
          JSR     CALCINDX
          CMP     #36
          BCS     CHKNXTD2
          LDA     #0;                     ;DOES NOT AFFECT CARRY
          STA     DIGTEMP;                ;DOES NOT AFFECT CARRY
CHKNXTD2  RTS;                            ;19

;  USES X AND A.
;  RETURNS EQ IF ON ROW, NE IF NOT ON ROW.
ROWHERE   LDX     #15
          LDA     DDYPOS
CHKINROW  CMP     TOPZONE,X;              ;ARE WE ON A ROW BORDER?
          BEQ     ROWHERE2
          DEX
          BPL     CHKINROW
ROWHERE2  RTS;                            ;13

;*;*;* ??? BYTE LEFT...
ENDC300

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;                                         ;;;;;;;;;;;;;;;;;;;;;;
;*         ORG     $DFC0
;*;*;* THESE MUST BE ON SAME PAGE...
;*PINEDIFF  DC.B      29,29,29,29,29,29,29,29,15,8,13,4,0,15,15,11,4
;*          DC.B      29
;*BONZDIFF  DC.B      29,29,29,29,29,29,29,29        ;THIS ROW IS OVERLAPPED.
;*          DC.B      19,4,3,3,24,1,4,0,17
;*GAMENAME  DC.B      29,29,29,29,29,29,29,29,29     ;THIS ROW IS OVERLAPPED.
;*          DC.B      3,8,6,29,3,20,6,29,29,29,29,29
;*          DC.B      29,29,29,29,29
          ORG     $E0AA
;*;*;*;*;*  FROM FALL.S FILE
DISPTS    DC.B  THOUSND1,THOUS25,THOUS4,THOUS6
          DC.B  THOUS8,THOUS10,THOUS12,THOUS15


DOROCKL   DC.B      <RSLIP,<RTOTTER,<RFALL,<RBOTTOM
          DC.B      <RSPLIT,<RCRUMBL,<RPOINTS,<RFINISH

DOROCKH   DC.B      >RSLIP,>RTOTTER,>RFALL,>RBOTTOM
          DC.B      >RSPLIT,>RCRUMBL,>RPOINTS,>RFINISH

RKANIM    DC.B      SPLTROCK,CRMBROCK


;  DON"T USE THIS SUBR UNTIL SURE DIGDUG IS GOING TO ANIMATE.
;  USES X,A.
;  USES TEMP.
ANIM      LDA     ANIMCNT;                ;THERE ARE THREE STAMPS EACH DIRECTION
          SEC
          SBC     #1
          BPL     ANIM2
          LDA     #2
ANIM2     STA     ANIMCNT
          ASL
          ASL
          STY     TEMP
;*         CLC
          ADC     TEMP
          TAX
          LDA     DANIMS,X
          STA     DDINDX
          RTS

;*;*;*;*;*  FROM DDMOVE.S FILE
XFROMPL   DC.B      $00;                         ;      ,$08,$00,$00

XTOPL     DC.B      $08,$00,$00,$00,$08,$F8,$00,$00,$03,$FD,$00,$00
          DC.B      $10,$F8,$00,$00
          DC.B      $07,$F9,$00;                 ;      ,$00

; NOTE:  FLATPTS IS STORED AS HALF OF TRUE POINT VALUE
FLATPTS   DC.B      $00,$05,$50,$12,$00,$20,$00,$30
          DC.B      $00,$40,$00,$50,$00,$60,$00,$75

;*;*;*;*;* PAGE 83 BYTES FULL
ENDE0AA


          ORG     $E1AA
CTURNS    DC.B      124,47,4,71,255

HALFXFM   DC.B      <EAST5,<WEST5,<SOUTH7,<NORTH7
FROMXFM   DC.B      <HORLFT,<HORRGT,<VERTTOP,<VERTBOT
TOXFM     DC.B      <HORRGT,<HORLFT,<VERTBOT,<VERTTOP
ENTRXFM   DC.B      <EAST1,<WEST1,<SOUTH1,<NORTH1

HARPSTMP  DC.B      RHARPOON,LHARPOON,DHARPOON,UHARPOON

DANIMS    DC.B      RDIGDUG1,LDIGDUG1,DDIGDUG1,UDIGDUG1
          DC.B      RDIGDUG2,LDIGDUG2,DDIGDUG2,UDIGDUG2
          DC.B      RDIGDUG3,LDIGDUG3,DDIGDUG3,UDIGDUG3


VONE      DC.B      1,7,10;               ;   ,0
VBOUND    DC.B      0,0,11,11
VHALF     DC.B      5,3,4;               ;   ,6
VPRE2     DC.B      6,2,1,9;            ;MIGHT BE UNNECESSARY FOR HORIZONTAL
VPRE1     DC.B      7,1,0,10

WHNSPEED  DC.B      2,3,4,5;                ;   ,6

VPRE3     DC.B      6,2,2,8;            ;UNNECESSARY FOR HORIZONTAL
;*VPRE4     DC.B      6,2,3,7;            ;PROBABLY NOT NECESSARY

;*;*;*;*;*
; USES A,X.
ADJUSTTO  LDA     DDYPOS;                 ;CALC DIGDUG LEADING EDGE
          CLC
          ADC     YTOPL,Y
          TAX
          LDA     DDXPOS
          CLC
          ADC     XTOPL,Y
          RTS;                            ;14

MOREPUMP  LDA     MAXPUMP
          CLC
          ADC     #$04
          STA     MAXPUMP
          RTS

;*;*;*;*;* PAGE 86 BYTES FULL
ENDE1AA


          ORG     $E2AA

JOYSWCH   DC.B      $7F,$BF,$DF,$EF

BAR       DC.B      $20,$40;                ; S,W      BOUND TO NEXT PAGE!!!
          DC.B      $10,$90;                ; N,NE     BOUND TO PREVIOUS PAGE!!!
          DC.B      $30,$C0;                ; FILTER OUT ILLEGAL COMBINATIONS

FOO
          DC.B      $7F;                    ; E
FJOY      DC.B      $DF,$BF,$EF,$7F        ; S,W,N,E
          DC.B      $FF,$FF;                ; END OF FOO
REVSWCH
          DC.B      $BF,$7F,$EF,$DF
;*         DC.B      $BF,$7F,$EF,$DF
;*         DC.B      $BF


DIGSONG   CMP     #SNGD;                  ;RETURNS EQ IF DIGDUG MUSIC
          BEQ     DIGSONG2
          CMP     #SNGDF
DIGSONG2
          RTS;                            ;OVERLAPPED WITH FOLLOWING ARRAY!!!

;*ATTBOUND  DC.B      $60,$28,$20,$2F,$50    ;OVERLAPPED WITH PRECEDING SUBR!!!
;*         DC.B      $10,$28,$8F,$83
;*         DC.B      $10;                    ;OVERLAPPED WITH FOLLOWING ARRAY!!!

RKTIM     DC.B      $10,$10,$1E;            ;FROM FALL.S, OVERLAPPED!

; NOTE:  ONLY TOP BYTE IS STORED SINCE BOTTOM BYTE IS ALWAYS 0
;        INDEX OF 0 IS FOR TEDDYBEAR MODE
VEGPTS    DC.B      $02,$04,$06,$08,$10,$10
          DC.B      $20,$20,$30,$30,$40,$40
          DC.B      $50,$50,$60,$60,$70,$70
          DC.B      $80

FPOINTS   DC.B      VHUND2,VHUND4,VHUND6,VHUND8,VTHOUS1,VTHOUS1
          DC.B      VTHOUS2,VTHOUS2,VTHOUS3,VTHOUS3,VTHOUS4,VTHOUS4
          DC.B      VTHOUS5,VTHOUS5,VTHOUS6,VTHOUS6,VTHOUS7,VTHOUS7
          DC.B      VTHOUS8


HCARVE    LDA     #DLEFTEND
          STA     DIRTMAP,X;              ;CARVE OUT CENTER HORIZONTAL TUNNEL.
          LDA     #DHMIDDLE
          STA     DIRTMAP+1,X
          LDA     #DRHTEND
          STA     DIRTMAP+2,X
          RTS

;*;*;*;*;* PAGE 86 BYTES FULL
ENDE2AA


          ORG     $E3AA
;*;*;*;*;*  FROM MONSTER.S FILE
;-------- ROM TABLES

XTABLE    DC      $00,$00,$FF,$FF,$00,$00,$FF,$FF
          DC      $01,$01,$00,$00,$01,$01,$00;          ;     ,$00

YTABLE    DC      $00,$FF,$00,$FF,$01,$00,$01,$00
          DC      $00,$FF,$00,$FF,$01,$00,$01,$00

SPEEDTAB  DC      $EE;                    POOKA SLOW     12 BITS
          DC      $EE
          DC      $92;                    POOKA GHOST    5 BITS
          DC      $48
          DC      $7F;                    POOKA FAST     15 BITS
          DC      $FF
          DC      $95;                    POOKA GHOST    7
          DC      $4A
          DC      $F7;                    FYGAR SLOW     13 BITS
          DC      $77
          DC      $89;                    FYGAR GHOST    5
          DC      $24
          DC      $FF;                    FYGAR FAST     16 BITS
          DC      $FF
          DC      $A9;                    FYGAR GHOST    7
          DC      $54

;* FJOY: FAKE JOYSTICK MOVEMENTS FOR ROTATING SELECT OPTIONS WITH SELECT BUTTON.
;*FJOY      DC.B      $BF,$7F,$DF,$EF       ;USES REVSWCH INSTEAD.


RFALLTBL  DC.B      1,2,2,2,1,2,2

ANDF0     AND     #$F0
          BNE     NOTZERO1
          BCC     NOTZERO1
          LDA     #BLANK1;                ;BLANK STAMP.
;*         BEQ     ANDF0RTS
          RTS
NOTZERO1  LSR;                      ;GET INDEX INTO STAMP TABLE FOR THIS
          LSR;                      ;  DIGIT OF SCORE.
          LSR
;*         CLC
          ADC     #FULL0
ANDF0RTS  RTS


INITDIGS  LDY     #4
          LDA     #0
INITSNDD  STA     DURINDX0,Y;             ;TIME TO START DD MUSIC OVER
          DEY
          BPL     INITSNDD
          STY     DUNINDX0
          STY     DUNINDX1
          RTS

ENDE3AA


          ORG     $E4AA
FRUITAB   DC      TEDDY
          DC      CARROT,RUTABAGA,MUSHROOM,CUCUMBER,CUCUMBER
          DC      EGGPLANT,EGGPLANT,BELLPEPP,BELLPEPP,TOMATO
          DC      TOMATO,ONION,ONION,WATERMEL,WATERMEL,GALAXIAN
          DC      GALAXIAN,PINEAPPL      ;BETTY AND AVA-ROBIN WERE HERE!


DIRTABLE  DC.B      <DIRT0,<DIRT1,<DIRT2,<DIRT3,<DIRT4,<DIRT5
          DC.B      <DIRT6,<DIRT7,<DIRT8,<DIRT9,<DIRT10,<DIRT11
          DC.B      <DIRT12,<DIRT13,<DIRT14,<SKY15

MODETAB   DC.B      <DIGDIAG,<DIGVERT,<DIGHORIZ
          DC.B      <DIGVERT,<DIGHORIZ,<DIGDIAG
          DC.B      <DIGVERT,<DIGHORIZ


PRITES0   DC.B      RPUMP4,RPUMP8,RPUMP12,RPUMP16,RPUMP20,RPUMP24
;         ;                               ;FROM COLLISON.S

DDMIDDLE
          LDA     #DDMIDLY
          STA     DDYPOS
          LDA     #DDMIDLX
          STA     DDXPOS
          LDA     #RDIGDUG1
          STA     DDINDX
          RTS

;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                                                          ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*       GETRXY: TURN DIRTMAP INDEX INTO X AND Y COORDINATE.;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               RETURNS X IN A, Y IN X.                    ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
GETRXY
          PHP
          PHA;                            ;SAVE INDEX.
          LSR;                      ;Y IN TOP NIBBLE.
          LSR
          LSR
          LSR
          EOR     #$FF
          CLC
          ADC     #16
          TAX
          LDA     TOPZONE,X
          TAX
          PLA
          AND     #$0F
          ASL;                      ;MULTIPLY BOTTOM NIBBLE BY 8 FOR X.
          ASL
          ASL
          PLP
          RTS

ENDE4AA


          ORG     $E5AA
;*;*;*;*;*  FROM COLLISON.S FILE

;*;*;* PUMP TABLES: ARRANGED BY DIRECTION, THEN STAMP NUMBER.  STAMP 0 SHOULD
;*;*;*    ;          BE LOCATED AT X,Y POSITION OF UPPER LEFTMOST CORNER OF
;*;*;*    ;          PUMP.  STAMP 1 WILL BE AT X,(Y-12), AND STAMP 2 AT X,(Y-24).
;*;*;*    ;          READING ACROSS EACH VERTICAL TABLE GIVES THE APPROPRIATE STAMP
;*;*;*    ;          FOR PUMP LENGTHS 6,12,18,24,30,36; AND WIDTHS 4,8,12,16,20,24
;*;*;*    ;          FOR HORIZONTAL TABLES.  HORIZONTAL TABLES DO NOT EXIST FOR
;*;*;*    ;          STAMPS 1 AND 2 AS A HORIZONTAL PUMP IS ONLY ONE STAMP HIGH.
;*;*;*    ;          INSTEAD, ZBLANK WILL BE LOADED INTO APPROPRIATE STMPYPOS ENTRY.

PDOWNS2   DC.B      ZBLANK,ZBLANK;          ; ,ZBLANK,ZBLANK,DPUMP6,DPUMP12
PDOWNS1   DC.B      ZBLANK,ZBLANK;          ; ,DPUMP6,DPUMP12,DFULL6,DFULL12
PDOWNS0   DC.B      DPUMP6,DPUMP12,DFULL6,DFULL12,DFULL6,DFULL12

PUPS0     DC.B      UPUMP6,UPUMP12,UPUMP12,UPUMP12,UPUMP12,UPUMP12
PUPS2     DC.B      ZBLANK,ZBLANK;          ; ,ZBLANK,ZBLANK,UFULL6,UFULL12
PUPS1     DC.B      ZBLANK,ZBLANK,UFULL6,UFULL12,UFULL12,UFULL12

PLEFTS0   DC.B      LPUMP4,LPUMP8,LPUMP12,LPUMP16,LPUMP20,LPUMP24




BURSTPTS  DC.B      $05,$04,$03,$02
          DC.B      $10,$08,$06,$04

BPOINTS   DC.B      HUNDRED5,HUNDRED4,HUNDRED3,HUNDRED2
          DC.B      THOUSND1,HUNDRED8,HUNDRED6,HUNDRED4

BLWSTMPS  DC.B      LBPOOKA1,LBPOOKA2,LBPOOKA3,LBPOOKA4
          DC.B      RBPOOKA1,RBPOOKA2,RBPOOKA3,RBPOOKA4
          DC.B      LBFYGAR1,LBFYGAR2,LBFYGAR3,LBFYGAR4
          DC.B      RBFYGAR1,RBFYGAR2,RBFYGAR3,RBFYGAR4

SETPAL3   LDX     #2
PHAMSGC   LDA     #$84;                   ;USE PALETTE 3 FOR COLORS OF LETTERS.
          STA     P0C0SHAD+13,X
          DEX
          BPL     PHAMSGC
          RTS

SAVDUN    LDY     #6;                     ;SAVES CURRENT DIGDUG MUSIC INFO
SAVDUN2   LDA     CURINDX0,Y
          STA     DURINDX0,Y
          DEY
          BPL     SAVDUN2
          RTS
ENDE5AA


          ORG     $E6AA
;*;*;*;*;* FROM IGAMERAK.S
;* HEADERS FOR INITIAL SCORE LINE STAMPS: 4 EXTRA MEN PER PLAYER, PLAYER POINTER.
ISCORLIN  DC.B      <SCOREMAP,W1ZONE,>SCOREMAP,$B0,16
          DC.B      BLANK1,$3E,CSET1,24,BLANK1,$3E,CSET1,32,BLANK1,$3E,CSET1,40
          DC.B      BLANK1,$3E,CSET1,48,BLANK1,$3E,CSET1,56,FULL0,$3E,CSET1,64
          DC.B      BLANK1,$3E,CSET1,88,BLANK1,$3E,CSET1,96,BLANK1,$3E,CSET1,104
          DC.B      BLANK1,$3E,CSET1,112,BLANK1,$3E,CSET1,120,BLANK1,$3E,CSET1,128
          DC.B      BLANK1,$9E,CSET1,76
          DC.B      0,0


PUTTITLE  PHA
          JSR     SETDPLH
          PLA
          TAX
;*;*;*       JMP     PUTMPLAT
;*;*;*       RTS
PUTMPLAT  LDA     TEMPLATE,X
          STA     (DPLOW),Y
          DEX
          DEY
          CPY     #5
          BCS     PUTMPLAT
          RTS


WAITVBL   BIT     CTRLRD
          BPL     WAITVBL
          BIT     CTRLRD
          BPL     WAITVBL
          RTS

;*AREVSWCH  DC.B      $40,$80,$10,$20        ;USED IN DDMOVE
ENDE6AA


          ORG     $E7AA
;*DISPLAY LIST LISTS DLI BYTES: FIRST BYTE IS FOR ZONE 1 AT BOTTOM OF SCREEN,
;*         LAST BYTE FOR DUMMY ZONE AT TOP OF SCREEN
DLIBITS   DC.B      $4B,$4B,$4B,$4B,$4B,$CB,$4B,$4B,$4B,$CB,$4B,$4B,$4B,$CB
          DC.B      $CB,$4B,$4F,$47,$CC,$4B,$4B

;* LOW ADDRESSES FOR CHARACTER MAPS FOR EACH ZONE...
MAPLOW    DC.B      $EF,$E0,$D0,$C0,$B0,$A0,$90,$80,$70,$60,$50,$40,$30,$20,$10
;         DC.B      0
;* INITIAL PALETTE COLORS...;              ;OVERLAPS WITH ABOVE (BLACK = 0)
IPALETTE  DC.B      BLACK,DDBLUE,WHITE,BLACK
          DC.B      $34,$1A,$0E;            ;RED,YELLOW,WHITE
          DC.B      $30,$00,$44;            ;BROWN,BLACK,TAN
          DC.B      $D6,$24,$0E;            ;GREEN, ORANGE, WHITE
          DC.B      YELLOW,DDBLUE,$A0      ;NUMLIVES IN COL 3.
          DC.B      SKYBLUE,SKYBLUE,PL1COLR ;SCORE,VEGGIE
          DC.B      YELLOW,DDBLUE,PEBBLE1  ;DIRT0, DIRT2
          DC.B      $D4,SKYBLUE,$34        ;SKY,DIRT1,DIRT3

;*;*;*;*;* FROM INITDIRT.S
CRYOFST   DC.B      0,12,24,12,0,12,24,12



TITLCBOR  DC.B      124,47,4,255,124,4,255,255

SEQTAB    DC      <GPOOKA,<LPOOKA,<GFYGAR,<LFYGAR
          DC      <RPOOKA,<GPOOKA,<RFYGAR,<GFYGAR
;*;*;*;*;* PAGE 86 BYTES FULL
ENDE7AA


          ORG     $E8AA
;* COLORS FOR VEGGIES ARE ARRANGED AS FOLLOWS:
;*         CARROT,RUTABAGA,MUSHROOM,CUCUMBER,CUCUMBER,EGGPLANT,EGGPLANT,BELLPEPP
;*         BELLPEPP,TOMATO,TOMATO,ONION,ONION,WATERMELON,WATERMELON,GALAXIAN
;*         GALAXIAN,PINEAPPLE,TEDDYBEAR

VEGCOL1   DC.B      $D2,$1E,$3F,$F4,$F4,$50,$50,$D4
          DC.B      $D4,$32,$32,$26,$26,$34,$34,$74
          DC.B      $74,$D2,$16
VEGCOL2   DC.B      $34,$D6,$22,$D6,$D6,$52,$52,$3A
          DC.B      $3A,$D2,$D2,$1E,$1E,$D8,$D8,$1A
          DC.B      $1A,$1A,$1A
VEGCOL3   DC.B      $38,$EE,$04,$FC,$FC,$58,$58,$E8
          DC.B      $E8,$36,$36,$16,$16,$1A,$1A,$54
          DC.B      $54,$24,$14

TUNLDIR
          DC.B      $30,$08,$18,$18,$1C,$04,$06,$0E
          DC.B      $03,$0F,$0F,$01,$03,$07,$0F
          DC.B      $40,$80;                ;BONZO LEVELS 0,1.

RESPAL3   LDY     #2;                     ;RESTORE PALETTE 3: USE Y IN LOOP SO
PLAMSGC   LDA     IPALETTE+10,Y;          ;  X RETURNED FROM FREEZFRM WON"T
          STA     P0C0SHAD+13,Y;          ;  BE CLOBBERED.
          DEY
          BPL     PLAMSGC
          RTS
;*;*;*;*;* PAGE 86 BYTES FULL
ENDE8AA


          ORG     $E9AA
CRXOFST   DC.B      8,16,8,0,8,16,8       ;    ,0


ASNGHBF0
; SNGHBF0 IS INDEXED BY SONG NUMBER.
; IT CONTAINS THE HIGH BYTE FOR FREQUENCY OF FIRST VOICE.
;  20 BYTES
SNGHBF0   DC.B      $00,>SNGCF0,>SNGDF0,>SNGDF0,>SNGNULLF
          DC.B      >SNG1F0,>SNG2F0,>SNG3F0
          DC.B      >SNG5F0,>SNG4F0,>SNG6F0,>SNG7F0
          DC.B      >SNG8F0,>SNG9F0,>SNG10F0,>SNG11F0
          DC.B      >SNG12F0,>SNG13F0,>SNG14F0,>SNG15F0

PEBBCOLR  DC.B      PEBBLE0A,PEBBLE0B,PEBBLE0C,PEBBLE0D
          DC.B      PEBBLE1A,PEBBLE1B,PEBBLE1C,PEBBLE1D
          DC.B      PEBBLE2A,PEBBLE2B,PEBBLE2C,PEBBLE2D

CREATS
          DC.B      $47,$63,$A3,$4B,$65,$3C,$A9,$A3
          DC.B      $3C,$63,$47,$4E,$3C,$3A,$33
          DC.B      $87,$78;                ;BONZO LEVELS 0,1.

RANDCRET  DC.B      $AA,$E1,$55,$0F,$8D,$69,$2D,$96


;*;*;*;*;* FROM SELECT.S

;*;*;*;*;* FROM CHKDEATH.S
;*HSCARGS   DC.B      LCARTNUM,HCARTNUM,0,1,<GAMENAME,>GAMENAME
HSCARGS   DC.B      LCARTNUM,HCARTNUM,0,1,0,0
;*         DC.B      <BONZDIFF,>BONZDIFF,<HSCOREX,>HSCOREX
          DC.B      0,0,<HSCOREX,>HSCOREX
;*         DC.B      <LOGODLL,>LOGODLL,<SOUND,>SOUND,0
          DC.B      <LOGODLL,>LOGODLL,<HSCRTS,>HSCRTS,10

SETRACK1  LDA     #1
          STA     RACKNUM
          STA     RACKNUM+1
          RTS
;*;*;*;*;* 86 BYTES FULL
ENDE9AA


          ORG     $EAAA


;*;*;*;*;* FROM GENDPL.S
;*DISPLAY LIST POINTERS FOR TWO DISPLAY LISTS.
LDPPL     DC.B      <DPL0LIST,<DPL1LIST

;* ZONE SCAN LINE BOUNDARIES....
TOPZONE   DC.B      11,23,35,47,59,71,83,95,107,119,131,143,155,167,179,191,191


;*;*;*;*;* FROM TITLEPAG.S
TLISTSIZ  DC.B      5,5,5,5,5,5,5,5,5,13,5,5,33,33,5
;         DC.B      5;                      ;OVERLAPS
NUMBYTES  DC.B      5,1,1,0,0,1,2,0        ;OVERLAPS
          DC.B      1,4,0,0,2,1,0,0
          DC.B      0,7,0,7,0,6,1,3
          DC.B      3,1,8,0,0,2,2,5
          DC.B      15,8,7,0,2,3,3,2
;         DC.B      0;                      ;OVERLAPS
;* BLACK BOX HEADER...;                    ;OVERLAPS
BLAKBOX   DC.B      0,CSET1,$1A,BLACKBOX

LFLAMSEQ  DC      LFLAME4;                LEFT FLAME SMALL
          DC      LFLAME8;                LEFT FLAME 8 PIX
          DC      LFLAME16;               LEFT FLAME 16 PIX
          DC      LFLAME24;               LEFT FLAME 24 PIX (MAXIMUM)
RFLAMSEQ  DC      RFLAME4;                RIGHT FLAME SMALL
          DC      RFLAME8;                RIGHT FLAME 8 PIX
          DC      RFLAME16;               RIGHT FLAME 16 PIX
          DC      RFLAME24;               RIGHT FLAME 24 PIX (MAXIMUM)

ENDEAAA


          ORG     $EBAA
;* LOW AND HIGH ADDRESSES OF DISPLAY LISTS FOR EACH ZONE.
LISTTABL  DC.B      <L0Z0,<L0Z1,<L0Z2,<L0Z3,<L0Z4,<L0Z5,<L0Z6
          DC.B      <L0Z7,<L0Z8,<L0Z9,<L0Z10,<L0Z11,<L0Z12
          DC.B      <L0Z13,<L0Z14,<L0Z15,<L0Z0,<DUMMYDPL,<DUMMYDPL
          DC.B      <DUMMYDPL,<DUMMYDPL,<DUMMYDPL
LISTTBH0  DC.B      >L0Z0,>L0Z1,>L0Z2,>L0Z3,>L0Z4,>L0Z5,>L0Z6
          DC.B      >L0Z7,>L0Z8,>L0Z9,>L0Z10,>L0Z11,>L0Z12
          DC.B      >L0Z13,>L0Z14,>L0Z15,>L0Z0,>DUMMYDPL,>DUMMYDPL
          DC.B      >DUMMYDPL,>DUMMYDPL,>DUMMYDPL
LISTTBH1  DC.B      >L0Z0,>L1Z1,>L1Z2,>L1Z3,>L1Z4,>L1Z5,>L1Z6
          DC.B      >L1Z7,>L1Z8,>L1Z9,>L1Z10,>L1Z11,>L1Z12
          DC.B      >L1Z13,>L1Z14,>L1Z15,>L0Z0,>DUMMYDPL,>DUMMYDPL
          DC.B      >DUMMYDPL,>DUMMYDPL,>DUMMYDPL


BACKMAP
          LDX     #NUMZONES;              ;SET UP DISPLAY LIST FOR TITLE PAGE.
SETTBACK  JSR     SETDPLH
          LDY     #0;                     ;ZERO OUT DIRT BACKGROUND BY SETTING
          LDA     #$F0;                   ;  CHAR MAP TO POINT TO ZEROS.
          STA     (DPLOW),Y
          TYA
          LDY     #6
          STA     (DPLOW),Y
          DEX
          BNE     SETTBACK
          RTS
;*;*;*;*;*   86 BYTES FULL
ENDEBAA


          ORG     $EC00
          ORG     $ED00
          ORG     $EE00

          DC      $10,$18;                ; BOUND TO PREVIOUS PAGE!!!

;*;*;*;*;*  FROM MONSTER.S FILE
;-------- CHARACTER SEQUENCE VALUES

;  !!!! IF THESE STAMP ARRAYS ARE MOVED NEWSEQ IN MONSTER FILE MUST CHANGE !!!!
;POOKA ARRAYS MUST STAY TOGETHER AND ON SAME PAGE WITH FYGAR ARRAYS.
RPOOKA    DC      RPOOKA2,RPOOKA2,RPOOKA1,RPOOKA1,RPOOKA1
          DC      RPOOKA1,RPOOKA1,RPOOKA1,0
LPOOKA    DC      LPOOKA2,LPOOKA2,LPOOKA1,LPOOKA1,LPOOKA1
          DC      LPOOKA1,LPOOKA1,LPOOKA1,0
GPOOKA    DC      GPOOKA1,GPOOKA2,GPOOKA2,GPOOKA2        ;,0
TITLXPOS  DC.B      0,4,124,34,64,64,94,4,124  ;OVERLAPPED WITH ABOVE.

;FYGAR ARRAYS MUST STAY TOGETHER AND ON SAME PAGE WITH POOKA ARRAYS.
RFYGAR    DC      RFYGAR1,RFYGAR1,RFYGAR2,RFYGAR2
          DC      RFYGAR1,RFYGAR1,RFYGAR2,RFYGAR2,0
LFYGAR    DC      LFYGAR1,LFYGAR1,LFYGAR2,LFYGAR2
          DC      LFYGAR1,LFYGAR1,LFYGAR2,LFYGAR2,0
GFYGAR    DC      GFYGAR1,GFYGAR2,GFYGAR2,GFYGAR2        ;,0
TITLCDIR  DC.B      0,1,2,4,0,2,4,4        ;OVERLAPPED WITH ABOVE.
LOGODLL   DC.B      $CF,>DUMMYDPL,<DUMMYDPL
          DC.B      $4F,>DUMMYDPL,<DUMMYDPL
          DC.B      $43,>DUMMYDPL,<DUMMYDPL
          DC.B      $4B,>L0Z13,L0Z13P5
          DC.B      $4B,>L0Z12,L0Z12P5
          DC.B      $43,>DUMMYDPL,<DUMMYDPL
          DC.B      $4B,>L0Z9,L0Z9P5
          DC.B      $4C,>DUMMYDPL,<DUMMYDPL


;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                                                          ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*       DLI ROUTINES:  NMI VECTOR POINTS AT A RAM;          ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               LOCATION WHICH CONTAINS A JUMP TO          ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               THE NEXT DLI, DEPENDING ON THE             ;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               CURRENT POSITION ON THE SCREEN.            ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               THE DLI"S ARE ARRANGED AS FOLLOWS:         ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                                                          ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               DLISETUP   -   JUST BEFORE ZONE 0:         ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                              SETS ONSCREEN FLAG TO 1.    ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               DLISCORE   -   SCORE ZONE USES PALETTE 5,  ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                              SO THIS DLI RESETS PAL 5    ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                              FOR VEGGIE COLORS.          ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               DLISKY     -   SKY USES PALETTE 7, SO DLI  ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                              RESETS IT FOR DIRT LAYER 1. ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               DLIDIRT0   -   USES PALETTE 6; DLI RESETS  ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                              PALETTE 6 FOR DIRT LAYER 2. ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               DLIDIRT1   -   USES PALETTE 7; DLI RESETS  ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                              PALETTE 7 FOR DIRT LAYER 3. ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               DLIDIRT2   -   USES PALETTE 6; DLI RESETS  ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                              PALETTE 6 FOR DIRT LAYER 0. ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               DLIRESET   -   RESETS PALETTE 5 FOR SCORE. ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               DLIDIRT3   -   USES PALETTE 7; DLI RESETS  ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                              PALETTE 7 FOR SKY.          ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               DLIBOTOM   -   RESETS ONSCREEN TO 0.       ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;               DLIVBLNK   -   WAITS FOR VBLANK TO SYNC    ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                              DLI"S; RESTORES ORIGINAL    ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                              PALETTES.                   ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;                                                          ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*  NOTE: DLI ROUTINES MUST NOT BEGIN PAGE !!!!!;            ;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;*DLISETUP
;*         PHA
;*;*        LDA     #1;                     ;THIS DLI IS FOR THE DUMMY ZONE JUST
;*;*        STA     ONSCREEN;               ;  BEFORE ZONE 0.  IT SETS ONSCREEN
;*         LDA     #<DLISCORE;           ;  AND LOW BYTE OF ADDRESS OF NEXT DLI.
;*         STA     DLIVECT;                ;  EVENTUALLY, WE CAN OPTIMIZE THIS SO
;*;*        LDA     #>DLISCORE;           ;  THAT ALL DLI CODE IS ON SAME PAGE:
;*;*        STA     DLIVECT+1;              ;  THEN ONLY LOW BYTE NEED BE UPDATED.
;*         INC     FRMCNT
;*         INC     TITLETIM
;*         BNE     BYESETUP
;*         INC     SELCTIM
;*BYESETUP  PLA
;*         RTI

DLISETUP
          PHA
          TXA
          PHA;                            ;ZONE 0 DLI: SCORE/LIVES LINE.  THIS
          LDX     VEGCOLR;                ;  USES PALETTE 5, SO IT MUST RESET
          LDA     VEGCOLR+1;              ;  COLORS FOR VEGETABLES WHEN DONE.
;*         STA     WSYNC
          STA     WSYNC
          STX     P5C2
          STA     P5C1
          LDA     #<DLISKY
          BNE     DLIEND
;*         STA     DLIVECT
;*         LDA     #>DLISKY
;*         STA     DLIVECT+1
;*         PLA
;*         TAX
;*         PLA
;*         RTI

DLISKY
          PHA
          TXA
          PHA;                            ;SKY ZONE:  USES PALETTE 7, RESETS
          LDX     DRT1COLR;               ;  PALETTE 7 FOR USE IN DIRT LAYER 1.
          LDA     DRT1COLR+1
;*         STA     WSYNC
          STA     WSYNC
          STX     P7C1
          STA     P7C3
          LDA     #<DLIDIRT0
          BNE     DLIEND
;*         STA     DLIVECT
;*         LDA     #>DLIDIRT0
;*         STA     DLIVECT+1
;*         PLA
;*         TAX
;*         PLA
;*         RTI


DLIDIRT0
          PHA
          TXA
          PHA;                            ;DIRT LAYER 0: USES PALETTE 6, RESETS
          LDX     DRT2COLR;               ;  PALETTE 6 FOR USE IN DIRT LAYER 2.
          LDA     DRT2COLR+1
;*         STA     WSYNC
          STA     WSYNC
          STX     P6C1
          STA     P6C3
          LDA     #<DLIDIRT1
DLIEND    STA     DLIVECT
;*         LDA     #>DLIDIRT1
;*         STA     DLIVECT+1
          BNE     DLIEXIT
;*         PLA
;*         TAX
;*         PLA
;*         RTI


DLIDIRT1
          PHA
          TXA
          PHA;                            ;DIRT LAYER 1: USES PALETTE 7, RESETS
          LDX     DRT3COLR;               ;  PALETTE 7 FOR USE IN DIRT LAYER 3.
          LDA     DRT3COLR+1
;*         STA     WSYNC
          STA     WSYNC
          STX     P7C1
          STA     P7C3
          INC     FRMCNT
          ASL     SYNCFRAM
          BCC     STUFF
          INC     SYNCFRAM
STUFF     INC     TITLETIM
          BNE     ZYXWVU
          INC     SELCTIM
ZYXWVU    LDA     #<DLIVBLNK
          BNE     DLIEND
;*         STA     DLIVECT
;*         LDA     #>DLIDIRT3
;*         STA     DLIVECT+1
;*         PLA
;*         TAX
;*         PLA
;*         RTI


;*DLIDIRT3
;*         PHA;                            ;CLEARS ONSCREEN FLAG AND SETS DLI
;*         LDA     #0;                     ;  POINTER TO DLI FOR TOP OF SCREEN.
;*         STA     ONSCREEN
;*         LDA     #<DLIVBLNK
;*ZDLIRTI   STA     DLIVECT
;*         LDA     #>DLIVBLNK
;*         STA     DLIVECT+1
;*         PLA
;*         RTI

DLIVBLNK
          PHA
          TXA
          PHA
          TYA
          PHA
          LDY     #4
DLIWLOOP  STA     WSYNC
          DEY
          BPL     DLIWLOOP
ZDLIVBL   LDA     CTRLRD;                 ;WAIT FOR VBLANK TO SYNC DLI"S.
          BPL     ENDDLIV
          LDA     CTRLRD
          BPL     ENDDLIV
          JSR     DOCOLORS
          JSR     SOUND
          LDA     #<DLISETUP
          STA     DLIVECT
;*         LDA     #>DLISETUP
;*         STA     DLIVECT+1
ENDDLIV   PLA
          TAY
DLIEXIT   PLA
          TAX
          PLA
GENERTI   RTI

DLITOP    PHA
          LDA     #$50
          STA     CTRL
          LDA     #CSET1
          STA     CHARBASE
          INC     P0C0SHAD+27
          LDA     P0C0SHAD+27
          STA     WSYNC
          STA     P0C0+27
          LDA     #<DLIBOTM
          BNE     ZDLIRTI

DLIBOTM   PHA
          LDA     #$4B
          STA     CTRL
          LDA     #$39
          STA     CHARBASE
          LDA     #<DLITOP
ZDLIRTI   STA     DLIVECT
          PLA
          RTI
ENDDLI
;*;*;*;*;* THIS PAGE IS ??? BYTES FULL
ENDEE00
;;;;;;;;;;;;;;;;;  ORG: PUT STUFF HERE WHICH IS PAGE      ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;       BOUNDARY DEPENDENT.;               ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;                                         ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;                                         ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;                                         ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;                                         ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; PUT AN ORG HERE!!!
; WARNING!!! - DON"T BEGIN PAGE WITH F1 ARRAY.
;  THESE SOUND ARRAYS NEED 109 BYTES

ASNGDF0
SNGDF0    DC.B      $8F,$8F,$CF;                          ;26 BYTES
          DC.B      $8F,$8F,$8F,$8F
          DC.B      $8F,$8F,$CF
          DC.B      $8F,$8F,$8F,$32
          DC.B      $D1,$D1
          DC.B      $31,$32,$31,$2F
          DC.B      $D1,$D1
          DC.B      $31,$32,$31,$10


ASNGDF1
SNGDF1    DC.B      $CF,$CF;                              ;16 BYTES
          DC.B      $D0,$D0
          DC.B      $D1,$D1
          DC.B      $D2,$D2
          DC.B      $D3,$D3
          DC.B      $D3,$D3
          DC.B      $D4,$D4
          DC.B      $D2,$50




ASNG10F0
SNG10F0   DC.B      $12,$11,$10,$0F,$0D,$0F;              ;6 BYTES


ASNG11F0
SNG11F0   DC.B      $17,$14,$12,$17,$9F,$8D;               ;7 BYTES
          DC.B      $6F



ASNG15F0
SNG15F0   DC.B      $8F,$8F,$8F,$6F;                      ;22 BYTES
          DC.B      $72,$2F
          DC.B      $72,$2F,$2D
          DC.B      $92,$92,$72
          DC.B      $34,$77,$76
          DC.B      $7F,$36
          DC.B      $7F,$76
          DC.B      $94,$94,$54


ASNG15F1
SNG15F1   DC.B      $34,$32,$30,$2F;                      ;32 BYTES
          DC.B      $34,$2F,$34,$2F
          DC.B      $34,$2F,$34,$2F
          DC.B      $34,$2F,$34,$2F
          DC.B      $34,$2F,$34,$31
          DC.B      $94,$94,$94,$31
          DC.B      $34,$31,$34,$30
          DC.B      $34,$30,$34,$10


;*;*;*;*;*  THIS PAGE IS 109 BYTES FULL


;  FOLLOWING TWELVE  ARRAYS MUST OCCUR ON SAME PAGE - NEED 128 BYTES

SOUTH7    DC.B      36,38,40,42,28,46,20;          ;$FF,$FF,$FF,$FF,28,$FF,20
SOUTH1    DC.B      44,12,48,24,44,8,48

NORTH7    DC.B      36,38,22,42,44,46,20;          ;$FF,$FF,22,$FF,$FF,$FF,20
NORTH1    DC.B      40,6,40,18,48,2,48

WEST5     DC.B      36,38,40,26,44,10,48;          ;$FF,$FF,$FF,26,$FF,10,$FF
WEST1     DC.B      42,46,18,42,24,46,16

EAST5     DC.B      36,14,40,42,44,10,48;          ;$FF,14,$FF,$FF,$FF,10,$FF
EAST1     DC.B      38,38,6,46,12,46,4

VERTTOP   DC.B      0,2,4,6,0,2,4,6,16,18,20,22,16,18,20,30,32,34
TITLYPOS  DC.B      0,23,23,47,71,23,47,71,71,0,0,0,0,0,0,0,0
;         DC.B      0,0
VERTBOT   DC.B      0,0,4,4,8,8,12,12,16,16,20,20,24,24,28,30,32,34

HORRGT    DC.B      0,2,4,6,8,10,12,14,0,2,4,6,8,10,12,30,32,34
HORLFT    DC.B      0,2,0,2,8,10,8,10,16,18,16,18,24,26,24,30,32,34

FLAMPOS   DC      $04,$08;                PIXEL X-POS OFFSETS FOR FLAME
;  FROM MONSTER.S;                         BOUND TO NEXT PAGE!!!

ENDED00

;  PUT IN AN ORG HERE!!! - THIS PAGE IS 256 BYTES FULL.
;  WARNING!!! - DON"T BEGIN PAGE WITH F1 ARRAY.
ASNG7F0

SNG7F0    DC.B      $1E,$1C,$1E,$1C,$14,$15,$13    ;,$14      ;8 BYTES-1


ASNG2F0
SNG2F0    DC.B      $14,$12,$14,$13    ;,$0F,$0E,$0F,$0E      ;8 BYTES-4


;NOTE: IN 2600 THERE IS ALSO 0F,0E,0F,0E.....1F,1E,1F,1E
;      FOR A TOTAL OF 24 BYTES
ASNGCF0
SNGCF0    DC.B      $0F,$0E,$0F,$0E;                      ;16 BYTES-8
          DC.B      $0F,$0E,$0F,$0E
;         ;                     DC.B      $1F,$1E,$1F,$1E
;         ;                     DC.B      $1F,$1E,$1F,$1E

ASNG6F0
SNG6F0    DC.B      $1F,$1E,$1F,$1E,$1F,$1E,$1F,$1E      ;20 BYTES-5
          DC.B      $0F,$0E,$0F,$10,$11,$10,$0E     ;,$0D
          ;           ;          DC.B      $0E,$0F,$0E,$0F


ASNG14F0
SNG14F0   DC.B      $0D,$0E,$0F,$0E,$0F,$10,$0F,$10      ;14 BYTES
          DC.B      $11,$10,$11,$12,$33,$2C


ASNG5F0
SNG5F0    DC.B      $0B,$08,$06,$0B,$08,$06,$0B,$08  ;,$06  ;9 BYTES-1


ASNG14V0
SNG14V0   DC.B      $06,$06,$06,$05,$05,$05,$04,$04      ;14 BYTES
          DC.B      $04,$03,$03,$03,$02,$08


ASNG14F1
SNG14F1   DC.B      $0E,$0F,$10,$0F,$10,$11,$10,$11      ;14 BYTES
          DC.B      $12,$11,$12,$13,$34,$2D



ASNG14V1
SNG14V1   DC.B      $05,$05,$05,$04,$04,$04,$03,$03      ;14 BYTES
          DC.B      $03,$02,$02,$02,$01,$08



ASNG1F0
SNG1F0    DC.B      $1B,$18,$15,$14,$12,$10,$0E   ;,$0D      ;8 BYTES-1


ASNG7C0
SNG7C0    DC.B      $0D,$0D,$0D,$0D,$04,$04,$04,$04      ;8 BYTES


ASNG4V0
SNG4V0    DC.B      $0A,$0A,$0A,$0A;                      ;15 BYTES
          DC.B      $0A,$0A,$0A,$0A
          DC.B      $04,$04,$04,$04,$04,$04,$04


ASNG4F0
SNG4F0    DC.B      $9A,$99,$98,$97;                      ;15 BYTES-1
          DC.B      $96,$95,$94,$93
          DC.B      $32,$17,$18,$19,$1A,$1B     ;,$1C


ASNG1F1
SNG1F1    DC.B      $1C,$19,$16,$15,$13,$11,$0F    ;,$0E      ;8 BYTES-1


ASNG8F1
SNG8F1    DC.B      $0E,$11,$14,$18,$0E;                  ;5 BYTES


ASNG12F1
SNG12F1   DC.B      $20,$93,$93,$93;                       ;12 BYTES
          DC.B      $20,$93,$93,$93
          DC.B      $20,$93,$93,$13


ASNG12F0
SNG12F0   DC.B      $8F,$92,$91,$92;                       ;12 BYTES-1
          DC.B      $8E,$92,$91,$92
          DC.B      $8D,$92,$91       ;,$12


ASNG13F0
SNG13F0   DC.B      $12,$11,$10,$8F,$12,$91;               ;15 BYTES
          DC.B      $14,$92,$17,$94,$18,$17
          DC.B      $97,$2B,$17


ASNG9F1
SNG9F1    DC.B      $8B,$8F,$20,$8F;                      ;16 BYTES
          DC.B      $8B,$8F,$20,$8F
          DC.B      $8B,$8F,$20,$8F
          DC.B      $20,$8F,$8F,$0F

ASNG9F0
SNG9F0    DC.B      $97,$97,$9C,$97;                      ;14 BYTES-1
          DC.B      $94,$92,$91,$8F
          DC.B      $8D,$8D,$8D,$8D
          DC.B      $60      ;,$40



ASNG13F1
SNG13F1   DC.B      $40,$94,$00,$93;                       ;12 BYTES-1
          DC.B      $00,$92,$00,$90,$00,$8F
          DC.B      $40       ;,$0F



ASNG8F0
SNG8F0    DC.B      $0F,$12,$15,$19,$0F;                  ;5 BYTES


ASNG3F0
SNG3F0    DC.B      $30,$2F,$2E,$2D;                      ;5 BYTES
          DC.B      $2E


ASNG3F1
SNG3F1    DC.B      $8A,$8A,$8A,$8A;                      ;5 BYTES
          DC.B      $8A


SNGNULLF  DC.B      $60;                    ; 1 BYTE

FLAMTABL  DC      RFYGAR2,LFYGAR2
          DC      RFLAMFYG,LFLAMFYG
          DC      RFYGAR2,LFYGAR2
          DC      RFLAMFYG,LFLAMFYG

ENDEC00

