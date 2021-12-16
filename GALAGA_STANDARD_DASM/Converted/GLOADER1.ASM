	processor 6502 
;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;*GLOADER.S
       ;    ORG     $B000;                  ;ORG AFTER GRAPHICS

ZERO      EQU     0
HUNDRED   EQU     $100

STARTUP   SEI;                            ; STARTUP CODE
          CLD
          LDX     #$FF
          TXS

          LDA     #$17
          STA     $01;                    ;LOCK INTO MARIA MODE

          STX     CTRLWT;                 ;TURN OFF DMA


          LDA     #0
          STA     $38;                    STORE ZERO INTO OFFSET
;         LDX     #$FF;                   ;ZERO OUT ZERO PAGE
ZEROLOP1  STA     ZERO,X
          DEX
          CPX     #$3F
          BNE     ZEROLOP1

;         LDA     #0;                   ; ZERO OUT ZERO PAGE
          TAY;                            SAVE A ZERO HERE
          STA     1;                      ;DECONFUSE 6532
          STA     INPT4
          STA     INPT5
          STA     CHARBASE
          STA     DUMYHDR
          STA     DUMYHDR+4
          STA     DUMYHDR+5
          STA     DUMYHDR+6
          STA     ZEROHDR
          STA     ZEROHDR+1
          LDA     #$40
          STA     DUMYHDR+1
          LDA     #$A0
          STA     DUMYHDR+2
          LDA     #$1F
          STA     DUMYHDR+3

; SET UP THE TWO DISPLAY LIST LISTS
;         LDY     #0
          LDA     #$48
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #>DUMYHDR
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #<DUMYHDR
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #$4F
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #>ZEROHDR
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #<ZEROHDR
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDX     #0
INITDLST  LDA     #$4B
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     LISTTBH1,X
          STA     DLSTLST1,Y
          LDA     LISTTBH2,X
          STA     DLSTLST2,Y
          INY
          LDA     LISTTABL,X
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          INX
          CPX     #16
          BMI     INITDLST
;NOW FINISH LAST TWO ZONES (OFF THE SCREEN)
          LDA     #$4F
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #>ZEROHDR
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #<ZEROHDR
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #$47
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #>ZEROHDR
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #<ZEROHDR
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #$CF
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #>ZEROHDR
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
          INY
          LDA     #<ZEROHDR
          STA     DLSTLST1,Y
          STA     DLSTLST2,Y
;*INITIALIZE COLOR PALETTES
          LDA     #0
          STA     INTIM;                  ;TEMPORARILY OUT OF ACTION
          STA     P0C0;                   ; MAKE THE SCREEN BLACK
          STA     SELECT;                 ;CLEAR SELECT MODE FLAG
          STA     RSTRTREG;               ;CLEAR RESTART MODE FLAG
          STA     LEVELSEL
          STA     TWOPLAYR
          STA     FARREN
          JSR     CLRSCORE;               ;CLEAR ALL SCORES
          LDX     #8
          LDY     #30
PLOOP     LDA     PTABL,Y
          STA     P0C1,Y
          DEY
          LDA     PTABL,Y
          STA     P0C1,Y
          DEY
          LDA     PTABL,Y
          STA     P0C1,Y
          DEY
          DEY
          DEX
          BNE     PLOOP
WGHTLOOP  LDA     CTRLRD;                ;WAIT FOR VBLANK OFF
          BMI     WGHTLOOP;               ;LOOP UNTIL VBLANK OFF
WGHTLOP2  LDA     CTRLRD;                 ;LOOP UNTIL VBLANK ON
          BPL     WGHTLOP2
          LDA     CTRLRD
          BPL     WGHTLOP2
          JSR     CLEARDL1;               CLEAR OUT DISPLAY LIST FIRST
          LDA     #<DLSTLST1
          STA     DPPL
          LDA     #>DLSTLST1
          STA     DPPH
          LDA     #$40
          STA     CTRLWT
;CONTINUE WITH REMAINDER OF INITIALIZATION
RESTART
          JSR     SCRAPALL
          LDA     #0
          LDX     #$FF;                   ;ZERO OUT ZERO PAGE
ZEROLOOP  STA     ZERO,X
          DEX
          CPX     #$3F
          BNE     ZEROLOOP
          JSR     INITCOLS
          LDA     #76
          STA     HEROX
          LDA     #20
          STA     ANIMATE
          STA     SELTIMER;               ;SELECT TIMER
          JMP     BEGIN

;HANDLER  IS CALLED BY THE DLI AT THE END OF THE VISIBLE SCREEN
HANDLER
          ; NO PERMINANT LOCAL VARIABLES
          ;TEMP VARIABLES
          ; LISTSIZ   DS 16
          ; ELISTPTR  DS 2     ZERO PAGE
          ; LTYPE     DS 1
          ; LY        DS 1
          ; LA        DS 1
          ; HEADER0   DS 1
          ; HEADER1   DS 1
          ; HEADER2   DS 1
          ; HEADER3   DS 1
          STA     SAVEB;                  ;THIS IS FOR LOOPING INTERRUPTS

          LDA     INHSC;                  ;SEE IF IN HIGH SCORE CART
          BEQ     NOTHSC
          CMP     #1;                     ;SEE IF FIRST DLI ON SCREEN
          BNE     SCNDDLI
          INC     INHSC
          LDA     #0
          STA     FLAP;                   ;PREVENT FLAPPING WHILE IN HSC
          LDA     #$40
          STA     CTRLWT;                 ;NEED $40 RATHER THAN THE $4B OF HSC
          BNE     YESHSC
SCNDDLI   LDA     #$4B
          STA     CTRLWT
          DEC     INHSC
          INC     BOOTLDR
          CLD;                            ;CLEAR DECIMAL MODE, JUST IN CASE
          LDA     #$FF
          STA     DLSPTR;                 ;USE FIRST DISPLAY LIST FOR GRAPHICS
          LDA     SAVEB
          STA     SAVEA
          STX     SAVEX
          STY     SAVEY
          JMP     DOHNDLER;               ;RUN THE HSC LOADER NOW

NOTHSC    LDA     PAUSE;                  ;SEE IF PAUSE
          BPL     NOPAUSE
          INC     FRAME;                  ;INC FRAME COUNTER
YESHSC    LDA     SAVEB
          RTI

NOPAUSE   LDA     BOOTLDR;                ;SEE IF SHOULD BOOT LDR
          BEQ     NBOOTLDR
          LDA     SAVEB
          RTI

NBOOTLDR
          LDA     SAVEB
          STA     SAVEA;                  ;THIS IS FOR LOOPING INTERRUPTS
          STX     SAVEX
          STY     SAVEY
          CLD;                            ;CLEAR DECIMAL MODE
          JSR     TUNER

;THIS SECTION FIGURES OUT THE STAR INC SPEED
          LDA     RACK
          CMP     #10
          BCC     SLOWSTAR
          CMP     #18
          BCS     FASTAR
          LDA     #1;                     ;SPEED IS 1 UNCONDITIONALLY
          STA     STRSPEED
          BNE     SETBOOT
SLOWSTAR  LDA     STRSPEED;               ;DEC STRSPEED UNTIL ZERO, THEN INC
          BEQ     INCSPD
          LDA     #0
          STA     STRSPEED
          BEQ     SETBOOT
INCSPD    LDA     #1
          STA     STRSPEED
          BNE     SETBOOT
FASTAR
          LDA     STRSPEED
          CMP     #2
          BPL     DECFSPD;                ;IF 2 OR GREATER, DEC STRSPEED
          LDA     #2
          STA     STRSPEED
          BNE     SETBOOT
DECFSPD   LDA     #1
          STA     STRSPEED
SETBOOT   INC     BOOTLDR;                ;INC FLAG FOR LOADER
          LDA     FRAME
          BMI     DOHNDLER
;THIS CODE UPDATES THE STAR POINTERS ONLY
          JSR     MOVSTARS
          JMP     UPSHIP;                 ;JUST UPDATE SHIP IF INSUF. TIME

MOVSTARS  LDA     THREECNT;               ;SEE IF TIME FOR NEW STAR
          CLC
          ADC     STRSPEED
          STA     THREECNT
          CMP     #3
          BCC     SSTAR1
          SEC
          SBC     #3
          STA     THREECNT
          DEC     STARPTR;                ;GO TO NEXT STAR
          BMI     SSTARRES
          RTS
SSTARRES  LDA     #$7F
          STA     STARPTR
SSTAR1    RTS

DOHNDLER
          LDA     #16;                    ;SAVE SPACE FOR THE STARS
          LDY     #15
LSTSIZLP  STA     LISTSIZ,Y
          DEY
          BPL     LSTSIZLP

          LDA     #0;                     ;ZEROS OUT SECOND LIST
          LDY     #8
LIST2LP   STA     LISTSIZ2,Y
          DEY
          BPL     LIST2LP

          LDA     INHSC
          BEQ     STARLDR
          JMP     LSTSZOUT;               ;IF IN HSC, DONT DO STARS

STARLDR   LDA     #16
          STA     TEMP6;                  ;GET SET FOR 16 ZONES
          LDA     #0
          STA     STARCNTR;               ;INC INTO HSTAR
          LDA     #4
          STA     FOURCNT;                ;FOUR STARS PER ZONE
          LDY     #0
          LDA     #<S1L1;               ;SAME AS S2L1
          STA     LISTPTR
          BIT     DLSPTR
          BPL     SUSES2
          LDA     #>S1L1
          BNE     SUSES3
SUSES2    LDA     #>S2L1
SUSES3    STA     LISTPTR+1
          JSR     MOVSTARS
STAR1     LDA     STARPTR
          CLC
          ADC     STARCNTR
          BVC     STAR3
STAR2     AND     #$7F;                   ;BOOT THE SIGN BIT
STAR3     TAX;                            ;X NOW HAS OFFSET INTO HSTAR
          LDA     #<STARGRAF
          STA     (LISTPTR),Y
          INY
          LDA     #$DF
          STA     (LISTPTR),Y;            ;PALLET 0, WIDTH 1
          INY
          LDA     #>MARIA2
          CLC
          ADC     THREECNT
          STA     (LISTPTR),Y
          INY
          LDA     HSTAR,X
          STA     (LISTPTR),Y
          INY
          INC     STARCNTR
          LDA     THREECNT
          CLC
          ADC     #3
          STA     THREECNT
          DEC     FOURCNT
          BNE     STAR1
          LDA     THREECNT
          SEC
          SBC     #12
          STA     THREECNT
          DEC     TEMP6;                  ;SEE IF ALL ZONES DONE
          BEQ     LSTSZOUT;               ;GO TO NEXT ROUTINE
          LDA     LISTPTR
          CLC
          ADC     #DLSIZE
          STA     LISTPTR
          LDA     LISTPTR+1
          ADC     #0
          STA     LISTPTR+1
          LDY     #0
          LDA     #4
          STA     FOURCNT
          JMP     STAR1
LSTSZOUT
          LDA     #71;                     ;SET POINTER TO THE FIRST ENEMY DATA
          STA     TEMP6
          TAY
LREADL    ;                               ;READ THE ENEMY DATA
          LDA     TYPE,Y
          AND     #$7F
          BNE     DOREAD;                 ;IF THE TYPE IS ZERO THE ENEMY IS
XXX       DEC     TEMP6;                  ;NOTHING
          LDY     TEMP6
          BPL     LREADL
          JMP     DONENMY
DOREAD    CMP     #6
          BEQ     XXX
          STA     LTYPE
          LDA     XCORD,Y
          STA     HEADER3;                ;HORIZONTAL POSITION
          LDA     YCORD,Y;                ;VERTICAL POSITION
          CMP     #192
          BCS     XXX
DLFKJ     STA     LY
          LDA     ANGLE,Y;                ;ANGLE
          CPY     #65
          BPL     DLFKK
          AND     #$07
          STA     LA;                     ;DON"T ROUND OFF ANGLE IF Y>64
          ;                               ; OR FLAP
          LDA     FLAP;                   ; FIND THE LOW BYTE FOR THE STAMP
          LSR
          BCC     NOFLAP;                 ;FLAP ONLY IF THE ANGLE IS ZERO
          LDA     LA
          BNE     NOFLAP
          LDA     #8
DLFKK     STA     LA
NOFLAP    LDX     LTYPE
          LDA     PALWDT,X;               ;PALLET AND WIDTH
          STA     HEADER1
          LDA     TYPTOLT,X
          CLC
          ADC     LA
          TAX
          LDA     LSTPTBL,X
          STA     HEADER0;                ;LOW BYTE OF STAMP ADDRESS
SZLP      LDA     LY
          LSR
          LSR
          TAX
          LDA     DIV3,X
          TAX;                            ;X NOW HAS CURRENT ZONE
          LDY     LISTSIZ,X
          CPY     #77;                    ;NEED ROOM FOR ONE MORE HDR
          BCC     CONT
          LDY     LISTSIZ2,X;             ;USE SECOND LIST
CONT      LDA     TEMP6
          CMP     #65
          BCC     CONT1
          LDA     LY
          SEC
          SBC     ZOFF,X
          CLC
          ADC     #$C0;                   ;NEXT GRAPHICS AT $C000
          JMP     CONT2
CONT1     LDA     LY
          SEC
          SBC     ZOFF,X
          CLC
          ADC     #>MARIA2
CONT2     STA     HEADER2
          LDA     LISTTABL,X;             ;GET POINTER TO THE ZONES LIST
          STA     LISTPTR
          LDA     LISTTBH1,X
          BIT     DLSPTR
          BMI     LUST1
          LDA     LISTTBH2,X
LUST1     STA     LISTPTR+1
          LDA     HEADER0;                ;STORE THE HEADER
          STA     (LISTPTR),Y
          INY
          LDA     HEADER1
          STA     (LISTPTR),Y
          INY
          LDA     HEADER2
          STA     (LISTPTR),Y
          INY
          LDA     HEADER3
          STA     (LISTPTR),Y
          INY
          LDA     LISTSIZ,X;             ;SEE IF USING LIST 2
          CMP     #77
          BCC     LUST4
          TYA
          STA     LISTSIZ2,X;             ;STORE NEW LIST SIZE
          BNE     CROSSB1
LUST4     TYA
          STA     LISTSIZ,X;              ;INCREMENT THE OFFSET
CROSSB1   LDA     TEMP6;                  ;SEE IF WORD
          CMP     #65
          BCS     XXXX
          LDA     HEADER2;                ;SEE IF GOES TO NEXT ZONE
          CMP     #$A3;                   ;GRAPHICS ORG"D AT $A000
          BCC     XXXX
          CPX     #$F
          BEQ     XXXX
          SEC
          SBC     #$C
          STA     HEADER2
          INX
          LDY     LISTSIZ,X
          CPY     #77
          BCC     LUST3
          LDY     LISTSIZ2,X
LUST3     LDA     LISTTABL,X;             ;GET POINTER TO THE ZONES LIST
          STA     LISTPTR
          LDA     LISTTBH1,X
          BIT     DLSPTR
          BMI     LUST2
          LDA     LISTTBH2,X
LUST2     STA     LISTPTR+1
          LDA     HEADER0;                ;STORE THE HEADER
          STA     (LISTPTR),Y
          INY
          LDA     HEADER1
          STA     (LISTPTR),Y
          INY
          LDA     HEADER2
          STA     (LISTPTR),Y
          INY
          LDA     HEADER3
          STA     (LISTPTR),Y
          INY
          LDA     LISTSIZ,X
          CMP     #77
          BCC     LUST5
          TYA
          STA     LISTSIZ2,X
          BNE     XXXX
LUST5     TYA
          STA     LISTSIZ,X;              ;INCREMENT THE OFFSET
XXXX      JMP     XXX
DONENMY   LDX     #$FF
          LDA     INHSC;                  ;SEE IF IN HSC
          BNE     ZHSCLEND
          LDA     RLOGO
          BNE     LPFZ0
ZHSCLEND  JMP     LEND
LPFZ0     LDY     LISTTABL+0
          STY     LISTPTR
          LDY     LISTTBH1+0
          BIT     DLSPTR
          BMI     LZL10
          LDY     LISTTBH2+0
LZL10     STY     LISTPTR+1
SLOADER   INX
          CPX     #16
          BEQ     PUTRACK
          LDA     SCORE,X
          CMP     #$A
          BEQ     SLOADER
          ASL
          CLC
          ADC     #<DIGIT
          STA     HEADER0
          LDA     #$9E;                   ;NUMBERS ON FIRST GRAPHICS PAGE
          ADC     #0
          STA     HEADER2
          LDA     #$7E;                   ;PALETTE AND WIDTH
          STA     HEADER1
          LDA     GETXSC,X
          STA     HEADER3
          LDY     LISTSIZ+0
          CPY     #77
          BCC     OVER1
          LDY     LISTSIZ2+0
OVER1
          LDA     HEADER0
          STA     (LISTPTR),Y
          INY
          LDA     HEADER1
          STA     (LISTPTR),Y
          INY
          LDA     HEADER2
          STA     (LISTPTR),Y
          INY
          LDA     HEADER3
          STA     (LISTPTR),Y
          INY
          TYA
          LDY     LISTSIZ+0
          CPY     #77
          BCC     OVER2
          STA     LISTSIZ2+0
          BCS     OVER3
OVER2     STA     LISTSIZ+0
OVER3     JMP     SLOADER
;*PUT UP RACK NUMBER HERE
PUTRACK   LDY     LISTTABL+15
          STY     LISTPTR
          LDY     LISTTBH1+15
          BIT     DLSPTR
          BMI     LZL11
          LDY     LISTTBH2+15
LZL11     STY     LISTPTR+1
          LDA     GASTONHK;               ;BCD RACK NUMBER
          AND     #$0F;                   ;BOOT HIGH NIBBLE
          STA     TEMP8+1;                ;ONES DIGIT
          LDA     GASTONHK
          LSR
          LSR
          LSR
          LSR
          STA     TEMP8;                  ;TENS DIGIT
OUTRLOP
;         LDA     TEMP8
          BEQ     OUTRAL
          ASL
          CLC
          ADC     #<DIGIT
          STA     HEADER0
          LDA     #$9E;                   ;1ST GRAPHICS PAGE
          ADC     #0
          STA     HEADER2
          LDA     #$7E
          STA     HEADER1
          LDA     #142
          STA     HEADER3
          LDY     LISTSIZ+15
          LDA     HEADER0
          STA     (LISTPTR),Y
          INY
          LDA     HEADER1
          STA     (LISTPTR),Y
          INY
          LDA     HEADER2
          STA     (LISTPTR),Y
          INY
          LDA     HEADER3
          STA     (LISTPTR),Y
          INY
          STY     LISTSIZ+15
OUTRAL    LDA     TEMP8+1
          ASL
          CLC
          ADC     #<DIGIT
          STA     HEADER0
          LDA     #$9E;                   ;FIRST GRAPHICS PAGE
          ADC     #0
          STA     HEADER2
          LDA     #$7E
          STA     HEADER1
          LDA     #150
          STA     HEADER3
          LDY     LISTSIZ+15
          LDA     HEADER0
          STA     (LISTPTR),Y
          INY
          LDA     HEADER1
          STA     (LISTPTR),Y
          INY
          LDA     HEADER2
          STA     (LISTPTR),Y
          INY
          LDA     HEADER3
          STA     (LISTPTR),Y
          INY
          STY     LISTSIZ+15
INDLOAD
          LDX     PLAYER
          LDA     LIVES,X
          TAX
          DEX
          BEQ     BEAMLOAD
PUTIND    LDA     #>MARIA2
          STA     HEADER2
          LDA     #<HEROS
          STA     HEADER0
          LDA     #$1E
          STA     HEADER1
          LDA     INDX,X
          STA     HEADER3
          LDY     LISTSIZ+15
          CPY     #77;                    SEE IF HAVE EXCEEDED DISPLAY LIST SIZE
          BCC     LSTLINOK
          LDY     LISTSIZ2+8;             USE SECOND LIST OF SIZES
LSTLINOK  LDA     HEADER0
          STA     (LISTPTR),Y
          INY
          LDA     HEADER1
          STA     (LISTPTR),Y
          INY
          LDA     HEADER2
          STA     (LISTPTR),Y
          INY
          LDA     HEADER3
          STA     (LISTPTR),Y
          INY
          LDA     LISTSIZ+15;             SEE IF LIST HAS BEEN EXCEEDED
          CMP     #77
          BCC     LASTLNOK
          STY     LISTSIZ2+8
          BNE     LASTLNOQ
LASTLNOK  STY     LISTSIZ+15
LASTLNOQ  DEX
          BNE     PUTIND
BEAMLOAD  LDA     WAITCNT;                ;GRAB WAITCNT
          BEQ     BEAM4;                  ;IF ZERO, GO TO NEXT ROUTINE
          CMP     #120
          BCS     BEAM1
          LDA     WAITCNT
          STA     WAITCNT3;               ;THIS IS THE ZONE OFFSET
          JMP     BEAM2
BEAM1     LDA     #181
          SEC
          SBC     WAITCNT
          STA     WAITCNT3
BEAM2     LDA     #0;                     ;FIRST DISPLAY ALL FULL ZONES
          STA     ZOFFSET;                ;CLEAR ZOFFSET
          LDX     #11;                    ;SET INDEX TO ZONE 12
BEAM3     LDA     WAITCNT3
          SEC
          SBC     #12
          BCC     NEWZONE
          STA     WAITCNT3
          LDA     ZOFFSET
          CLC
          ADC     #12
          STA     ZOFFSET;                ;ADVANCE OFFSET TO NEXT ZONE
          LDA     #12
          STA     WAITCNT2
          JSR     DISPLAYZ
          INX
          CPX     #15
          BEQ     BEAM4;                  ;ALL ZONES DISPLAYED
          JMP     BEAM3
NEWZONE   LDA     WAITCNT3;               ;SEE IF NEW ZONE NEEDED
          BEQ     BEAM4
          CLC
          ADC     ZOFFSET
          STA     ZOFFSET;                ;SET ZOFFSET FOR LAST DISPLAY
          LDA     WAITCNT3;               ;GET OFFSET INTO LAST ZONE
          STA     WAITCNT2
          JSR     DISPLAYZ;               ;NOW DISPLAY NEW ZONE
BEAM4     JMP     LEND
DISPLAYZ  LDA     LISTTABL,X
          STA     LISTPTR
          LDA     LISTTBH1,X;             ;GET HIGH @ BYTE
          BIT     DLSPTR;                 ;FIND CURRENT DISPLAY LIST
          BMI     OTHERLST
          LDA     LISTTBH2,X;             ;GET OTHER HIGH @ BYTE
OTHERLST  STA     LISTPTR+1;              ;NOW LISTPTR POINTS TO THE DISPLAY
          ;                               ;LIST OF THE CURRENT ZONE
          LDA     #<LSHIELD;            ;LOW @ FOR LEFT SHIELD
          STA     HEADER0
          LDY     ZOFFSET;                ;GET TABLE OFFSET
          LDA     BMWIDTH,Y;              ;GET CURRENT BEAM WIDTH
          ORA     #$80;                   ;USE PALETTE 4
          STA     HEADER1
          LDA     #>MARIA2
          SEC
          SBC     #12
          CLC
          ADC     WAITCNT2
          STA     HEADER2
          STA     HEADER6;                ;HIGH @ FOR RIGHT SHIELD
          LDA     CAPTUREX
          SEC
          SBC     XCORDOFF,Y
          STA     HEADER3
          LDA     #<RSHIELD
          STA     HEADER4
          LDA     #$9F;                    ;PALETTE AND WIDTH
          STA     HEADER5
          LDA     CAPTUREX
          CLC
          ADC     XCORDOFF,Y
          CLC;                            ;IN CASE OF NEGATIVE NO.
          ADC     #4
          STA     HEADER7
;ALL HEADERS LOADED, NOW STORE IN DISPLAY LIST
          LDY     LISTSIZ,X
          LDA     HEADER0
          STA     (LISTPTR),Y
          INY
          LDA     HEADER1
          STA     (LISTPTR),Y
          INY
          LDA     HEADER2
          STA     (LISTPTR),Y
          INY
          LDA     HEADER3
          STA     (LISTPTR),Y
          INY
          LDA     HEADER4
          STA     (LISTPTR),Y
          INY
          LDA     HEADER5
          STA     (LISTPTR),Y
          INY
          LDA     HEADER6
          STA     (LISTPTR),Y
          INY
          LDA     HEADER7
          STA     (LISTPTR),Y
          INY
          TYA
          STA     LISTSIZ,X;              ;RESET LIST SIZE FOR CURRENT ZONE
          RTS
LEND      LDA     #0;                     ; PUT TWO ZEROS AT THE ENDS OF THE
          LDX     #15;                    ; LISTS
LPFZ      LDY     LISTTABL,X
          STY     LISTPTR
          LDY     LISTTBH1,X
          BIT     DLSPTR
          BMI     LZL1
          LDY     LISTTBH2,X
LZL1      STY     LISTPTR+1
          LDY     LISTSIZ,X
          STA     (LISTPTR),Y
          INY
          STA     (LISTPTR),Y
          DEX
          BPL     LPFZ
;SET DLL TO  POINT TO NEW DISPLAY LIST LIST
          LDA     INHSC;                  ;SEE IF IN HSC
          BNE     CONTB;                  ;IF SO, BOOT THIS PART
          LDA     #>DLSTLST1
          BIT     DLSPTR
          BMI     DLST1
          LDA     #>DLSTLST2
DLST1     STA     DPPH
          LDA     #<DLSTLST1
          BIT     DLSPTR
          BMI     DLST11
          LDA     #<DLSTLST2
DLST11    STA     DPPL
          LDA     DLSPTR
          EOR     #$FF
          STA     DLSPTR;                 ;NEXT TIME, WILL USE OTHER DLL
;VESTIGAL KERNEL REMAINS
UPSHIP    LDY     #63
          LDA     TYPE,Y
          BEQ     UNTOUCH1
          LDA     AUTOPLAY;               ;NON ZERO IF IN AUTO
          BEQ     NLOOKTAB
          JMP     ALOOKTAB
NLOOKTAB  LDA     MODE+40;                ;SEE IF IN REUNITE MODE
          CMP     #9
          BEQ     UNTOUCH1
          LDA     PLAYER;                 ;SEE WHICH PLAYER IS UP
          BEQ     NLOOKTB1
          LDA     SWCHA
          ROR
          ROR
          ROR;                      ;W BIT IN CARRY
          BCC     GOWEST
          ROR
          BCC     GOEAST;                 ;E BIT IN CARRY
          BCS     UNTOUCH1
NLOOKTB1  BIT     SWCHA
          BPL     GOEAST
          BVC     GOWEST
UNTOUCH1
          INC     STARINC
          LDA     STARINC
          LSR
          BCC     NODEC
NODEC     DEC     ANIMATE
          BNE     CONTA
          LDA     #20
          STA     ANIMATE
          INC     FLAP
CONTA     LDA     MISTIMER
          BEQ     CONTB
          DEC     MISTIMER
CONTB
          INC     FRAME
          DEC     BOOTLDR;                ;RESET LOADER FLAG
          LDA     SAVEA
          LDX     SAVEX
          LDY     SAVEY
SPURIOUS  RTI

GOWEST    LDA     HEROX
          BEQ     UNTOUCH1
          DEC     HEROX
          DEC     XCORD+62;               ;BLINDLY MOVE THIS GUY
          JMP     UNTOUCH1
GOEAST    LDA     MODE+63;                ;GET HERO SHIP MODE
          CMP     #10;                    ;SEE IF DUAL HERO MODE
          BNE     GOEAST1
          LDA     HEROX
          CMP     #145
          BEQ     UNTOUCH1
          INC     HEROX
          INC     XCORD+62;               ;BLINDLY MOVE THIS GUY
          BNE     UNTOUCH1
GOEAST1   LDA     HEROX
          CMP     #152
          BEQ     UNTOUCH1
          INC     HEROX
          BNE     UNTOUCH1
ALOOKTAB  LDY     TABPNT;                 ;HANDLES AUTO GAME
          LDA     AUTAB,Y;                ;PICK X COORDINATE TO SHOOT FOR
          CMP     HEROX
          BEQ     TINCPNT;                ;INCREMENT POINTER IF IT IS REACHED
          BCS     GOEAST
          BCC     GOWEST
TINCPNT   INC     TABPNT
          LDA     TABPNT
          CMP     #16
          BEQ     TINCPP
          JMP     UNTOUCH1
TINCPP    LDA     #0
          STA     TABPNT
          JMP     UNTOUCH1
ATABL
PTABL     DC.B      $0C,$48,$0E,$00        ; 0: HERO SHIP         (41,61,71)
          DC.B      $1F,$94,$45,$00        ; 1: RED BUG
          DC.B      $2C,$0F,$28,$00        ; 2: EXPLOSIONS, SMALL NUMBERS
          DC.B      $09,$1F,$1D,$00        ; 3: MISSILES, WORDS, SCORES, RACK
          DC.B      $9B,$E0,$1F,$00        ; 4: BLUE BOSS
          DC.B      $D6,$40,$1C,$00        ; 5: REGULAR BOSS
          DC.B      $E9,$E4,$87,$00        ; 6: LOGO
          DC.B      $1F,$95,$40,$00        ; 7: BLUE BUG

XCORDOFF  DC.B      0,0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3
          DC.B      4,4,4,4,4,4,5,5,5,5,5,5,6,6,6,6,6,6
          DC.B      7,7,7,7,7,7,8,8,8

BMWIDTH   DC.B      $1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E
          DC.B      $1E,$1E,$1E,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D
          DC.B      $1D,$1C,$1C,$1C,$1C,$1C,$1C,$1C,$1C,$1C,$1C,$1C,$1C,$1B
          DC.B      $1B,$1B,$1B,$1B,$1B,$1B,$1B,$1B

INDX      DC.B      0,0,10,20,30,40,50,60,70,80,90,100,110,120

DIV3      DC.B      0,0,0,1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7,7,7
          DC.B      8,8,8,9,9,9,10,10,10,11,11,11,12,12,12,13,13,13
          DC.B      14,14,14,15,15,15,16,16,16,17,17,17,18,18,18,19,19,19
          DC.B      20,20,20,21,21,21,22,22,22
ZOFF      DC.B      0,12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192
          DC.B      $F4,$F4,$F4,$F4,$F4,$F4

LISTTABL  DC.B      <S1L1,<S1L2,<S1L3,<S1L4,<S1L5,<S1L6
          DC.B      <S1L7,<S1L8,<S1L9,<S1L10,<S1L11,<S1L12
          DC.B      <S1L13,<S1L14,<S1L15,<S1L16
LISTTBH1  DC.B      >S1L1,>S1L2,>S1L3,>S1L4,>S1L5,>S1L6
          DC.B      >S1L7,>S1L8,>S1L9,>S1L10,>S1L11,>S1L12
          DC.B      >S1L13,>S1L14,>S1L15,>S1L16
LISTTBH2  DC.B      >S2L1,>S2L2,>S2L3,>S2L4,>S2L5,>S2L6
          DC.B      >S2L7,>S2L8,>S2L9,>S2L10,>S2L11,>S2L12
          DC.B      >S2L13,>S2L14,>S2L15,>S2L16
;GIVES PALETTE AND WIDTH INDEXED BY TYPE
PALWDT    DC.B      0;                      ;PALLET FOR NOTHING
          DC.B      $FE;                    ;PALLET FOR BLUE BUG
          DC.B      $3E;                    ;PALLET FOR RED BUG
          DC.B      $BE;                    ;PALLET FOR REG BOS-GALAGA
          DC.B      $9E;                    ;PALLET FOR BLUE BOS-GALAGA
          DC.B      $1E;                    ;PALLET FOR HERO SHIP
          DC.B      0;                      ;INVISO SHIP (NOT USED)
          DC.B      $7E;                    ;PALLET FOR MISSLES
          DC.B      $5D;                    ;PALLET FOR EXPLOSIONS
          DC.B      $5C;                    ;PALLET FOR SMALL NUMBERS
          DC.B      $5C;                    ;PALLET FOR SMALL NUMBERS
          DC.B      $5C;                    ;PALLET FOR SMALL NUMBERS
          DC.B      $5C;                    ;PALLET FOR SMALL NUMBERS
          DC.B      $7E;                    ;SCORPION,PAL=?,T=13
          DC.B      0,0
          DC.B      $BE;                    ;PALLET FOR REG-BOSS GALAGA
          DC.B      $9E;                    ;PALLET FOR BLUE-BOSS GALAGA
          DC.B      $D3;                    ;LOGO SECTIONS, W=13,T=18
          DC.B      $D3;                    ;T=19
          DC.B      $D3;                    ;T=20
          DC.B      $D3;                    ;T=21
          DC.B      $D7;                    ;T=22
          DC.B      $D7;                    ;T=23
          DC.B      $7E;                    ;T=24, LINE, NOT USED
          DC.B      $77;                    ;THIS IS PLAYER
          DC.B      $78;                    ;WIDTH 8 FOR READY....
          DC.B      $7C;                    ;DOUBLE MISSILE  TYPE=27
          DC.B      $73;                    ;GAME OVER, WIDTH = 13
          DC.B      $70;                    ;CHALLENGING, WIDTH = 16
          DC.B      $79;                    ;STAGE, WIDTH = 7
          DC.B      $7E;                    ;"1", WIDTH = 2
          DC.B      $7E;                    ;"2", WIDTH = 2
          DC.B      $76;                    ;"FIGHTER" WIDTH = 10
          DC.B      $74;                    ;"CAPTURED" WIDTH = 12
          DC.B      $9C;                    ;TWINKLE, PAL 4, WIDTH = 4
          DC.B      $6C;                    ;NUMOFHTS, PAL3, W=20, TYPE=36
          DC.B      $76;                    ;PERFECT, W=10, PAL3, TYPE=37
          DC.B      $6D;                    ;SPECIAL BONUS, W=19, TYPE=38
          DC.B      $78;                    ;BONUS, W=8, TYPE=39
          DC.B      $7E;                    ;DIGIT, W=2, TYPE=40
          DC.B      $7A;                    ;TEN K, W=6, TYPE=41
          DC.B      $7D;                    ;DOUBLE ZERO, W=3, TYPE=42
          DC.B      $74;                    ;ADVANCED,W=12,T=43
          DC.B      $77;                    ;EXPERT,W=9,T=44
          DC.B      $77;                    ;NOVICE,W=9,T=45
          DC.B      $78;                    ;LEVEL,W=8,T=46
          DC.B      $75;                    ;PLAYERS,W=11?,T=47
          DC.B      $7E;                    ;SONE,W=2,T=48
          DC.B      $7E;                    ;TTWO,W=2,T=49
          DC.B      $FE;                    ;NEWBIRD,W=2,T=50
          DC.B      $7E;                    ;%,W=2,T=51
          DC.B      $5D;                    ;HERO EXPLOSION, W=3,T=52

;THIS TABLE IS INDEXED BY THE TYPE OF THE GIVEN CHARACTER
; IT GIVES AN INDEX INTO THE LSTPTBL
TYPTOLT   DC.B      0;                      ;CALL NO SHIP GRAPHICS (NOT USED)
          DC.B      0;                      ;CALL BLUE BUG GRAPHICS
          DC.B      9;                      ;CALL RED BUG GRAPHICS
          DC.B      18;                     ;CALL BOSS BUG GRAPHICS
          DC.B      18;                     ;CALL BOSS BUG GRAPHICS
          DC.B      27;                     ;CALL HERO GRAPHICS
          DC.B      0;                      ;CALL INVISO SHIP GRAPHICS (NOT USED)
          DC.B      45;                     ;CALL MISSLE GRAPHICS
          DC.B      36;                     ;CALL EXPLOSION GRAPHICS
          DC.B      53;                     ;CALL SMALL NUMBER GRAPHICS
          DC.B      54;                     ;CALL SMALL NUMBER GRAPHICS
          DC.B      55;                     ;CALL SMALL NUMBER GRAPHICS
          DC.B      56;                     ;CALL SMALL NUMBER GRAPHICS
          DC.B      126;                    ;SCORPION,T=13
          DC.B      0,0
          DC.B      18;                     ;CALL BOSS BUG GRAPHICS
          DC.B      18;                     ;CALL BOSS BUG GRAPHICS
          DC.B      69,70,71,72,73,74,75
          DC.B      76;                     ;THIS IS FOR PLAYER ANGLE IS 1
          DC.B      77;                     ;FOR READY
          DC.B      45;                     ;CALL MISSILE GRAPHICS
          DC.B      78;                     ;GAME OVER
          DC.B      79;                     ;CHALLENGING
          DC.B      80;                     ;STAGE
          DC.B      81;                     ;"1"
          DC.B      82;                     ;"2"
          DC.B      83;                     ;FIGHTER
          DC.B      84;                     ;CAPTURED
          DC.B      86;                     ;TWINKLE    TYPE=35
          DC.B      93;                     ;NUMOFHTS, T=36
          DC.B      94;                     ;PERFECT, T=37
          DC.B      95;                     ;SPECIAL BONUS, T=38
          DC.B      96;                     ;BONUS, T=39
          DC.B      98;                     ;DIGIT, T=40
          DC.B      107;                    ;TENK, T=41
          DC.B      108;                    ;DBLZERO, T=42
          DC.B      109;                    ;ADVANCED,T=43
          DC.B      110;                    ;EXPERT,T=44
          DC.B      111;                    ;NOVICE,T=45
          DC.B      112;                    ;LEVEL,T=46
          DC.B      76;                     ;PLAYERS,T=47
          DC.B      113;                    ;"1",T=48
          DC.B      114;                    ;"2",T=49
          DC.B      116;                    ;NEWBIRD,T=50
          DC.B      124;                    ;%,T=51
          DC.B      135;                    ;HERO EXPLOSION, T=52

LSTPTBL   DC.B      <BLUBUG,<BLUBUG1,<BLUBUG2,<BLUBUG3
          DC.B      <BLUBUG4,<BLUBUG5,<BLUBUG6,<BLUBUG7,<BLUBUGF
          DC.B      <REDBUG,<REDBUG1,<REDBUG2,<REDBUG3
          DC.B      <REDBUG4,<REDBUG5,<REDBUG6,<REDBUG7,<REDBUGF
          DC.B      <BOSGAL,<BOSGAL1,<BOSGAL2,<BOSGAL3;             ;21
          DC.B      <BOSGAL4,<BOSGAL5,<BOSGAL6,<BOSGAL7,<BOSGALF
          DC.B      <HEROS,<HERO1,<HERO2,<HERO3
          DC.B      <HERO4,<HERO5,<HERO6,<HERO7,<HEROS;           ;35
          DC.B      <EXPLO0,<EXPLO1,<EXPLO2,<EXPLO3
          DC.B      <EXPLO4,<EXPLO5,<EXPLO6,<EXPLO7,<EXPLO0   ;44
          DC.B      <MISSLE,<MISSLE,<MISSLE,<MISSLE
          DC.B      <MISSLE4,<MISSLE,<MISSLE,<MISSLE,<MISSLE       ;53
          DC.B      <SIXTYPE,<THOTYPE,<EIGTYPE,<FOUTYPE  ;NEW
          DC.B      <FOUTYPE,<FOUTYPE,<FOUTYPE,<FOUTYPE,<FOUTYPE
          DC.B      <FOUTYPE,<FOUTYPE,<FOUTYPE,<FOUTYPE  ;NEW
          DC.B      <FOUTYPE,<FOUTYPE,<FOUTYPE;             ;NEW
          DC.B      <LULOGO,<LILOGO,<RULOGO,<RILOGO
          DC.B      <BULOGO,<BILOGO
          DC.B      <LINE
          DC.B      <PLAYERG;             ;77
          DC.B      <READY;               ;78
          DC.B      <GMEOVER;             ;79
          DC.B      <CHLNGING;            ;80
          DC.B      <STAGE;               ;81
          DC.B      <PONE;                ;82
          DC.B      <PTWO;                ;83
          DC.B      <FIGHTER;             ;84
          DC.B      <CAPTD;               ;85
          DC.B      <TWINKLE;             ;86
          DC.B      <TWINKL1;             ;87
          DC.B      <TWINKL2;             ;88
          DC.B      <TWINKL3;             ;89
          DC.B      <TWINKL4;             ;90
          DC.B      <TWINKL5;             ;91
          DC.B      <TWINKL6;             ;92
          DC.B      <TWINKL7;             ;93
          DC.B      <NUMOFHTS;            ;94TH ENTRY, ANGLE =1
          DC.B      <PERFECT;             ;95
          DC.B      <SPECIALG;            ;96
          DC.B      <BONUS;               ;97
          DC.B      <DIGIT0;              ;98
          DC.B      <DIGIT1;              ;99
          DC.B      <DIGIT2
          DC.B      <DIGIT3
          DC.B      <DIGIT4
          DC.B      <DIGIT5
          DC.B      <DIGIT6
          DC.B      <DIGIT7
          DC.B      <DIGIT8
          DC.B      <DIGIT9;              ;107
          DC.B      <TENK;                ;108
          DC.B      <DBLZERO;             ;109
          DC.B      <ADVANCED;            ;110
          DC.B      <EXPERT;              ;111
          DC.B      <NOVICE;              ;112
          DC.B      <LEVEL;               ;113
          DC.B      <SONE;                ;114TH ENTRY
          DC.B      <STWO;                ;115
          DC.B      <NEWBIRD0,<NEWBIRD1,<NEWBIRD2,<NEWBIRD3
          DC.B      <NEWBIRD4,<NEWBIRD5,<NEWBIRD6,<NEWBIRD7
          DC.B      <NEWBIRD0;            ;124
          DC.B      <PERCENT;             ;125
          DC.B      <SCORP0,<SCORP1,<SCORP2,<SCORP3,<SCORP4
          DC.B      <SCORP5,<SCORP6,<SCORP7,<SCORPF   ;134
          DC.B      <HEXPLO0,<HEXPLO1,<HEXPLO2,<HEXPLO3
          DC.B      <HEXPLO4,<HEXPLO5,<HEXPLO6,<HEXPLO7,<HEXPLO0 ;143

AUTAB     DC.B      $58,$19,$46,$30,$50,$5A,$40,$20,$50,$45
          DC.B      $72,$1E,$31,$4C,$80,$30,$38

GETXSC    DC.B      0,8,16,24,32,40,48,56,94,102,110,118,126,134,142,150

;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;*;*;*;*;* High Score Code ;*;*;*;*;*
;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
; THIS FILE CONTAINS THE HANDLERS FOR THE INTERFACE TO THE HISCORE
;         MODULE.  "MKHISCOR" AND "MKENTER" INITIATE MODES;
;         "HISCORE" AND "ENTER" JUST LOOP IN WAIT.
; THIS CODE IS REACHED THROUGH A JSR

HSCATRCT  EQU     $3FFA
HSCINITL  EQU     $3FFD
HSCRAM    EQU     $2200
HSCSTAT   EQU     $3FF7

HSCTEST   JSR     BUILDHSC
          LDA     #0
          STA     HSCRAM+14;              SET WAITING TIME TO ZERO
          JMP     HSCSTAT;                SEE IF DISPLAY FOR THIS LEVEL

HSCDSPLY  JSR     BUILDHSC
          JMP     HSCATRCT;               RETURN FROM THERE

HSCENTER
          JSR     BUILDHSC
          LDA     PLAYER
          BNE     HSC2PLR;                IF SECOND PLAYER, LEAVE ALONE
          LDA     TWOPLAYR;               SEE IF TWO PLAYER GAME
          BEQ     HSC2PLR;                IF ONE PLAYER ONLY, LEAVE IT ALONE
          LDA     #0
          STA     HSCRAM+14;              SET WAIT TIME TO 0 SECONDS
HSC2PLR   JMP     HSCINITL;               RETURN FROM THERE

BUILDHSC
          LDA     $3900
          CMP     #$C6
          BNE     HSCMISSS
          LDA     $3904
          CMP     #$FE
HSCMISSS  BNE     HSCMISS

;         LDX     #31
;DLSTLD    LDA     HSCDLST1,X;             ;MOVE LOGO DISPLAY LIST DOWN INTO RAM
 ;        STA     S1L1,X
  ;       DEX
   ;      BPL     DLSTLD

          LDX     #14;                    COPY 15 BYTES FROM HSCROM TO HSCRAM
HSCLOAD   LDA     HSCROM,X
          STA     HSCRAM,X
          DEX
          BPL     HSCLOAD

          LDA     DIFCULTY;               ; DIFFICULTY LEVEL FOR THIS CALL
          TAX
          ASL;                      ;  --CALLED 3 TIMES FROM "LOGO"
          ASL;                      ; ONCE FOR EACH DIFFICULTY LEVEL
          ORA     PLAYER;                 WHO"S ENTERING HIS INITIALS
          STA     HSCRAM+2

          LDA     DNTABL,X
          STA     HSCRAM+6
          LDA     DNTABH,X
          STA     HSCRAM+7

          LDA     PLAYER
          BEQ     CONTINUE
;         MOVEPTR SCORE2,HSCRAM+8        OTHER PLAYER
          LDA     SCORE+8;                HIGHEST BYTE OF P2 SCORE
          CMP     #$A
          BNE     NIBOK1
          LDA     #0
          BEQ     NXTNIB
NIBOK1    ASL
          ASL
          ASL
          ASL
NXTNIB    ORA     SCORE+9;                PUT IN BCD FORM
          CMP     #$A
          BNE     NIBOK2
          LDA     #0
NIBOK2    STA     HSCORE
          LDX     #2
LDSCORE   LDA     P2SCORE,X
          STA     HSCORE+1,X
          DEX
          BPL     LDSCORE
          BMI     SETXANDY
CONTINUE
          LDA     SCORE
          CMP     #$A;                    ;SEE IF BLANK
          BNE     NIBOK3
          LDA     #0
          BEQ     NXTNIBL
NIBOK3    ASL
          ASL
          ASL
          ASL
NXTNIBL   ORA     SCORE+1;                ;PUT SCORE IN BCD FORM
          CMP     #$A
          BNE     NIBOKK
          LDA     #0
NIBOKK    STA     HSCORE
          LDX     #2
LDSCORE2  LDA     P1SCORE,X
          STA     HSCORE+1,X
          DEX
          BPL     LDSCORE2
;         COPY    HSCDLIST,ARAMZONE,40
SETXANDY  LDX     #<HSCRAM
          LDY     #>HSCRAM
NOSOUND   RTS

HSCMISS   PLA
          PLA
          RTS


HSCDLL    DC.B      $C9,>DUMYHDR,<DUMYHDR
          DC.B      $43,>ZEROHDR,<ZEROHDR
          DC.B      $4B,>S1L6,<S1L6
;*THIS STUFF IS OFF THE SCREEN ON MOST TV"S
          DC.B      $4B,>S1L7,<S1L7
          DC.B      $4B,>S1L8,<S1L8
          DC.B      $4B,>S1L9,<S1L9
          DC.B      $4B,>S1L10,<S1L10

DNAME0    DC.B      $1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D    ; overlapped
          DC.B      $1D,13,14,21,8,2,4,$1D      ; "NOVICE"
          DC.B      $1D,$1D,$1D
DNAME1    DC.B      $1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D    ; overlapped
          DC.B      $0,$3,$15,$0,$D,$2,$4,$3        ; "ADVANCED"
DNAME2    DC.B      $1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D ; overlapped
          DC.B      $4,$17,$F,$4,$11,$13;           ; "EXPERT"
          DC.B      $1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D

END01     ;DC.B      0
