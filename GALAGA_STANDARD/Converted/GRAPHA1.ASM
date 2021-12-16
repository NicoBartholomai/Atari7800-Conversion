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

DLSTLST1  DS      63
DLSTLST2  DS      63

NEWCOLS   DS      10
NEWTYPE   DS      41


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
LISTSIZ2  DS      9;                      ;SECOND SET OF LIST SIZES
COLPOS    DS      10

DUMYHDR   DS      7

;;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*

