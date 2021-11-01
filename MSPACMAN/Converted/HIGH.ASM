	processor 6502 

;*  HIGH           HIGH SCORE ROUTINES


;*  THIS ROUTINE DISPLAYS THE HIGH SCORES FOR THE GAME
HOLDSCOR  LDA     HSCHERE;                ;SEE IF HI SCORE CART IS THERE
          BEQ     HOSOUT

          LDX     #$07
HOSLOOP   TXA;                            ;SAVE X
          PHA
          JSR     HSETTEMP;               ;SET UP TEMPLATE FOR HSC DATA BLOCK
          LDA     #$04;                   ;SET TIME TO SEE TABLE
          STA     HSCRAM+$0E
          PLA;                            ;GET OUR X BACK
          PHA
          JSR     HSETDIF;                ;UPDATE HSC DATA BLOCK FOR DIFFICULTY
          JSR     HSCATRCT
          PLA;                            ;RESTORE X
          TAX
          DEX
          BPL     HOSLOOP
HOSOUT    RTS


;*  THIS ROUTINE ENTERS A NEW HI SCORE AND SHOWS THE HI SCORE TABLE
HNEWSCOR  LDA     HSCHERE;                ;SEE IF HI SCORE CART IS THERE
          BEQ     HOSOUT

          JSR     HSETTEMP;               ;SET UP TEMPLATE FOR HSC DATA BLOCK
          JSR     HSETDIFC;               ;SET DIFFICULTY
          LDA     #$00
          JSR     HSETPLAY;               ;SET PLAYER 1
          JSR     HSCENTER;               ;SHOW HSC TABLE
          LDA     TWOPLAYR
          BEQ     HNSOUT

          JSR     HSETTEMP;               ;SET UP TEMPLATE FOR HSC DATA BLOCK
          JSR     HSETDIFC;               ;SET DIFFICULTY
          LDA     #$01
          JSR     HSETPLAY;               ;SET PLAYER 2
          JSR     HSCENTER

HNSOUT    JSR     HSETTEMP;               ;SET UP TEMPLATE FOR HSC DATA BLOCK
          LDA     #$09;                   ;SET TIME TO SEE TABLE - 10 SECONDS
          STA     HSCRAM+$0E
          JSR     HSETDIFC
          ;                               ;FALL THROUGH

;*  DO THE HSCATRCT
HSCATRCT  LDX     #<HSCRAM;             ;AND DO IT
          LDY     #>HSCRAM
          JSR     $3FFA;                  ;DO HSCATRCT
          JSR     OURINIT;                ;FIX OUR STATE
          JMP     SEEBAUTO


;*  DO THE HSCENTER
HSCENTER  LDX     #<HSCRAM;             ;AND DO IT
          LDY     #>HSCRAM
          JSR     $3FFD;                  ;DO HSCENTER
          JSR     OURINIT;                ;FIX OUR STATE
          JMP     SEEBALL


;*  THIS ROUTINE SETS UP A DEFAULT HSC TABLE IN THE START OF HSC RAM
HSETTEMP  LDX     #$1F
HSTLOOP   LDA     HSCTEMP,X;              ;INITIALIZE HI SCORE TEMPLATE
          STA     HSCRAM,X
          LDA     #$1D;                   ;CLEAR DIFFICULTY NAME
          STA     HSCDIF,X
          DEX
          BPL     HSTLOOP
          RTS


;*  THIS ROUTINE SETS THE DIFFICULTY IN A FOR THE HSCRAM
HSETDIFC  LDA     STLEVEL;                ;DEFAULT STARTING LEVEL
HSETDIF   TAX
          ASL;                      ;SHIFT IT LEFT TWICE
          ASL
          STA     HSCRAM+2;               ;STORE IT IN DIFFICULTY

          LDY     HSCOFF,X;               ;MOVE THE NAME IN
          LDX     #$08
HSDLOOP   LDA     TMESSAG2,Y
          BNE     HSDLNORM
          LDA     #$1D
          JMP     HSDLSTOR
HSDLNORM  SEC
          SBC     #$5E
HSDLSTOR  STA     HSCDIF,X
          INY
          INX
          CPX     #$12
          BMI     HSDLOOP

          RTS


;*  THIS ROUTINE SETS THE PLAYER.  A IS THE PLAYER.  HSCDIF MUST BE CALLED FIRST.
;*  PLAYER 1 MUST BE DONE BEFORE PLAYER 2.
HSETPLAY  TAX
          ORA     HSCRAM+2;               ;OR IN THE DIFFICULTY
          STA     HSCRAM+2

          LDA     #>P1SCORE;            ;SET HI BYTE OF SCORE
          STA     HSCRAM+9
          CPX     #$00;                   ;SEE WHICH PLAYER
          BNE     HSCP2

          LDA     #<P1SCORE;            ;SET SCORE FOR PLAYER 1
          STA     HSCRAM+8
          RTS

HSCP2     LDA     #<P2SCORE;            ;SET SCORE FOR PLAYER 2
          STA     HSCRAM+8

;*  WE HAVE NO SOUND FOR HSC
HSCSOUND  RTS


;*  TEMPLATE FOR HSC TABLE
HSCTEMP   DC.B      $80,$01;                ;ID NUMBER AND TRAILING ZERO
          DC.B      $00;                    ;DIFFICULTY [7..2] AND PLAYER [1..0]
          DC.B      $01;                    ;CONTROLLER TYPE
          DC.B      <HSCMS,>HSCMS      ;POINTER TO MS PAC-MAN NAME
          DC.B      <HSCDIF,>HSCDIF    ;POINTER TO DIFFICULTY NAME
          DC.B      $00,$00;                ;POINTER TO SCORE
          DC.B      $00,$00;                ;POINTER TO DLL FOR LOGO
          DC.B      <HSCSOUND,>HSCSOUND ;POINTER TO SOUND ROUTINE
          DC.B      $00;                    ;TIME TO WAIT TILL RETURN

;*  WORDS FOR HSC - NAME OF GAME AND DIFFICULTIES
HSCMS     DC.B      $1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D
          DC.B      $0C,$12,$1D,$0F,$00,$02,$1C,$0C,$00,$0D  ;MS PAC-MAN
          DC.B      $1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D

; END