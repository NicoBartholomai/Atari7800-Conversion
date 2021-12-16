	processor 6502 
;GRAPHA.S
;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*

;        THE NECESSARY PROLOG FOR MARIA CODE

;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;  STELLA (TIA) REGISTER ADDRESSES
; NOTE THESE REGISTERS ARE SHADOWED AT 100 TO 11F
;         ;                             200 TO 21F
;         ;                             300 TO 31F
;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*

AUDC0     EQU     $15      ;BITS     3210 AUDIO CONTROL 0
AUDC1     EQU     $16      ;BITS     3210 AUDIO CONTROL 1
AUDF0     EQU     $17      ;BITS     3210 AUDIO FREQUENCY 0
AUDF1     EQU     $18      ;BITS     3210 AUDIO FREQUENCY 1
AUDV0     EQU     $19      ;BITS     3210 AUDIO VOLUME 0
AUDV1     EQU     $1A      ;BITS     3210 AUDIO VOLUME 1
INPT0     EQU     $08
INPT1     EQU     $09
INPT2     EQU     $0A
INPT3     EQU     $0B
INPT4     EQU     $0C   ;PLAYER 0 BUTTON CLEAR WHEN HIT
INPT5     EQU     $0D   ;PLAYER 1 BUTTON CLEAR WHEN HIT





;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
; MARIA REGISTERS
; NOTE THESE REGISTERS ARE SHADOWED AT 120 TO 13F
;         ;                             220 TO 23F
;         ;                             320 TO 33F
;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
P0C0      EQU     $20;                    ;BACKGROUND COLOR                  RW
;         ALL PALETTE AND COLOR ARE HIGH NIBBLE COLOR, LOW NIBBLE LUMINANCE
P0C1      EQU     $21;                    ;PALETTE ZERO COLOR ONE            RW
P0C2      EQU     $22;                    ;PALETTE ZERO COLOR TWO            RW
P0C3      EQU     $23;                    ;PALETTE ZERO COLOR THREE          RW
WSYNCM    EQU     $24;                    ;FAST MARIA WSYNC STROBE
P1C1      EQU     $25;                    ;PALETTE ONE COLOR ONE             RW
P1C2      EQU     $26;                    ;PALETTE ONE COLOR TWO             RW
P1C3      EQU     $27;                    ;PALETTE ONE COLOR THREE           RW
CTRLRD    EQU     $28;                    ;BIT 7 IN VBLANK, BIT 6 IN DISPLAY RO
P2C1      EQU     $29;                    ;PALETTE TWO COLOR ONE             RW
P2C2      EQU     $2A;                    ;PALETTE TWO COLOR TWO             RW
P2C3      EQU     $2B;                    ;PALETTE TWO COLOR THREE           RW
DPPH      EQU     $2C;                    ;DISPLAY LIST POINTER HIGH         WO
P3C1      EQU     $2D;                    ;PALETTE THREE COLOR ONE           RW
P3C2      EQU     $2E;                    ;PALETTE THREE COLOR TWO           RW
P3C3      EQU     $2F;                    ;PALETTE THREE COLOR THREE         RW
DPPL      EQU     $30;                    ;DISPLAY LIST POINTER LOW          WO
P4C1      EQU     $31;                    ;PALETTE FOUR COLOR ONE            RW
P4C2      EQU     $32;                    ;PALETTE FOUR COLOR TWO            RW
P4C3      EQU     $33;                    ;PALETTE FOUR COLOR THREE          RW
CHARBASE  EQU     $34;                    :CHARACTER MODE HIGH POINTER       WO
P5C1      EQU     $35;                    ;PALETTE FIVE COLOR ONE            RW
P5C2      EQU     $36;                    ;PALETTE FIVE COLOR TWO            RW
P5C3      EQU     $37;                    ;PALETTE FIVE COLOR THREE          RW
OFFSET    EQU     $38;                    ;GRAPHICS HIGH POINTER OFFSET      RW
P6C1      EQU     $39;                    ;PALETTE SIX COLOR ONE             RW
P6C2      EQU     $3A;                    ;PALETTE SIX COLOR TWO             RW
P6C3      EQU     $3B;                    ;PALETTE SIX COLOR THREE           RW
CTRLWT    EQU     $3C;                    ;BIT 7  CHARACTER WIDTH,BIT 6 BCNT WO
P7C1      EQU     $3D;                    ;PALETTE SEVEN COLOR ONE           RW
P7C2      EQU     $3E;                    ;PALETTE SEVEN COLOR TWO           RW
P7C3      EQU     $3F;                    ;PALETTE SEVEN COLOR THREE         RW

MISTYPE   EQU     $7
YSHIP     EQU     $5
BONUSPT   EQU     $30;                    ;SET TO EVERY 30,00 POINTS
NOTFOSH   EQU     $FF
TIBTNBIR  EQU     $0E
TIBTNWAV  EQU     $F0
TIBTNFWV  EQU     $80



;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
; ZERO PAGE RAM   040 TO 0FF
;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
          ORG       $0040
ARRIVED   DS      1;                      ;ALL SHIPS ARRIVED, GO TO EXPNSN
NUMFLY    DS      1;                      ;NO OF SHIPS FLYING IN EXPNSN
RACK      DS      1;                      ;RACK NUMBER
GASTONHK  DS      1;                      ;RACK NUMBER IN BCD
BORNCNT   DS      1;                      ;DELAY BETWEEN BIRTHS
NEWWAVE   DS      1;                      ;INDICATES START OF NEW WAVE
SHIPCNT   DS      1;                      ;NO OF SHIPS CREATED
SHIPLEFT  DS      1
WAVECNT   DS      1;                      ;TELLS WHEN TO INC WAVEREG
WAVEREG   DS      1;                      ;TELLS WHICH WAVE THIS IS
TOGGLEM0  DS      1;                      ;EXPANSION AND SHIFT VARIABLES
EXPANR    DS      1
EXPANC    DS      1
EXPANCC   DS      1
COL0      DS      1;                      ;COLUMN POSITIONS
COL1      DS      1
COL2      DS      1
COL3      DS      1
COL4      DS      1
TOGGLEM   DS      1
TOGGLES   DS      1
XSTEPY    DS      1
COUNT     DS      1
BULLSHT   DS      1;                      ;INCREASES DIFFICULTY LATER IN RACK
STRSPEED  DS      1;                      ;SPEED OF THE STARS
SHPERWAV  DS      1;                      ;COUNTS NUMBER OF SHIPS PER WAVE
CHALNUM   DS      1;                      ;GIVES WHICH "NUMBER" A CHAL STAGE IS
CHALINDX  DS      1;                      ;INDEX TO CHALLENGING STAGE PAIRTABLE
CAPBOS1   DS      1;                      ;TELLS WHICH BOSS HAS THE HERO
CHTAB40   DS      1;                      ;SAVES COLUMN NUMBER OF CAPT"D HERO
HEROREAP  DS      1;                      ;INDICATES THAT CAPTD HERO MUST RETURN
DECCNT    DS      1;                      ;NEED TO BE SWITCHED
ABORT     DS      1;                      ;ABORTS NEW ATTACKS OR BIRTHS
CHALSTG   DS      1;                      ;INDICATES CHALLENGING STAGE
CHALWAVE  DS      1;                      ;INDICATES START OF CHALLENGING WAVE
WAVESCR   DS      1;                      ;HOLDS THE SCORE FOR AN INDIVIDUAL WAVE
;ALL OF THE ABOVE VARIABLES ARE SWITCHED IN TWO PLAYER MODE
CAPTUREX  DS      1;                      ;XCORD OF CAPTURING BOSS GALAGA
;HEROX     DS      1;                      ;HERO X COORDINATE
LISTPTR   DS      2;                      ;PTR TO CURRENT DISPLAY LIST
TEMP0     DS      1;                      ;TEMP VARIABLES FOR SCORE & LOADER
TEMP1     DS      2
TEMP2     DS      2
TEMP3     DS      1
TEMP4     DS      1
TEMP5     DS      1
TEMP6     DS      1
TEMP7     DS      1
TEMP8     DS      2;                      ;LOADER TEMP
DLSPTR    DS      1;                      ;PTR TO CURRENT DLSTLST
FRAME     DS      1;                      ;FRAME COUNT
RLOGO     DS      1
LY        DS      1
LA        DS      1
HEADER0   DS      1;                      ;LOADER HEADERS
HEADER1   DS      1
HEADER2   DS      1
HEADER3   DS      1
HEADER4   DS      1
HEADER5   DS      1
HEADER6   DS      1
HEADER7   DS      1
SAVEA     DS      1;                      ;SAVES A, X, AND Y, RESPECTIVELY
SAVEX     DS      1
SAVEY     DS      1
ANIMATE   DS      1
MSHCNT    DS      1
STARCNTR  DS      1;                      ;USED IN STARLDR
THREECNT  DS      1;                      ;USED IN STARLDR
FOURCNT   DS      1;                      ;USED IN STARLDR
AIRBORNE  DS      1;                      ;NO OF SHIPS AIRBORNE
NOSWITCH  DS      1;                      ;INDICATES HERO HAS BEEN CAPTURED
CHALSCR   DS      1;                      ;KEEPS SCORE ON CHALLENGING STAGE
STARPTR   DS      1
STARINC   DS      1
SCRTIME   DS      1;                      ;DISPLAYS CHALLENGING STAGE RESULTS
PUNTSCRL  DS      1;                      ;TELLS IF SCROLL SHOULD OCCUR
AUTOPLAZ  DS      1;                      ;ADDITIONAL AUTOPLAY REGISTER
SELTIMER  DS      1;                      ;TIMER BETWEEN ADVANCING SELECT OPTNS
SELDELAY  DS      1;                      ;TIMER FOR LOCAL SELECT ADVANCE
SELTGL    DS      1;                      ;TOGGLE FOR LOCAL SELECT ADVANCE
DECDELAY  DS      1;                      ;DELAYS REVIVAL OF HERO IN 1 PLAYER MD
SCRTEMP   DS      1;                      ;HOLDS THE SCORE FOR A HERO SHOT
P1TOG     DS      1;                      ;COUNTER FOR CREDITING BONUS LIVES
P2TOG     DS      1;                      ;SAME, FOR PLAYER 2
PRCNTREG  DS      1;                      ;HOLDS THE HIT/MISS RATIO
MISCNT11  DS      2;                      ;HOLDS THE # OF SHOTS FIRED PLAYER1
MISCNT12  DS      2;                      ;HOLDS THE # OF SHOTS FIRED PLAYER2
MISCNT21  DS      3;                      ;HOLDS THE # OF HITS FOR PLAYER1
MISCNT22  DS      3;                      ;HOLDS THE # OF HITS FOR PLAYER2
RATIO     DS      3;                      ;HOLDS THE RESULT OF 100 ;* MISCNT2
METAREG   DS      1;                      ;TELLS IF TIME FOR META ATTEMPT
METACNT   DS      1;                      ;KEEPS TRACK OF META BIRTHS
CAPQUAN   DS      1;                      ;CAPTURE QUANDARY QUESTION
LOOPCNT   DS      1;                      ;COUNTER IN BIRTH ROUTINE
MISTIMER  DS      1;                      ;TIME BETWEEN HERO MISSILES
P1BONUS   DS      2;                      ;SCORE BONUSES
P2BONUS   DS      2
PLAYER    DS      1;                      ;PLAYER1 OR PLAYER2 INDICATOR
GAMEOVER  DS      1;                      ;INDICATES GAME OVER
AUTOPLAY  DS      1;                      ;INDICATES AUTOPLAY MODE
LIVES     DS      2;                      ;NO OF LIVES FOR EACH PLAYER
SHIPDIR   DS      1
WAITCNT   DS      1;                      ;CNTR USED FOR LOWERING TRCTR BEAM
ZOFFSET   DS      1;                      ;USED IN BEAM LOADER
WAITCNT2  DS      1;                      ;USED IN BEAM LOADER
WAITCNT3  DS      1;                      ;DITTO
KEEPY     DS      1;                      ;SAVES Y VALUE
KEEPX     DS      1;                      ;SAVES X VALUE
DECREG    DS      1;                      ;USED TO DELAY GIVING NEW LIFE
RDYREG    DS      1;                      ;DISPLAYS "READY"
CHLNGREG  DS      1;                      ;DISPLAYS "CHALLENGING STAGE"
RACKREG   DS      1;                      ;?
PLAYRREG  DS      1;                      ;DISPLAYS "PLAYER" "1" OR "2"
GMOVEREG  DS      1;                      ;DISPLAYS "GAME OVER"
CAPTDREG  DS      1;                      ;DISPLAYS "FIGHTER CAPTURED"
TABPNT    DS      1
;SOUND VARIBLES
;SOUNDZP   DS      2;                      ;2 BYTES - ZERO PAGE FOR SOUND
MPTRL     DS      1
MPTRH     DS      1

FLAP      DS      1
;         LOADER TEMP RAM
LISTSIZ   DS      16;                     ;HAS SIZES OF EACH DISPLAY LIST
LTYPE     DS      1
STAMPH    DS      1;                      ;?
STAMPL    DS      1;                      ;?
STAMPB    DS      1
BOOTLDR   DS      1;                      ;TELLS LOADER IT HAS OVERLAPPED ITSELF
BOZO0     DS      1;                      ;TC TEMP VARIABLE
BOZO1     DS      1;                      ;TC TEMP VARIABLE
BOZO2     DS      1;                      ;TC TEMP VARIABLE
BOZO3     DS      1;                      ;TC TEMP VARIABLE
BOZO4     DS      1;                      ;TC TEMP VARIABLE
BOZO5     DS      1;                      ;TC TEMP VARIABLE
BOZO6     DS      1;                      ;TC TEMP VARIABLE
BOZO7     DS      1;                      ;TC TEMP VARIABLE
BOZO8     DS      1;                      ;TC TEMP VARIABLE
;169 OUT OF 192 ARE USED
SCORPCNT  DS      1;                      ;USED TO SEE IF 3 SCORPIONS ARE HIT
PAUSE     DS      1;                      ;INDICATES PAUSE BUTTON ACTIVE
INHSC     DS      1;                      ;INDICATES IN HIGH SCORE CART
DIFCULTY  DS      1;                      ;INDICATES DIFFICULTY CALL FOR HSC
SAVEB     DS      1;                      ;HOLDS LOADER ACCUMULATOR VALUE
;174 OUT OF 192 USED
HSCORE    DS      4;                      ;4 BCD DIGITS
PAUSECT1  DS      1;                      ;COUNTER FOR LENGTH OF TIME IN PAUSE
PAUSECT2  DS      1;                      ;SAME
PAUSTOG   DS      1;                      ;ONLY LOOK AT PAUSE ONCE IN 10 FRAMES
ATTEMPT   DS      1;                      INCREMENTS THE NEXT SHIP TO ATTACK


;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
; FIRST PAGE RAM   140 TO 1FF
          ORG     $0140

MOMENTUM  DS      61;                     ;HOLDS MOMENTUM FOR ALL SHIPS




;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;  PIA AND TIMER (6532) LOCATIONS   280 TO 2FF
; NOTE THESE REGISTERS ARE SHADOWED AT 380 TO 3FF
;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
SWCHA     EQU     $280  ;PO, P1 JOYSTICKS

;         BIT 7 PLAYER 0 EAST IF CLEAR
;         BIT 6;          WEST
;         BIT 5;          SOUTH
;         BIT 4;          NORTH
;         BIT 3 PLAYER 1 EAST IF CLEAR
;         BIT 2;          WEST
;         BIT 1;          SOUTH
;         BIT 0;          NORTH

SWCHB     EQU     $282  ;CONSOLE SWITCHES

;         BIT 7   PLAYER 1 DIFFICULTY A IF SET B IF CLEAR
;         BIT 6   PLAYER 0 DIFFICULTY A IF SET B IF CLEAR
;         BIT 3   BLACK & WHITE/COLOR  COLOR WHEN SET
;         BIT 1   GAME SELECT  CLEAR WHEN PRESSED
;         BIT 0   GAME RESET   CLEAR WHEN PRESSED

CTLSWA    EQU     $281
CTLSWB    EQU     $283
INTIM     EQU     $284  ;INTERVAL TIMER IN
TIM8T     EQU     $295  ;TIMER 8T WRITE OUT
TIM64T    EQU     $296  ;TIMER 64T WRITE OUT
TIM64TI   EQU     $29E  ;INTERUPT TIMER 64T
DLSIZE    EQU     82


;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
; RAM     1800 TO 203F;                   (MARIA 2)
;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*
;THIS MEMORY SPACE IF FULL
          ORG       $1800
;         DISPLAY LIST ONE
S1L1      DS      DLSIZE
S1L2      DS      DLSIZE
S1L3      DS      DLSIZE
S1L4      DS      DLSIZE
S1L5      DS      DLSIZE
S1L6      DS      DLSIZE
S1L7      DS      DLSIZE
S1L8      DS      DLSIZE
S1L9      DS      DLSIZE
S1L10     DS      DLSIZE
S1L11     DS      DLSIZE
S1L12     DS      DLSIZE
S1L13     DS      DLSIZE
S1L14     DS      DLSIZE
S1L15     DS      DLSIZE
S1L16     DS      DLSIZE
ZEROHDR   DS      2

DLSTLST1  DS      72
DLSTLST2  DS      72

NEWCOLS   DS      10
LISTSIZ2  DS      9;                      ;SECOND SET OF LIST SIZES
COLPOS    DS      10


TYPE      DS      72
XCORD     DS      72
YCORD     DS      72
ANGLE     DS      72
ML        DS      67
MH        DS      65
MODE      DS      67
COUNTXY   DS      65
DONE      DS      65

HEROX     EQU     XCORD+63


          ORG     $2200
;         DISPLAY LISTS TWO;              ;THE LOW BYTE OF S2L1 = S1L1
S2L1      DS      DLSIZE
S2L2      DS      DLSIZE
S2L3      DS      DLSIZE
S2L4      DS      DLSIZE
S2L5      DS      DLSIZE
S2L6      DS      DLSIZE
S2L7      DS      DLSIZE
S2L8      DS      DLSIZE
S2L9      DS      DLSIZE
S2L10     DS      DLSIZE
S2L11     DS      DLSIZE
S2L12     DS      DLSIZE
S2L13     DS      DLSIZE
S2L14     DS      DLSIZE
S2L15     DS      DLSIZE
S2L16     DS      DLSIZE

SELECT    DS      1;                      ;TELLS YOU THAT YOU"RE IN SELECT MODE
RSTRTREG  DS      1;                      ;SIGNIFIES A RESTART IN PROGRESS
LEVELSEL  DS      1;                      ;LEVEL SELECTION VARIABLE
TWOPLAYR  DS      1;                      ;INDICATES TWO PLAYER MODE
P1SCORE   DS      3;                      ;DONT SPLIT THESE TWO APART
P2SCORE   DS      3
FARREN    DS      1

SAVES     DS      36;                     ;SAVES NECESSARY ZERO PAGE MEMORY
ONE60TIM  DS      1
TTEMP     DS      1
TUNTEMP   DS      1
DCH0      DS      1;                      ;ONE BYTE--DURATION CNTR CHAN. 0
DCH1      DS      1;                      ;ONE BYTE--DURATION CNTR CHAN. 1
TUNNUM    DS      1;                      ;ONE BYTE--TUNE NUM FOR CHAN. 0
TUNNUM1   DS      1;                      ;ONE BYTE--TUNE NUM FOR CHAN. 1
TINDEX0   DS      1;                      ;ONE BYTE--NOTE POINTER 0
TINDEX1   DS      1;                      ;ONE BYTE--NOTE POINTER 1
CINDEX0   DS      1;                      ;CONTROL INDEX
CINDEX1   DS      1
VINDEX0   DS      1;                      ;VOLUME INDEX
VINDEX1   DS      1
SCORE     DS      16

DUMYHDR   DS      7

NEWTYPE   DS      41

AEND      DS      1
;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*


;LINE TWELVE
          ORG     $A000
          DC.B      0,$0C,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      $00,$0C,$00
          DC.B      0,0,0
          DC.B      3,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0
MARIA2    DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,3,0,0
          DC.B      $0A,$8F,$E8,$C0
          DC.B      0,0,0,0,0
          DC.B      0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
DIGIT     DC.B      $5,$40
          DC.B      $5,$50
          DC.B      $55,$50
          DC.B      $55,$40
          DC.B      0,$40
          DC.B      $55,$40
          DC.B      $15,$40
          DC.B      $15,$40
          DC.B      $15,$40
          DC.B      $54,0




;ELEVENTH LINE
          ORG     $A100
          DC.B      0,$C0,$B0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      $30,$C0,0
          DC.B      0,0,$30
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,3,0,0
          DC.B      0,$0F,$C0,0
          DC.B      $AE,$AF,$EB,$E0
          DC.B      $FF,$FF,$FF,$FF,$FF
          DC.B      $FF
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      $10,$10
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      $15,$50
          DC.B      $5,$50
          DC.B      $15,$50
          DC.B      $55,$50
          DC.B      0,$40
          DC.B      $55,$50
          DC.B      $55,$50
          DC.B      $5,0
          DC.B      $55,$50
          DC.B      $15,0





          ORG     $A200;                  ; 10 TH LINE
          DC.B      0,$28,$80
          DC.B      0,0
          DC.B      $28,$00
          DC.B      $A0,$00
          DC.B      $00,$15
          DC.B      $02,$40
          DC.B      $CC,$33
          DC.B      $01,$80
          DC.B      0,0
          DC.B      0,$08
          DC.B      $00,$28
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,$0C,0
          DC.B      $0C,$30,0
          DC.B      0,0,$C0
          DC.B      0,0,0
          DC.B      $03,$00
          DC.B      $81,$00
          DC.B      $15,$A0
          DC.B      $02,$30
          DC.B      $1C,$D0
          DC.B      $32,$00
          DC.B      $29,$50
          DC.B      $01,$08
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,3,0,0
          DC.B      0,3,0,0
          DC.B      0,$3D,$F0,0
          DC.B      $AF,$EF,$EF,$E8
          DC.B      0,0,0,0,0
          DC.B      0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      $80,$08
          DC.B      $20,$20
          DC.B      $30,$30
          DC.B      $30,$30
          DC.B      $60,$24
          DC.B      $04,$40
          DC.B      $CB,$8C
          DC.B      $3,0
          DC.B      $55,0
          DC.B      $0,0
          DC.B      1,0
          DC.B      0,0
          DC.B      1,$54
          DC.B      3,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      $0A,$00
          DC.B      $A8,$00
          DC.B      $0A,$10
          DC.B      $04,$40
          DC.B      $12,$80
          DC.B      $00,$A8
          DC.B      $02,$80
          DC.B      $0F,$C0
          DC.B      $0F,$30
          DC.B      $0F,$50
          DC.B      $14,$50
          DC.B      $17,$C0
          DC.B      $33,$C0
          DC.B      $0F,$C0
          DC.B      $06,$40
          DC.B      $25,$10
          DC.B      $09,$10
          DC.B      $05,$00
          DC.B      $11,$80
          DC.B      $45,$80
          DC.B      $06,$40
          DC.B      $54,$54
          DC.B      $1,$40
          DC.B      $5,0
          DC.B      $40,$50
          DC.B      $55,$50
          DC.B      0,$50
          DC.B      $50,$50
          DC.B      $5,0
          DC.B      $50,$50
          DC.B      $5,$40
          DC.B      0,0
          DC.B      0,0




          ORG     $A300;                  ; 9 TH LINE
          DC.B      0,$2A,$80
          DC.B      0,0
          DC.B      $82,0
          DC.B      $88,$10
          DC.B      0,$54
          DC.B      5,$40
          DC.B      $D3,$C7
          DC.B      $01,$50
          DC.B      $54,0
          DC.B      4,$22
          DC.B      0,$82
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,$0C,0
          DC.B      3,0,0
          DC.B      0,3,4
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      $03,$00
          DC.B      $A1,$40
          DC.B      $15,$A0
          DC.B      $0A,$3C
          DC.B      $0E,$C0
          DC.B      $F2,$80
          DC.B      $29,$50
          DC.B      $05,$28
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,3,0,0
          DC.B      0,3,0,0
          DC.B      0,$0F,$C0,0
          DC.B      $00,$F5,$7C,$00
          DC.B      $AB,$F7,$7F,$A8
          DC.B      $AA,$AA,$AA,$AA,$AA
          DC.B      $AA
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      $A3,$28
          DC.B      $23,$20
          DC.B      $F1,$3C
          DC.B      $31,$30
          DC.B      $A0,$28
          DC.B      $10,$10
          DC.B      $EB,$AC
          DC.B      $33,$C0
          DC.B      $FF,0
          DC.B      $0F,$3C
          DC.B      3,0
          DC.B      $F3,$C0
          DC.B      3,$FC
          DC.B      $F,$30
          DC.B      2,0,8,0
          DC.B      0,0
          DC.B      0,0
          DC.B      $0A,$80
          DC.B      $AA,$80
          DC.B      $2A,$B0
          DC.B      $0D,$C0
          DC.B      $3A,$A0
          DC.B      $0A,$A8
          DC.B      $0A,$80
          DC.B      $0F,$F0
          DC.B      $3F,$FC
          DC.B      $3E,$C0
          DC.B      $FD,$FC
          DC.B      $0E,$F0
          DC.B      $FF,$F0
          DC.B      $3F,$C0
          DC.B      $01,$50
          DC.B      $65,$D0
          DC.B      $0D,$D0
          DC.B      $5F,$50
          DC.B      $1D,$C0
          DC.B      $75,$90
          DC.B      $15,$00
          DC.B      $50,$14
          DC.B      $1,$40
          DC.B      $1,$40
          DC.B      0,$50
          DC.B      $55,$50
          DC.B      0,$50
          DC.B      $50,$50
          DC.B      $1,$40
          DC.B      $50,$50
          DC.B      $1,$40
          DC.B      0,0
          DC.B      0,0





          ORG     $A400;                  ; 8 TH LINE
          DC.B      0,$0A,$AC
          DC.B      $02,$80
          DC.B      $02,0
          DC.B      $88,$54
          DC.B      $00,$40
          DC.B      $15,$10
          DC.B      $D2,$87
          DC.B      $04,$54
          DC.B      $15,$00
          DC.B      $15,$22
          DC.B      $00,$80
          DC.B      0,0,0
          DC.B      0,$0C,0
          DC.B      0,$C0,0
          DC.B      0,$0C,$10
          DC.B      2,0,0
          DC.B      8,0,0
          DC.B      $80,0,0
          DC.B      $53,$14
          DC.B      $29,$50
          DC.B      $05,$A0
          DC.B      $1A,$3C
          DC.B      $A2,$28
          DC.B      $F2,$90
          DC.B      $29,$40
          DC.B      $15,$A0
          DC.B      $A0,$82,$A0,$08,$0A,$A0,$A8,$2A,$A0
          DC.B      $AA,$00
          DC.B      $AA,$80
          DC.B      $AA,$8A,$A8,$08,$0A,$A8,$AA,$80
          DC.B      $A2,$8A,$A0,$08,$0A,$28,$A0,$82,$A0,$AA,$8A,$A0
          DC.B      $AA,$8A,$28,$A0,$0A,$A8,$A2,$82,$80
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,3,0,0
          DC.B      0,1,0,0
          DC.B      0,$0D,$C0,0
          DC.B      0,$3D,$F0,0
          DC.B      $03,$DD,$DF,$00
          DC.B      $8A,$DD,$DE,$A8
          DC.B      0,0,0,0,0
          DC.B      0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      $A3,$28
          DC.B      $23,$20
          DC.B      $F1,$3C
          DC.B      $35,$70
          DC.B      $52,$14
          DC.B      $52,$14
          DC.B      $F7,$DC
          DC.B      $F7,$F0
          DC.B      $3C,0
          DC.B      $3C,$FC
          DC.B      3,0
          DC.B      $FC,$F0
          DC.B      0,$F0
          DC.B      $3F,$7C
          DC.B      2,0,8,0
          DC.B      3,0
          DC.B      0,0
          DC.B      $02,$A0
          DC.B      $2A,$84
          DC.B      $AE,$50
          DC.B      $05,$40
          DC.B      $16,$E8
          DC.B      $4A,$A0
          DC.B      $2A,$00
          DC.B      $03,$F0
          DC.B      $FF,$F4
          DC.B      $FF,$B4
          DC.B      $FA,$BC
          DC.B      $7B,$FC
          DC.B      $6F,$FC
          DC.B      $3F,$00
          DC.B      $00,$50
          DC.B      $01,$C0
          DC.B      $17,$F4
          DC.B      $1F,$40
          DC.B      $7F,$50
          DC.B      $34,$00
          DC.B      $14,$00
          DC.B      $50,$14
          DC.B      $1,$40
          DC.B      $0,$40
          DC.B      $5,$50
          DC.B      $50,$40
          DC.B      $55,$50
          DC.B      $50,$50
          DC.B      $1,$40
          DC.B      $55,$50
          DC.B      $55,$50
          DC.B      0,0
          DC.B      0,0




          ORG     $A500;                  ; 7 TH LINE
          DC.B      3,$AA,$80
          DC.B      $82,$80
          DC.B      $02,$80
          DC.B      $0A,$55
          DC.B      $0A,$A1
          DC.B      $14,$A4
          DC.B      $D2,$87
          DC.B      $1A,$14
          DC.B      $01,$00
          DC.B      $55,$A0
          DC.B      $02,$80
          DC.B      0,$0F,$80
          DC.B      0,$30,0
          DC.B      0,$0C,$40
          DC.B      0,$80,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      $56,$54
          DC.B      $0A,$68
          DC.B      $01,$8C
          DC.B      $56,$80
          DC.B      $AA,$A8
          DC.B      $0A,$54
          DC.B      $C9,$00
          DC.B      $A6,$80
          DC.B      $A2,$8A,$A8,$2A,$02,$82,$AA,$2A,$A0
          DC.B      $AA,$00
          DC.B      $AA,$80
          DC.B      $AA,$8A,$A8,$2A,$0A,$A8,$AA,$80
          DC.B      $A2,$8A,$A8,$2A,$0A,$28,$A2,$8A,$A8,$AA,$8A,$A8
          DC.B      $AA,$8A,$28,$A0,$0A,$A8,$A2,$82,$80
          DC.B      0,1,0,0
          DC.B      0,3,0,0
          DC.B      0,$0D,$C0,0
          DC.B      0,$0D,$C0,0
          DC.B      0,$35,$70,0
          DC.B      $00,$F5,$7C,$00
          DC.B      $0F,$75,$77,$C0
          DC.B      $BF,$F7,$77,$F8
          DC.B      $55,$55,$55,$55,$55
          DC.B      $55
          DC.B      $8A,$8A,$8A,$80
          DC.B      $8A,$8A,$8A,$80
          DC.B      $A8,$A8,$A8,$00
          DC.B      $08,$A8,$A8,$00
          DC.B      $F0,$FC
          DC.B      $A5,$68
          DC.B      $25,$E0
          DC.B      $F5,$7C
          DC.B      $35,$70
          DC.B      $53,$14
          DC.B      $53,$14
          DC.B      $F7,$DC
          DC.B      $3D,$F0
          DC.B      $AF,$C0
          DC.B      $F7,$F0
          DC.B      $7,$40
          DC.B      $3F,$7C
          DC.B      $0F,$E8
          DC.B      $3D,$F0
          DC.B      2,0,8,0
          DC.B      $0A,$80
          DC.B      0,0
          DC.B      $21,$A0
          DC.B      $07,$D8
          DC.B      $A7,$5C
          DC.B      $21,$20
          DC.B      $D7,$68
          DC.B      $9F,$40
          DC.B      $29,$20
          DC.B      $04,$F0
          DC.B      $05,$F4
          DC.B      $F5,$B4
          DC.B      $3E,$F0
          DC.B      $79,$7C
          DC.B      $6D,$40
          DC.B      $3C,$40
          DC.B      $40,$74
          DC.B      $0F,$D0
          DC.B      $55,$F4
          DC.B      $25,$80
          DC.B      $7D,$F4
          DC.B      $7F,$00
          DC.B      $74,$04
          DC.B      $50,$14
          DC.B      $1,$40
          DC.B      0,$50
          DC.B      $5,$50
          DC.B      $14,$40
          DC.B      $55,$40
          DC.B      $55,$40
          DC.B      $0,$40
          DC.B      $55,$50
          DC.B      $50,$50
          DC.B      0,0






          ORG     $A600;                  ; 6 TH LINE
          DC.B      0,$8A,$A0
          DC.B      $A2,$80
          DC.B      $02,$80
          DC.B      $0A,$85
          DC.B      $2A,$A8
          DC.B      $06,$A1
          DC.B      $1A,$94
          DC.B      $4A,$90
          DC.B      $4A,$A0
          DC.B      $52,$A0
          DC.B      $02,$80
          DC.B      0,$3F,0
          DC.B      0,$C1,0
          DC.B      3,$20,0
          DC.B      0,0,0
          DC.B      0,0,$80
          DC.B      0,0,$20
          DC.B      0,0,0
          DC.B      $56,$54
          DC.B      $56,$A8
          DC.B      $AA,$BC
          DC.B      $56,$A8
          DC.B      $56,$54
          DC.B      $AA,$54
          DC.B      $FA,$A8
          DC.B      $AA,$54
          DC.B      $AA,$8A,$28,$AA,$82,$82,$8A,$28,$0
          DC.B      $28,$00
          DC.B      $2A,$00
          DC.B      $A0,$0A,$00,$AA,$8A,$00,$A0,$00
          DC.B      $AA,$8A,$28,$AA,$8A,$A8,$AA,$8A,$28,$A0,$0A,$28
          DC.B      $A0,$0A,$A8,$AA,$0A,$00,$AA,$82,$80
          DC.B      0,0,0,0
          DC.B      0,$0D,$C0,0
          DC.B      0,$35,$70,0
          DC.B      0,$D5,$5C,0
          DC.B      3,$D5,$5F,0
          DC.B      $0F,$D5,$5F,$C0
          DC.B      $3D,$55,$55,$F0
          DC.B      $BF,$DD,$DF,$F8
          DC.B      0,0,0,0,0
          DC.B      0
          DC.B      $88,$88,$88,$80
          DC.B      $88,$88,$88,$80
          DC.B      $88,$88,$88,$00
          DC.B      $08,$88,$88,$00
          DC.B      $CC,$C0
          DC.B      $AF,$E8
          DC.B      $2F,$E0
          DC.B      $F5,$7C
          DC.B      $3E,$F0
          DC.B      $57,$54
          DC.B      $57,$54
          DC.B      $F7,$DC
          DC.B      $0F,$70
          DC.B      $55,$54
          DC.B      $DF,$C0
          DC.B      $C7,$CC
          DC.B      $0F,$DC
          DC.B      $55,$54
          DC.B      $37,$C0
          DC.B      2,0,8,0
          DC.B      2,0
          DC.B      0,0
          DC.B      $29,$E0
          DC.B      $A7,$54
          DC.B      $81,$E4
          DC.B      $2F,$E0
          DC.B      $6D,$08
          DC.B      $57,$68
          DC.B      $2D,$A0
          DC.B      $C5,$7C
          DC.B      $95,$F8
          DC.B      $F5,$6C
          DC.B      $35,$70
          DC.B      $E5,$3C
          DC.B      $AD,$58
          DC.B      $F5,$4C
          DC.B      $A3,$74
          DC.B      $0F,$D0
          DC.B      $5B,$7C
          DC.B      $50,$50
          DC.B      $57,$94
          DC.B      $7F,$00
          DC.B      $77,$28
          DC.B      $50,$14
          DC.B      $1,$40
          DC.B      $50,$50
          DC.B      0,$50
          DC.B      $15,$40
          DC.B      $50,0
          DC.B      $50,0
          DC.B      $40,$50
          DC.B      $50,$50
          DC.B      $50,$50
          DC.B      0,0





          ORG     $A700;                  ; 5 TH LINE
          DC.B      0,$0A,$80
          DC.B      $28,0
          DC.B      $1A,$94
          DC.B      $06,$A1
          DC.B      $8A,$A1
          DC.B      $0A,$85
          DC.B      $02,$80
          DC.B      $52,$A0
          DC.B      $2A,$A8
          DC.B      $4A,$90
          DC.B      $1A,$94
          DC.B      0,$0D,$C0
          DC.B      0,$0C,0
          DC.B      0,3,0
          DC.B      $0C,0,$C0
          DC.B      $30,$C0,$0C
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      $AA,$A8
          DC.B      $56,$80
          DC.B      $0A,$8C
          DC.B      $0A,$68
          DC.B      $56,$54
          DC.B      $A6,$80
          DC.B      $C9,$00
          DC.B      $0A,$54
          DC.B      $AA,$8A,$28,$A2,$82,$82,$80,$2A,$80
          DC.B      $28,$00
          DC.B      $0A,$80
          DC.B      $A0,$0A,$A0,$A2,$8A,$A0,$A0,$00
          DC.B      $AA,$8A,$28,$A2,$8A,$A8,$AA,$8A,$00,$AA,$0A,$28
          DC.B      $AA,$02,$A0,$AA,$8A,$A0,$AA,$02,$80
          DC.B      0,0,0,0
          DC.B      0,3,0,0
          DC.B      0,$0D,$C0,0
          DC.B      0,$0D,$C0,0
          DC.B      0,$35,$70,0
          DC.B      0,$F5,$7C,0
          DC.B      $0F,$75,$77,$C0
          DC.B      $AA,$F7,$76,$A8
          DC.B      $3F,$FF,$FF,$FF,$FF
          DC.B      $FC
          DC.B      $8A,$88,$88,$80
          DC.B      $88,$88,$88,$80
          DC.B      $A8,$88,$88,$00
          DC.B      $A8,$88,$88,$00
          DC.B      $CC,$C0
          DC.B      $2F,$E0
          DC.B      $2E,$E0
          DC.B      $3E,$F0
          DC.B      $3E,$F0
          DC.B      $27,$60
          DC.B      $17,$50
          DC.B      $C7,$CC
          DC.B      $DF,$C0
          DC.B      $FF,$FC
          DC.B      $0F,$70
          DC.B      $F7,$DC
          DC.B      $37,$C0
          DC.B      $FF,$FC
          DC.B      $F,$DC
          DC.B      2,0,8,0
          DC.B      2,0
          DC.B      0,0
          DC.B      $81,$E4
          DC.B      $A7,$54
          DC.B      $29,$E0
          DC.B      $AF,$E8
          DC.B      $2D,$A0
          DC.B      $57,$68
          DC.B      $6D,$88
          DC.B      $F5,$6C
          DC.B      $95,$F8
          DC.B      $C5,$7C
          DC.B      $75,$7C
          DC.B      $F5,$4C
          DC.B      $AD,$58
          DC.B      $E5,$7C
          DC.B      $5B,$7C
          DC.B      $01,$C0
          DC.B      $A3,$74
          DC.B      $50,$50
          DC.B      $77,$28
          DC.B      $34,$00
          DC.B      $57,$94
          DC.B      $54,$54
          DC.B      $1,$40
          DC.B      $50,$50
          DC.B      $40,$50
          DC.B      $5,$40
          DC.B      $50,$0
          DC.B      $50,$10
          DC.B      $50,$50
          DC.B      $50,$50
          DC.B      $50,$50
          DC.B      0,0



          ORG     $A800;                  ; 4 TH LINE
          DC.B      $00,$E8,$B0
          DC.B      $0A,0
          DC.B      $D2,$87
          DC.B      $14,$A4
          DC.B      $80,$40
          DC.B      $0A,$55
          DC.B      $02,$80
          DC.B      $55,$A0
          DC.B      $4A,$A2
          DC.B      $1A,$14
          DC.B      $5E,$D4
          DC.B      0,$0C,$C0
          DC.B      0,$C3,0
          DC.B      0,$4C,0
          DC.B      0,$30,0
          DC.B      0,0,0
          DC.B      3,0,0
          DC.B      0,0,0
          DC.B      $A2,$28
          DC.B      $1A,$3C
          DC.B      $05,$A0
          DC.B      $29,$50
          DC.B      $53,$14
          DC.B      $15,$A0
          DC.B      $29,$40
          DC.B      $F2,$90
          DC.B      $AA,$8A,$28,$A2,$82,$82,$80,$2A,$80
          DC.B      $28,$00
          DC.B      $A2,$80
          DC.B      $A0,$0A,$A0,$A2,$8A,$A0,$A0,$00
          DC.B      $A2,$8A,$28,$A2,$8A,$28,$AA,$8A,$00,$AA,$0A,$28
          DC.B      $AA,$02,$A0,$A2,$8A,$A0,$A2,$82,$80
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,3,0,0
          DC.B      0,1,0,0
          DC.B      0,$0D,$C0,0
          DC.B      0,$3D,$F0,0
          DC.B      $03,$DD,$DF,$00
          DC.B      $AB,$DD,$DF,$A8
          DC.B      0,0,0,0,0
          DC.B      0
          DC.B      $88,$08,$88,$80
          DC.B      $88,$88,$88,$80
          DC.B      $88,$88,$88,$00
          DC.B      $88,$88,$88,$00
          DC.B      $F0,$FC
          DC.B      $21,$20
          DC.B      $21,$20
          DC.B      $3E,$F0
          DC.B      $3A,$B0
          DC.B      $1F,$D0
          DC.B      $1F,$D0
          DC.B      $07,$40
          DC.B      $F7,$F0
          DC.B      $AF,$C0
          DC.B      $3D,$F0
          DC.B      $F7,$DC
          DC.B      $3D,$F0
          DC.B      $0F,$E8
          DC.B      $3F,$7C
          DC.B      $02,$00,$08,$00         ; $A,$80,$2A,0
          DC.B      2,0
          DC.B      0,0
          DC.B      $A7,$5C
          DC.B      $07,$D8
          DC.B      $21,$A0
          DC.B      $A5,$68
          DC.B      $29,$20
          DC.B      $9F,$40
          DC.B      $D7,$68
          DC.B      $F5,$B4
          DC.B      $05,$F4
          DC.B      $04,$F0
          DC.B      $F1,$3C
          DC.B      $3C,$40
          DC.B      $6D,$40
          DC.B      $79,$7C
          DC.B      $55,$F4
          DC.B      $65,$D0
          DC.B      $40,$74
          DC.B      $50,$50
          DC.B      $74,$04
          DC.B      $75,$90
          DC.B      $7D,$54
          DC.B      $15,$50
          DC.B      $05,$40
          DC.B      $55,$50
          DC.B      $55,$50
          DC.B      $1,$40
          DC.B      $55,$50
          DC.B      $55,$50
          DC.B      $55,$50
          DC.B      $55,$50
          DC.B      $55,$50
          DC.B      0,0



          ORG     $A900;                  ; THIRD LINE
          DC.B      0,$C,0
          DC.B      $A2,$80
          DC.B      $D2,$87
          DC.B      $15,$10
          DC.B      $20,$54
          DC.B      $88,$54
          DC.B      $02,$00
          DC.B      $15,$22
          DC.B      $01,$02
          DC.B      $04,$54
          DC.B      $5E,$D4
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,$C0
          DC.B      1,2,$30
          DC.B      0,3,0
          DC.B      0,0,$C0
          DC.B      $0C,0,0
          DC.B      $0E,$C0
          DC.B      $0A,$3C
          DC.B      $15,$A0
          DC.B      $A1,$40
          DC.B      $43,$04
          DC.B      $05,$28
          DC.B      $29,$50
          DC.B      $F2,$80
          DC.B      $AA,$8A,$28,$A2,$82,$82,$8A,$28,$0
          DC.B      $A8,$00
          DC.B      $A2,$80
          DC.B      $A0,$0A,$00,$A2,$8A,$00,$A0,$00
          DC.B      $A2,$8A,$28,$A2,$8A,$28,$AA,$8A,$28,$A0,$0A,$28
          DC.B      $A0,$0A,$A8,$A2,$8A,$00,$A2,$82,$80
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,3,0,0
          DC.B      0,3,0,0
          DC.B      0,$0F,$C0,0
          DC.B      0,$F5,$7C,0
          DC.B      $AF,$EF,$EF,$E8
          DC.B      $2A,$AA,$AA,$AA,$AA
          DC.B      $A8
          DC.B      $8A,$8A,$8A,$80
          DC.B      $8A,$8A,$8A,$80
          DC.B      $A8,$A8,$A8,$00
          DC.B      $88,$A8,$A8,$00
          DC.B      0,0
          DC.B      $05,$40
          DC.B      $05,$40
          DC.B      $FA,$BC
          DC.B      $3D,$F0
          DC.B      $5C,$D4
          DC.B      $5C,$D4
          DC.B      $03,$00
          DC.B      $3C,$FC
          DC.B      $3C,0
          DC.B      $F7,$F0
          DC.B      $F7,$DC
          DC.B      $3F,$7C
          DC.B      0,$F0
          DC.B      $FC,$F0
          DC.B      3,0,$0C,0
          DC.B      2,0
          DC.B      0,0
          DC.B      $AE,$50
          DC.B      $2A,$84
          DC.B      $02,$A0
          DC.B      $A3,$28
          DC.B      $2A,$00
          DC.B      $4A,$A0
          DC.B      $16,$E8
          DC.B      $FF,$B4
          DC.B      $FF,$F4
          DC.B      $03,$F0
          DC.B      $F1,$3C
          DC.B      $3F,$00
          DC.B      $7B,$FC
          DC.B      $7B,$FC
          DC.B      $17,$F4
          DC.B      $25,$10
          DC.B      $01,$50
          DC.B      $A0,$A0
          DC.B      $16,$00
          DC.B      $45,$80
          DC.B      $7F,$50
          DC.B      $5,$40
          DC.B      $5,$40
          DC.B      $15,$40
          DC.B      $55,$40
          DC.B      $0,$40
          DC.B      $55,$50
          DC.B      $15,$40
          DC.B      $15,$50
          DC.B      $15,$40
          DC.B      $15,$40
          DC.B      0,0
          DC.B      0,0




          ORG     $AA00;                  ; SECOND LINE
          DC.B      0,0,0
          DC.B      $A0,$80
          DC.B      $D3,$C7
          DC.B      $05,$40
          DC.B      $00,$15
          DC.B      $88,$10
          DC.B      $82,$00
          DC.B      $04,$22
          DC.B      $15,$08
          DC.B      $01,$50
          DC.B      $52,$14
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,$0C,0
          DC.B      $0C,$80,$0C
          DC.B      0,0,0
          DC.B      0,0,$30
          DC.B      $0F,$C0
          DC.B      $02,$30
          DC.B      $15,$A0
          DC.B      $81,$00
          DC.B      $03,$00
          DC.B      $01,$08
          DC.B      $29,$50
          DC.B      $32,$00
          DC.B      $A2,$8A,$A8,$A2,$82,$82,$AA,$2A,$A0
          DC.B      $A8,$00
          DC.B      $AA,$80
          DC.B      $A0,$0A,$A8,$A2,$8A,$A8,$A0,$00
          DC.B      $AA,$8A,$A8,$A2,$8A,$A8,$A2,$8A,$A8,$AA,$8A,$A8
          DC.B      $AA,$8A,$28,$AA,$8A,$A8,$AA,$8A,$A0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,3,0,0
          DC.B      0,3,0,0
          DC.B      0,$3D,$F0,0
          DC.B      $2E,$AF,$CA,$F0
          DC.B      0,0,0,0,0
          DC.B      0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      $0D,$C0
          DC.B      $0D,$C0
          DC.B      $FD,$FC
          DC.B      $34,$70
          DC.B      $04,$40
          DC.B      $08,$80
          DC.B      $03,$00
          DC.B      3,0
          DC.B      $0F,$00
          DC.B      $DF,0
          DC.B      $33,$C0
          DC.B      $EB,$AC
          DC.B      $0F,$30
          DC.B      $01,$5C
          DC.B      0,0,0,0
          DC.B      2,0
          DC.B      0,0
          DC.B      $2A,$B0
          DC.B      $AA,$80
          DC.B      $0A,$80
          DC.B      $A3,$28
          DC.B      $0A,$80
          DC.B      $0A,$A8
          DC.B      $3A,$A0
          DC.B      $3E,$C0
          DC.B      $3F,$FC
          DC.B      $0F,$F0
          DC.B      $F0,$3C
          DC.B      $3F,$C0
          DC.B      $F3,$F0
          DC.B      $0E,$F0
          DC.B      $0D,$D0
          DC.B      0,0
          DC.B      $01,$50
          DC.B      $60,$90
          DC.B      $15,$00
          DC.B      0,0
          DC.B      $1D,$C0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0



          ORG     $AB00;                  ;FIRST LINE
          DC.B      0,0,0
          DC.B      $A0,0
          DC.B      $E4,$1B
          DC.B      $02,$40
          DC.B      0,0
          DC.B      $20,0
          DC.B      $28,0
          DC.B      0,$0A
          DC.B      $54,0
          DC.B      $01,$80
          DC.B      $44,$44
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,$0C,$10
          DC.B      0,$80,0
          DC.B      0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      $03,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      $82,$82,$A0,$A2,$8A,$A0,$A8,$2A,$A0
          DC.B      $28,$00
          DC.B      $2A,$00
          DC.B      $A0,$0A,$A8,$A2,$8A,$A8,$A0,$00
          DC.B      $2A,$0A,$A0,$A2,$82,$A0,$82,$82,$A0,$AA,$8A,$A0
          DC.B      $AA,$8A,$28,$AA,$0A,$A8,$AA,$0A,$A0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,3,0,0
          DC.B      0,$0F,$C0,0
          DC.B      $02,$AF,$EA,$88
          DC.B      $15,$55,$55,$55,$55
          DC.B      $50
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      $04,$40
          DC.B      $04,$40
          DC.B      $34,$70
          DC.B      $04,$40
          DC.B      0,0
          DC.B      $04,$40
          DC.B      $01,$00
          DC.B      $0,0
          DC.B      $FF,0
          DC.B      $03,0
          DC.B      $CB,$8C
          DC.B      $03,0
          DC.B      $03,$FC
          DC.B      0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      3,0
          DC.B      $0A,$10
          DC.B      $A8,$00
          DC.B      $0A,$00
          DC.B      $80,$08
          DC.B      $02,$80
          DC.B      $00,$A8
          DC.B      $12,$80
          DC.B      $0F,$50
          DC.B      $0F,$30
          DC.B      $0F,$C0
          DC.B      $30,$30
          DC.B      $0F,$C0
          DC.B      $33,$C0
          DC.B      $17,$C0
          DC.B      $09,$10
          DC.B      $00,$00
          DC.B      $06,$40
          DC.B      $10,$40
          DC.B      $06,$40
          DC.B      $00,$00
          DC.B      $11,$80


          ORG     $AC00
EXPLO7    DC.B      0,0,0
PERCENT   DC.B      0,0
SCORP0    DC.B      0,0
SCORP1    DC.B      0,0
SCORP2    DC.B      0,0
SCORP3    DC.B      0,0
SCORP4    DC.B      0,0
SCORP5    DC.B      0,0
SCORP6    DC.B      0,0
SCORP7    DC.B      0,0
SCORPF    DC.B      0,0
EXPLO6    DC.B      0,0,0
EXPLO5    DC.B      0,0,0
EXPLO4    DC.B      0,0,0
EXPLO3    DC.B      0,0,0
EXPLO2    DC.B      0,0,0
EXPLO1    DC.B      0,0,0
EXPLO0    DC.B      0,0,0
NEWBIRD0  DC.B      0,0
NEWBIRD1  DC.B      0,0
NEWBIRD2  DC.B      0,0
NEWBIRD3  DC.B      0,0
NEWBIRD4  DC.B      0,0
NEWBIRD5  DC.B      0,0
NEWBIRD6  DC.B      0,0
NEWBIRD7  DC.B      0,0
NOVICE    DC.B      0,0,0,0,0,0,0,0,0
SONE      DC.B      0,0
STWO      DC.B      0,0
LEVEL     DC.B      0,0,0,0,0,0,0,0
ADVANCED  DC.B      0,0,0,0,0,0,0,0,0,0,0,0
EXPERT    DC.B      0,0,0,0,0,0,0,0,0
TWINKLE   DC.B      0,0,0,0
TWINKL1   DC.B      0,0,0,0
TWINKL2   DC.B      0,0,0,0
TWINKL3   DC.B      0,0,0,0
TWINKL4   DC.B      0,0,0,0
TWINKL5   DC.B      0,0,0,0
TWINKL6   DC.B      0,0,0,0
TWINKL7   DC.B      0,0,0,0
LSHIELD   DC.B      0,0,0,0,0
RSHIELD   DC.B      0
FOUTYPE   DC.B      0,0,0,0
EIGTYPE   DC.B      0,0,0,0
THOTYPE   DC.B      0,0,0,0
SIXTYPE   DC.B      0,0,0,0
SPECIAL   DC.B      0,0
BLUBUG    DC.B      0,0
BLUBUGF   DC.B      0,0
REDBUG    DC.B      0,0
REDBUGF   DC.B      0,0
BOSGAL    DC.B      0,0
BOSGALF   DC.B      0,0
HEROS     DC.B      0,0
HERO1     DC.B      0,0
HERO2     DC.B      0,0
HERO3     DC.B      0,0
HERO4     DC.B      0,0
HERO5     DC.B      0,0
HERO6     DC.B      0,0
HERO7     DC.B      0,0
MISSLE    DC.B      0,0,0,0
MISSLE4   DC.B      0,0
STARGRAF  DC.B      0,0
BLUBUG1   DC.B      0,0
BLUBUG2   DC.B      0,0
BLUBUG3   DC.B      0,0
BLUBUG4   DC.B      0,0
BLUBUG5   DC.B      0,0
BLUBUG6   DC.B      0,0
BLUBUG7   DC.B      0,0
REDBUG1   DC.B      0,0
REDBUG2   DC.B      0,0
REDBUG3   DC.B      0,0
REDBUG4   DC.B      0,0
REDBUG5   DC.B      0,0
REDBUG6   DC.B      0,0
REDBUG7   DC.B      0,0
BOSGAL1   DC.B      0,0
BOSGAL2   DC.B      0,0
BOSGAL3   DC.B      0,0
BOSGAL4   DC.B      0,0
BOSGAL5   DC.B      0,0
BOSGAL6   DC.B      0,0
BOSGAL7   DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0




          ORG     $AD00
          DC.B      0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0,0
          DC.B      0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0





          ORG     $AE00
          DC.B      0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0,0
          DC.B      0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0





          ORG     $AF00
          DC.B      0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0,0,0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0,0
          DC.B      0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0,0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0
          DC.B      0,0