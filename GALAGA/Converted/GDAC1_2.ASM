	processor 6502 

        ;   ORG     $CC00

;
;THIS SUBROUTINE INITIALIZES A SHIP TO CAUSE A BOSS ATTACK
;THE SHIP IS POINTED TO BY THE Y REGISTER
;THE Y REG IS SAVED
;
ATTKBO    LDA     CAPQUAN;                ;SEE IF CAN DO A CAPTURE
          BEQ     DONTCAP
          LDA     HEROREAP;               ;SEE IF HERO IS SET TO REAPPEAR
          BNE     DONTCAP
          LDA     TYPE+40;                ;SEE IF HERO ALREADY CAPTURED
          BNE     DONTCAP
          LDA     TYPE+62
          BNE     DONTCAP

          LDX     #6;                     ;POINT X TO FIRST BOSS
          JSR     TESTBOSS
          LDX     #17
          JSR     TESTBOSS
          LDX     #26
          JSR     TESTBOSS
          LDX     #35
          JSR     TESTBOSS
          JMP     INITCAPX

TESTBOSS  LDA     TYPE,X;                 ;SEE IF BOSS ALIVE
          BNE     TESTBOS1
          RTS
TESTBOS1  LDA     MODE,X
          BPL     TESTBOS2
          RTS
TESTBOS2  AND     #$F
          CMP     #2
          BPL     TESTBOS3
          RTS
TESTBOS3  CMP     #5
          BPL     TESTBOS4
          PLA
          PLA;                            ;BOOT THE RTS
          JMP     DONTCAP
TESTBOS4  RTS


DONTCAP
          LDA     #$FF
          STA     CAPQUAN;                ;RESET ABILITY TO CAPTURE
          TAX
          STA     BOZO8


ESCLOOP   LDX     BOZO8
          INX
          CPX     #4
          BNE     BIGBIRD
          RTS
BIGBIRD
          LDA     ESCARG0,X
          STA     BOZO0

          LDA     ESCARG1,X
          STA     BOZO1

          LDA     ESCARG2,X
          STA     BOZO2

          LDA     ESCARG3,X
          STA     BOZO3

          LDA     ESCARG4,X
          STA     BOZO4

          LDA     ESCARG5,X
          STA     BOZO5

          LDA     ESCARG6,X
          STA     BOZO6

          LDA     ESCARG7,X
          STA     BOZO7

          STX     BOZO8


          CPY     BOZO0;                  ;;*0 SEE IF FIRST BOSS TO GET ESCORTS
          BNE     ESCLOOP
          LDX     #40;                    ;SEE IF OWNS CAPTURED HERO SHIP
          LDA     TYPE,X
          BEQ     NOESC1
          LDA     CHTAB40
          CMP     BOZO1;                  ; ;*1
          BNE     NOESC1
          LDA     MODE,X
          BEQ     YES1
          RTS

YES1
          JSR     STRTESCB;               ;YES, OWNS CAPTURED HERO SHIP
          LDA     #$FF
          STA     COUNTXY,X
NOESC1    LDX     BOZO2;                  ;;*2 CAUSE BOSS TO ATTACK
          JSR     STRTESCB
          LDA     #$0F
          STA     COUNTXY,X
          INC     AIRBORNE
          LDX     BOZO3;                  ;;*3 SEE IF FIRST ESCORT AROUND
          LDA     TYPE,X
          BEQ     NOESC1A
          LDA     MODE,X
          BNE     NOESC1A
          JSR     STRTESCB
          LDA     BOZO4;                  ;;*4 SAY IS LEFT ESCORT GOING TO LEFT
          STA     COUNTXY,X
          INC     AIRBORNE
          LDA     #$10;                   ;SAY HAS ONE MORE ESCORT
          CLC
          ADC     COUNTXY,Y
          STA     COUNTXY,Y
NOESC1A   LDX     BOZO5;                  ;;*5 SEE IF SECOND ESCORT AROUND
          LDA     TYPE,X
          BEQ     NOESC1B
          LDA     MODE,X
          BNE     NOESC1B
          JSR     STRTESCB
          LDA     BOZO6;                  ;;*6 SAY IS RIGHT ESCORT GOING TO LEFT
          STA     COUNTXY,X
          INC     AIRBORNE
          LDA     #$10;                   ;SAY HAS ONE MORE ESCORT
          CLC
          ADC     COUNTXY,Y
          STA     COUNTXY,Y
          JMP     ESCLOOP

STRTESCB
          BIT     BOZO7
          BPL     SNUFFY
          JSR     STRTESCN
          RTS
SNUFFY    JSR     STRTESCP
NOESC1B   RTS


ESCARG0   DC      6,26,35,17
ESCARG1   DC      3,4,5,6
ESCARG2   DC      6,26,35,17
ESCARG3   DC      20,29,38,39
ESCARG4   DC      0,0,2,2
ESCARG5   DC      38,39,30,21
ESCARG6   DC      1,1,3,3
ESCARG7   DC      0,0,$80,$80;             ; P OR N

INITCAPX  LDA     #0
          STA     CAPQUAN;                ;DISABLE FURTHER CAPTURES
          LDA     #<PEELOFF
          STA     ML,Y
          LDA     #>PEELOFF
          STA     MH,Y
          LDA     TYPE,Y
          ORA     #$80
          STA     TYPE,Y
          LDA     #2
          STA     MODE,Y
          INC     AIRBORNE
          RTS


;
;THIS SUBROUTINE INITIATES A SHIP POINTED TO BY THE X REG TO A POSITIVE BOSS
;ATTACK
;
STRTESCP  LDA     #<BOTBL1;             ;INIT TABLE POINTERS TO PEELOFF
          STA     ML,X
          LDA     #>BOTBL1
          STA     MH,X
          LDA     #$85
          STA     MODE,X
          RTS


;
;THIS SUBROUTINE INITIATES A SHIP POINTED TO BY THE X REG TO A NEGATIVE BOSS
;ATTACK
;
STRTESCN  LDA     #<BOTBL1;             ;INIT TABLE POINTERS TO PEELOFF
          STA     ML,X
          LDA     #>BOTBL1
          STA     MH,X
          LDA     #$C5
          STA     MODE,X
          RTS


;
;THIS SUBROUTINE INITIALIZES A SHIP TO CAUSE A CONTINUED BOSS ATTACK
;THE SHIP IS POINTED TO BY THE Y REGISTER
;THE Y REG IS SAVED
;
ATTKBO1
DONTCAP1  LDX     #40;                    ;SEE IF OWNS CAPTURED HERO
          LDA     TYPE,X
          BEQ     FINIBOAT
          CPY     #40
          BNE     DONTCCC
          LDA     CHTAB40
          BPL     DONTCCC1
DONTCCC   LDA     CHTAB,Y
DONTCCC1  CMP     CHTAB40
          BNE     FINIBOAT
          LDA     MODE,X;                 ;SEE IF HERO READY
          CMP     #5
          BEQ     YEHP
          RTS
YEHP      JSR     COTBOATK
FINIBOAT  TYA;                            ;CAUSE BOSS TO CONTINUE REGULAR BOSS
          TAX;                            ;ATTACK
          JSR     COTBOATK
          RTS

;
;THIS SUBROUTINE INITIATES A CONTINUED REGULAR BOSS ATTACK
;THE SHIP INITIATED IS IN THE X REG
;
COTBOATK
          CPX     #40
          BNE     COTB1
          LDA     CHTAB40
          BPL     COTB2
COTB1     LDA     CHTAB,X;                ;SEE IF STARTED ON LEFT
COTB2     CMP     #5;                     ;OR RIGHT
          BPL     RIGATK2
          LDA     #72;                    ;LEFT SIDE, SO GO TO LEFT CORNER
          SEC
          SBC     XCORD,X
          JMP     YGO2
RIGATK2   LDA     #88;                    ;RIGHT SIDE, SO GO TO RIGHT CORNER
          SEC
          SBC     XCORD,X
YGO2      STA     ML,X
          LDA     #79
          STA     MH,X
          LDA     #$86
          STA     MODE,X
          LDA     #$0F
          STA     COUNTXY,X
          RTS


;
;
;THIS SUBROUTINE MOVES A BOSS SHIP POINTED TO BY Y REG ONE STEP BY CALLING
;A SUBROUTINE THAT USES A MOTION TABLE.  IT IS PHASE ONE OF BOSS ATTACK.
;
;IT HAS NO PERMANENT LOCAL VARIBLES
;ITS TEMPORARY VARIBLES ARE:
;TEMP1    DS      2;                      ;0 PAGE
;
;CONSTANTS ARE
;
;Y REGISTER IS SAVED, ALL OTHER
;REGISTERS ARE DESTROYED
;
BOSSATK1  JSR     MSHBTBL;                ;CALL SUBROUTINE TO MOVE SHIP BY TABLE
          TXA;                            ;SEE IF END OF TABLE
          BNE     ISEND
          RTS
ISEND     LDA     COUNTXY,Y;              ;SEE IF IS BOSS SHIP
          CMP     #$0F
          BCC     ESCORT1
          CPY     #40
          BNE     RIG1
          LDA     CHTAB40
          BPL     RIG2
RIG1      LDA     CHTAB,Y;                ;BOSS SHIP, SEE IF STARTED ON LEFT
RIG2      CMP     #5;                     ;OR RIGHT
          BPL     RIGATK
          LDA     #72;                    ;LEFT SIDE, SO GO TO LEFT CORNER
          JMP     YGO
RIGATK    LDA     #88;                    ;RIGHT SIDE, SO GO TO RIGHT CORNER
YGO       SEC
          SBC     XCORD,Y
          STA     ML,Y
          LDA     #79
          STA     MH,Y
          LDA     #$86
          STA     MODE,Y
          RTS
ESCORT1   CMP     #0;                     ;SEE IF LEFT ESCORT GOING TO LEFT
          BNE     NOTLL
          LDA     #65
          JMP     YGO
NOTLL     CMP     #1;                     ;SEE IF RIGHT ESCORT GOING TO LEFT
          BNE     NOTRL
          LDA     #79
          JMP     YGO
NOTRL     CMP     #2;                     ;SEE IF LEFT ESCORT GOING TO RIGHT
          BNE     NOTLR
          LDA     #81
          JMP     YGO
NOTLR     LDA     #95;                    ;IS RIGHT ESCORT GOING RIGHT
          JMP     YGO


;
;THIS SUBROUTINE OPERATES PHASE TWO OF BOSS ATTACK. IT BRINGS THE SHIP TO THE
;LOOP
;THE SHIP IS POINTED TO BY THE Y REGISTER
;THE Y REGISTER IS SAVED
;
BOSSATK2  JSR     MOVBOS;                 ;CALL SUBROUTINE TO MOVE SHIP BY STEPS
          LDA     MH,Y;                   ;SEE IF FINISHED PHASE 2
          BEQ     CHAGAT
          RTS
CHAGAT    LDA     #<BOTBL2;             ;FINISHED PHASE 2, INITIALIZE FOR LOOP
          STA     ML,Y
          LDA     #>BOTBL2
          STA     MH,Y
          LDA     COUNTXY,Y;              ;SEE IF IS BOSS SHIP
          CMP     #$0F
          BCC     ESCORT2
          CPY     #40
          BNE     POSS1
          LDA     CHTAB40
          BPL     POSS2
POSS1     LDA     CHTAB,Y;                ;BOSS SHIP, SEE IF STARTED ON LEFT
POSS2     CMP     #5;                     ;OR RIGHT
          BPL     NEGATTK1
POSATTK1  LDA     #$87
          JMP     MAKEATK1
NEGATTK1  LDA     #$C7
MAKEATK1  STA     MODE,Y
          RTS
ESCORT2   CMP     #2;                     ;ESCORTS, SEE IF GOING LEFT
          BPL     NEGATTK1
          JMP     POSATTK1


;
;
;THIS SUBROUTINE MOVES A BOSS SHIP POINTED TO BY Y REG ONE STEP BY CALLING
;A SUBROUTINE THAT USES A MOTION TABLE.  IT IS PHASE THREE OF BOSS ATTACK.
;IT IS THE LOOP.
;IT HAS NO PERMANENT LOCAL VARIBLES
;ITS TEMPORARY VARIBLES ARE:
;TEMP1    DS      2;                      ;0 PAGE
;
;CONSTANTS ARE
;
;Y REGISTER IS SAVED, ALL OTHER
;REGISTERS ARE DESTROYED
;
BOSSATK3  JSR     MSHBTBL;                ;CALL SUBROUTINE TO MOVE SHIP BY TABLE
          TXA;                            ;SEE IF END OF TABLE
          BNE     ISEND1
          RTS
ISEND1    LDA     COUNTXY,Y;              ;SEE IF IS BOSS SHIP
          CMP     #$0F
          BCC     ESCORT3
          CPY     #40
          BNE     POOT1
          LDA     CHTAB40
          BPL     POOT2
POOT1     LDA     CHTAB,Y;                ;BOSS SHIP, SEE IF STARTED ON LEFT
POOT2     CMP     #5;                     ;OR RIGHT
          BPL     RIGATK1
          LDA     #10;                    ;LEFT SIDE, SO GO TO LEFT CORNER
          JMP     YGO1
RIGATK1   LDA     #150;                   ;RIGHT SIDE, SO GO TO RIGHT CORNER
YGO1      SEC
          SBC     XCORD,Y
          STA     ML,Y
          LDA     #100
          STA     MH,Y
          LDA     #$88
          STA     MODE,Y
          RTS
ESCORT3   CMP     #0;                     ;SEE IF LEFT ESCORT GOING TO LEFT
          BNE     NOTLL1
          LDA     #3
          JMP     YGO1
NOTLL1    CMP     #1;                     ;SEE IF RIGHT ESCORT GOING TO LEFT
          BNE     NOTRL1
          LDA     #17
          JMP     YGO1
NOTRL1    CMP     #2;                     ;SEE IF LEFT ESCORT GOING TO RIGHT
          BNE     NOTLR1
          LDA     #143
          JMP     YGO1
NOTLR1    LDA     #157;                   ;IS RIGHT ESCORT GOING RIGHT
          JMP     YGO1


;
;THIS SUBROUTINE OPERATES PHASE FOUR OF BOSS ATTACK. IT BRINGS THE SHIP TO THE
;END
;THE SHIP IS POINTED TO BY THE Y REGISTER
;THE Y REGISTER IS SAVED
;
BOSSATK4  JSR     MOVBOS;                 ;CALL SUBROUTINE TO MOVE SHIP BY STEPS
          LDA     MH,Y;                   ;SEE IF FINISHED PHASE 4
          BEQ     CHAGAT1
          RTS
CHAGAT1   LDA     #$82;                   ;FINISHED PHASE 4, RETURN SHIP TO TOP
          STA     MODE,Y
          RTS


;
;THIS SUBROUTINE IS FOR BOSS GALAGAS, IT MOVES THE SHIP BY STEPS
;
MOVBOS
          LDA     #$FF
          STA     BOZO0;                  ;USED AS A TEMP COUNTER
MOVBOS2   TYA;                            ;TRANSFER Y REG TO X REG
          TAX
          LDA     ML,X;                   ;GET XTOGO
          BEQ     MBOSZER1;               ;SEE IF XTOGO IS ZERO
          BPL     MBOSPOS;                ;SEE IF XTOGO IS POSITIVE
          DEC     XCORD,X;                ;XTOGO IS NEGATIVE
          INC     ML,X
          LDA     #5;                     ;SET ANGLE
          JMP     MBOSZER
MBOSPOS   INC     XCORD,X;                ;XTOGO IS POSITIVE
          DEC     ML,X
          LDA     #3;                     ;SET ANGLE
          JMP     MBOSZER
MBOSZER1  LDA     #4;                     ;SET ANGLE
MBOSZER   STA     ANGLE,X;                ;STORE ANGLE
          INC     YCORD,X;                ;MAKE SHIP GO DOWN ONE STEP
          DEC     MH,X
          BEQ     ENDMBOS
          LDA     MOMENTUM,Y;             ;SEE IF TWICE AS FAST
          BPL     ENDMBOS
          INC     BOZO0
          BEQ     MOVBOS2
ENDMBOS   RTS