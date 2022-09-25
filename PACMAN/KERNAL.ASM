	processor 6502 

;* KERNAL          THE KERNAL AND LOADER FOR MARIA MS PAC-MAN


;*  THIS IS THE DLI FOR THE FRUIT - CHANGES COLORS FOR FRUIT
DLIFRUIT  LDA     #RED;                   ;ADJUST COLORS FOR FRUIT PALETTES
          STA     Z3C1
          STA     Z4C1
          LDA     #WHITE
          STA     Z3C2
          STA     Z4C2
        ;   STA     Z1C3
          LDA     #ORANGE
          STA     Z5C1
          LDA     #BROWN;                 ;ADJUST COLORS FOR FRUIT PALETTES
          STA     Z3C3
          STA     Z5C2
          LDA     #GREEN;                 ;ADJUST COLORS FOR FRUIT PALETTES
          STA     Z4C3
          STA     Z5C3
          LDA     #BLUE
          STA     Z1C2
          STA     Z6C3 
          LDA     #YELLOW;                ;MAKE SURE BANANA AND MS GET RIGHT CLR
          STA     Z1C1
          STA     Z7C1
          STA     Z6C1 
          ; LDA     $CA; Neon Green
          ; STA     Z6C1

          ; nico's tests for which color gooes where
          LDA     #WHITE
        ;   STA     Z1C1 ; idk
        ;   STA     Z1C2 ; the keys handle
          STA     Z1C3 ; the keys metal bits
        ;   STA     Z3C1 ; the cherry's red; and the grenade's
        ;   STA     Z3C2 ;  the cherry's white bits; and the grenade's
        ;   STA     Z3C3 ; the cherry's stem; and the grenade specs
        ;   STA     Z4C1 ; the strawberry
        ;   STA     Z5C1 ; the orange
        ;   STA     Z6C1; the bell
          STA     Z7C2


          LDA     #$00;                   ;SET "VBLANK" TO HAPPEN NEXT
          STA     KNLTEMP0
          JMP     DLIOUT


;*  MAINTAIN THE ON-SCREEN DISPLAY
DLI       PHA;                            ;STACK REGISTERS
          TXA
          PHA

          LDA     KNLTEMP0;               ;SEE WHAT DLI HANDLER TO GO TO
          BEQ     OTHERDLI
          BMI     TOPDLIS
          LDX     KNLTEMP1;               ;"NORMAL" DLI, SEE WHICH ZONE
          CPX     #LASTZONE
          BPL     DLIFRUIT;               ;IF ZONES FINISHED, THEN SET FRUIT CLR
          TXA
          AND     #$01
          BEQ     DLI0
          JMP     DLI1


;*  THIS IS THE DLI FOR THE SCORE
DLISCORE  LDA     #WHITE;                 ;SET UP SCORE COLORS
          STA     Z0C3
          LDA     #ORANGE
          STA     Z0C2
          LDA     #BLACK
          STA     BACKGRND


;*  THIS ROUTINE TAKES CARE OF DLI HANDLERS WHERE THE OTHER DISPLAY LIST IS
;*  MODIFIED WHILE THE CURRENT DISPLAY LIST IS BEING USED
DLI0      LDA     M0ADDR,X;               ;UPDATE MONSTER 0 STAMP
          STA     DLIST0+$0D
          LDA     M1ADDR,X;               ;UPDATE MONSTER 1 STAMP
          STA     DLIST0+$11
          LDA     M2ADDR,X;               ;UPDATE MONSTER 2 STAMP
          STA     DLIST0+$15
          LDA     M3ADDR,X;               ;UPDATE MONSTER 3 STAMP
          STA     DLIST0+$19
          LDA     SCRLOW,X;               ;UPDATE PLAY FIELD LOW ADDR
          STA     DLIST0+$00
          LDA     SCRHI,X;                ;UPDATE PLAY FIELD HI ADDR
          STA     DLIST0+$02
          LDA     MSADDR,X;               ;UPDATE MS STAMP
          STA     DLIST0+$05
          LDA     FRTADDR,X;              ;UPDATE FRUIT STAMP
          STA     DLIST0+$09
          INC     KNLTEMP1
          JMP     DLIOUT


;*  THIS HANDLES THE "ODD-BALL" DLIS, VBLANK AND NULL
OTHERDLI  LDX     KNLTEMP1;               ;SEE WHAT TO DO
          BEQ     DLIWAIT;                ;IF ZERO, THEN "VERTICAL BLANK"
          BPL     DLILAST;                ;IF NEGATIVE, WE ARE WAITING FOR SYNC

DLIWAIT   JMP     DLIOUT;                 ;WAITING FOR DLI"S TO SYNC


;*  THIS TAKES CARE OF DLIS ON THE TOP OF THE SCREEN
TOPDLIS   LDX     KNLTEMP1
          BEQ     DLISCORE

          LDA     #$01;                   ;SET UP FOR NORMAL DLIS
          STA     KNLTEMP0
          LDA     P0C3;                   ;RESTORE PLAYFIELD COLORS
          STA     Z0C3
          LDA     P0C2
          STA     Z0C2


;*  THIS IS THE NORMAL DLI TO SET UP FOR ODD ZONES
DLI1      LDA     M0ADDR,X;               ;UPDATE MONSTER 0 STAMP
          STA     DLIST1+$0D
          LDA     M1ADDR,X;               ;UPDATE MONSTER 1 STAMP
          STA     DLIST1+$11
          LDA     M2ADDR,X;               ;UPDATE MONSTER 2 STAMP
          STA     DLIST1+$15
          LDA     M3ADDR,X;               ;UPDATE MONSTER 3 STAMP
          STA     DLIST1+$19
          LDA     SCRLOW,X;               ;UPDATE PLAY FIELD LOW ADDR
          STA     DLIST1+$00
          LDA     SCRHI,X;                ;UPDATE PLAY FIELD HI ADDR
          STA     DLIST1+$02
          LDA     MSADDR,X;               ;UPDATE MS STAMP
          STA     DLIST1+$05
          LDA     FRTADDR,X;              ;UPDATE FRUIT STAMP
          STA     DLIST1+$09
          INC     KNLTEMP1
          JMP     DLIOUT


;*  THIS ROUTINE TAKES CARE OF THE LAST DLI ON THE SCREEN, THE "VERTICAL BLANK
;*  ROUTINE".
DLILAST   LDA     #$00
          STA     KNLTEMP1;               ;TURN DLI"S OFF TILL WE ARE DONE
          STA     LDRTEMP7;               ;NO NOTICES OF VBLANK YET
          TYA;                            ;WE NEED TO STACK Y
          PHA

          JSR     RAND;                   ;UPDATE RANDOM NUMBER
          JSR     LOADER;                 ;LOAD UP NEXT FRAME

          INC     RTLOCAL+1;              ;INCREMENT CLOCK
          BNE     DLITUNE
          INC     RTLOCAL

DLITUNE   JSR     TUNER;                  ;DO TUNES

          LDA     LDRTEMP7;               ;IS VBLANK STARTED YET?
          BNE     DLLCOLOR
DLLWAIT   BIT     MSTAT;                  ;IF NOT, BUSY WAIT
          BPL     DLLWAIT

DLLCOLOR  JSR     GETCOLOR;               ;UPDATE PALETTES

          DEC     KNLTEMP0;               ;SET SCORE DLI TO HAPPEN NEXT

          PLA;                            ;UNSTACK AND LEAVE
          TAY
DLIOUT    PLA;                            ;THIS IS WHERE MOST DLI"S LEAVE
          TAX
          PLA
NULLRTI   RTI


;*  UPDATE BASE HEADER INFORMATION FOR NEXT RUN OF KERNAL
LOADER    LDX     #$05
LUPDATLP  LDA     DOLIST,X;               ;SEE IF ANYTHING TO DO
          BNE     LULBODY
          JMP     LULNEXT

LULBODY   TXA
          ASL
          ASL
          TAY;                            ;Y = 4;*X
          LDA     HPLIST,X;               ;UPDATE HPOS
          STA     DLIST0+8,Y
          STA     DLIST1+8,Y

          LDA     STDATALO,X;             ;GET RID OF OLD STAMP DATA
          STA     LDRTEMP0
          LDA     STDATAHI,X
          STA     LDRTEMP1
          LDA     #$00
          LDY     OLDZONE,X
          STA     (LDRTEMP0),Y
          INY
          STA     (LDRTEMP0),Y
          INY
          STA     (LDRTEMP0),Y

          LDA     VZLIST,X;               ;PUT IN THE NEW STAMP DATA
          STA     OLDZONE,X;              ;SAVE AWAY WHERE IT IS
          TAY
          LDA     STAMPOFF,X
          STA     (LDRTEMP0),Y
          INY
          CLC
          ADC     #$02
          STA     (LDRTEMP0),Y
          INY
          CLC
          ADC     #$02
          STA     (LDRTEMP0),Y

          LDA     #<STAMPS;             ;AND NOW, UPDATE THE STAMPS
          CLC
          ADC     STAMPOFF,X
          STA     LDRTEMP0;               ;(LDRTEMP0) IS THE OUTPUT
          LDA     SLLIST,X;               ;(LDRTEMP2) IS THE INPUT
          STA     LDRTEMP2
          LDA     SHLIST,X
          STA     LDRTEMP3
          LDA     VOLIST,X;               ;FIND THE OFFSET - HOW MANY LEADING 0"S
          STA     LDRTEMP5
          STA     LDRTEMP6
          STX     LDRTEMP4;               ;STORE X

          LDA     #>(STAMPS+$500)        ;RESET OUTPUT POINTER TO BEGINNING
          STA     LDRTEMP1
          LDX     #$05
LSLOOP0   LDY     #$00
          DEC     LDRTEMP5;               ;SEE IF ANY STARTING BLANK PADDING
          BMI     LSLJMP00
          TYA;                            ;BLANK PADDING
          STA     (LDRTEMP0),Y
          INY
          STA     (LDRTEMP0),Y
          JMP     LDLJMP01
LSLJMP00  LDA     (LDRTEMP2),Y;           ;GET DATA
          STA     (LDRTEMP0),Y
          INY
          LDA     (LDRTEMP2),Y;           ;GET DATA
          STA     (LDRTEMP0),Y
          INC     LDRTEMP2;               ;INCREASE LDRTEMP2 BY 2
          INC     LDRTEMP2
          BNE     LDLJMP01;               ;SEE IF PAGE BOUNDARY
          INC     LDRTEMP3
LDLJMP01  DEC     LDRTEMP1;               ;INCREASE LDRTEMP0 BY 1 PAGE
          DEX
          BPL     LSLOOP0

          INC     LDRTEMP0;               ;MOVE TO NEXT STAMP
          INC     LDRTEMP0
          LDA     #>(STAMPS+$500)        ;RESET OUTPUT POINTER TO BEGINNING
          STA     LDRTEMP1
          LDX     #$05
LSLOOP1   LDY     #$00
          LDA     (LDRTEMP2),Y;           ;GET DATA
          STA     (LDRTEMP0),Y
          INY
          LDA     (LDRTEMP2),Y;           ;GET DATA
          STA     (LDRTEMP0),Y
          INC     LDRTEMP2;               ;INCREASE LDRTEMP2 BY 2
          INC     LDRTEMP2
          BNE     LDLPAGE1;               ;SEE IF PAGE BOUNDARY
          INC     LDRTEMP3
LDLPAGE1  DEC     LDRTEMP1;               ;INCREASE LDRTEMP0 BY 1 PAGE
          DEX
          BPL     LSLOOP1

          INC     LDRTEMP0;               ;MOVE TO NEXT STAMP
          INC     LDRTEMP0
          LDA     #>(STAMPS+$500)        ;RESET OUTPUT POINTER TO BEGINNING
          STA     LDRTEMP1
          LDX     #$05
LSLOOP2   LDY     #$00
          DEC     LDRTEMP6;               ;SEE IF TIME FOR ANY ENDING BLANKS
          BPL     LSLJMP20
          TYA;                            ;BLANK PADDING
          STA     (LDRTEMP0),Y
          INY
          STA     (LDRTEMP0),Y
          JMP     LSLJMP21
LSLJMP20  LDA     (LDRTEMP2),Y;           ;GET DATA
          STA     (LDRTEMP0),Y
          INY
          LDA     (LDRTEMP2),Y;           ;GET DATA
          STA     (LDRTEMP0),Y
          INC     LDRTEMP2;               ;INCREASE LDRTEMP2 BY 2
          INC     LDRTEMP2
          BNE     LSLJMP21;               ;SEE IF PAGE BOUNDARY
          INC     LDRTEMP3
LSLJMP21  DEC     LDRTEMP1;               ;INCREASE LDRTEMP0 BY 1 PAGE
          DEX
          BPL     LSLOOP2

          LDX     LDRTEMP4
          LDA     #$00
          STA     DOLIST,X;               ;DON"T DO SAME AGAIN - Y IS STILL 0

LULNEXT   BIT     MSTAT;                  ;SEE IF VBLANK STARTED YET
          BPL     LULNJMP
          INC     LDRTEMP7;               ;STARTED
LULNJMP   DEX
          BMI     LULOUT
          JMP     LUPDATLP
LULOUT    RTS


;*  RANDOM NUMBER GENERATOR - BOTH MAKES A NEW ONE AND LEAVES IT IN A
RAND      ADC     RTLOCAL+1;              ;MAKE A PRETTY RANDOM VALUE
          ADC     NEWRAND
          ADC     OLDRAND
          PHA
          LDA     NEWRAND;                ;BACK UP NEWRAND
          STA     OLDRAND
          PLA
          STA     NEWRAND;                ;NEW VALUE - LEFT IN A
          RTS


;*  THIS ROUTINE HITS THE PALETTES EVERY FRAME
GETCOLOR  LDX     #$02
          LDY     #$07
GCLOOP    LDA     P0C1-2,X
          STA     Z0C1-2,X
          INX
          LDA     P0C1-2,X
          STA     Z0C1-2,X
          INX
          LDA     P0C1-2,X
          STA     Z0C1-2,X
          INX
          INX
          DEY
          BPL     GCLOOP
          RTS


;*  TABLE OF LOW AND HI BYTES OF PLAYFIELD ADDRESSES FOR ZONES
SCRLOW    DC.B      $00,$1C,$38,$54,$70,$8C,$A8,$C4
          DC.B      $E0,$FC,$18,$34,$50,$6C,$88,$A4
          DC.B      $C0,$DC,$F8,$14,$30,$4C,$68,$84
          DC.B      $A0,$BC,$D8,$F4,$10,$2C,$48
SCRHI     DC.B      >SCREEN+$000,>SCREEN+$000,>SCREEN+$000,>SCREEN+$000
          DC.B      >SCREEN+$000,>SCREEN+$000,>SCREEN+$000,>SCREEN+$000
          DC.B      >SCREEN+$000,>SCREEN+$000,>(SCREEN+$100),>(SCREEN+$100)
          DC.B      >(SCREEN+$100),>(SCREEN+$100),>(SCREEN+$100),>(SCREEN+$100)
          DC.B      >(SCREEN+$100),>(SCREEN+$100),>(SCREEN+$100),>(SCREEN+$200)
          DC.B      >(SCREEN+$200),>(SCREEN+$200),>(SCREEN+$200),>(SCREEN+$200)
          DC.B      >(SCREEN+$200),>(SCREEN+$200),>(SCREEN+$200),>(SCREEN+$200)
          DC.B      >(SCREEN+$300),>(SCREEN+$300),>(SCREEN+$300)

;*  TABLE FROM STAMP INDEX TO WHERE THE STAMP STARTS IN STAMP PAGE
STAMPOFF  DC.B      4,10,16,22,28,34

;*  TABLE FROM STAMP INDEX TO WHAT TABLE THE STAMP OFFSET GOES IN
STDATALO  DC.B      <MSADDR,<FRTADDR,<M0ADDR,<M1ADDR
          DC.B      <M2ADDR,<M3ADDR
STDATAHI  DC.B      >MSADDR,>FRTADDR,>M0ADDR,>M1ADDR
          DC.B      >M2ADDR,>M3ADDR

;*  THE LAST ZONE OF THE MAZE
LASTZONE  EQU     30