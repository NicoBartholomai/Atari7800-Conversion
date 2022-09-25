	processor 6502 

;*  LOADMAP.S      ROUTINES DEALING WITH MAZE MAINTENANCE

;*  MAZE DRAWING ROUTINE: CALLED WITH THE NUMBER OF THE DESIRED MAZE IN RACK,
;*  WILL DRAW THE APPROPRIATE MAZE.

          ;ZERO PAGE TEMPORARY VARIABLES.
          ; TEMP0-7  : EIGHT BYTE SHIFT REGISTER
          ; TEMP8-9  : POINTER TO MAZE DATA
          ; TEMP10-11: POINTER TO PLAY FIELD (CHARACTER MAP)
          ; TEMP12   : TEMPORARY VALUE STORAGE FOR COMPUTATIONS
          ; TEMP13   : OFFSET TO PLAYFIELD POINTER FOR LEFT HALF OF MAZE
          ; TEMP14   : OFFSET TO PLAYFIELD POINTER FOR RIGHT HALF OF MAZE
          ; TEMP15   : COUNTER TO KEEP TRACK OF CURRENT ROW

LOADMAP   LDA     #$00
          STA     DOTS;                   ;INITIALIZE DOT COUNTER
          STA     DOTS+1

          LDY     RACK
          LDA     MAZEBEGL
          STA     TEMP8
          LDA     MAZEBEGH
          STA     TEMP8+1

          LDA     #0
          STA     TEMP13
          LDA     #WIDTH-1
          STA     TEMP14

          JSR     LDSHFTL

NEXTCOL   JSR     LDSHFTH

          LDA     #<SCREEN
          STA     TEMP10
          LDA     #>SCREEN
          STA     TEMP10+1

          LDA     #HEIGHT
          STA     TEMP15

NEXTROW   LDA     TEMP0+0
          AND     #$03
          STA     TEMP12
          LDA     TEMP0+4
          ASL
          ASL
          AND     #$0C
          ORA     TEMP12
          TAX

          LDA     TEMP13
          CMP     #10
          BCC     NOTPEN
          LDA     TEMP15
          SBC     #15
          CMP     #5
          BCS     NOTPEN

;PEN
          TXA
          ADC     #$10
          TAX

NOTPEN
;NORMAL PLAYFIELD
          TXA;                            ;SEE IF SHOULD BE AN EMPTY CHARACTER
          CMP     #$0F;                   ;  NEAR THE BORDER INSTEAD OF FULL
          BNE     DOCHAR
          LDA     TEMP13
          CMP     #$03
          BPL     DOCHAR
          LDX     #$00;                   ;IT SHOULD BE EMPTY

DOCHAR    LDA     LEFT,X
          LDY     TEMP13
          STA     (TEMP10),Y
          LDA     RIGHT,X
          LDY     TEMP14
          STA     (TEMP10),Y

          JSR     SHIFT

          CLC
          LDA     TEMP10
          ADC     #WIDTH
          STA     TEMP10
          BCC     NOINC
          INC     TEMP10+1

NOINC     DEC     TEMP15
          BNE     NEXTROW

          INC     TEMP13
          DEC     TEMP14
          LDA     TEMP13
          CMP     TEMP14
          BCS     LOADDONE
          JSR     SHIFT
          JSR     SHIFT
          JMP     NEXTCOL

SHIFT     LDX     #$07
          LSR     TEMP0+7
SHIFT1    ROR     TEMP0-1,X
          DEX
          BNE     SHIFT1
          RTS

LOADDONE  LDA     #DOORCHAR;              ;PEN ENTRANCE CHARACTER
          STA     SCREEN+28;*11+13        ;ENTRANCE AT 11TH ROW, 13TH COLUMN
          STA     SCREEN+28;*11+14        ; AND 11TH ROW, 14TH COLUMN.

;*  THIS CODE TAKES CARE OF PUTTING UP THE DOTS
          LDA     #$00;                   ;INITIALIZE EVERYTHING TO ZERO
          TAY
          STA     TEMP0
          STA     TEMP1

LMDLOOP   LDA     DOTARRAY,Y;             ;GET NEW SET OF DOT BITS
          STA     TEMP15
          JSR     LMDOTS;                 ;DO EACH OF THE 8 BITS
          JSR     LMDOTS
          JSR     LMDOTS
          JSR     LMDOTS
          JSR     LMDOTS
          JSR     LMDOTS
          JSR     LMDOTS
          JSR     LMDOTS
          INY
          CPY     #$78
          BNE     LMDLOOP

;*  AND FINALLY - DO THE POWER DOTS
          LDY     RACK;                   ;GET THE RACK
          LDA     EDZONE0,Y
          STA     TEMP0
          LDA     EDCOL0,Y
          STA     TEMP1
          JSR     LMEDOTS;                ;ZONE 0 COLUMN 0
          LDA     EDCOL1,Y
          STA     TEMP1
          JSR     LMEDOTS;                ;ZONE 0 COLUMN 1
          LDA     EDZONE1,Y
          STA     TEMP0
          JSR     LMEDOTS;                ;ZONE 1 COLUMN 1
          LDA     EDCOL0,Y
          STA     TEMP1
          JSR     LMEDOTS;                ;ZONE 1 COLUMN 0

          RTS


;*  THIS ROUTINE CHECKS FOR A PARTICULAR POWER DOT
LMEDOTS   JSR     GETCHAR;                ;SEE WHAT"S THERE
          CMP     #DOTCHAR;               ;IS IT A DOT?
          BNE     LMEDOUT
          LDX     #EDOTCHAR;              ;PUT AN EDOT DOWN
          JSR     PLOPCHAR
LMEDOUT   RTS


;*  THIS ROUTINE LOADS IN A PARTICULAR DOT
LMDOTS    ASL     TEMP15;                 ;GET A BIT OFF
          BCC     LMDINC;                 ;SEE IF A DOT HERE
          LDX     #DOTCHAR;               ;DOT HERE
          JSR     PLOPCHAR;               ;PUT IT IN
          INC     DOTS;                   ;ADD IT TO THE DOT COUNTER
          BNE     LMDINC
          INC     DOTS+1
LMDINC    JMP     NEXTPLOP;               ;INCREMENT COLUMN


LEFT      DC.B    $50,$30,$31,$32,$33,$34,$50,$35,$36,$50,$37,$38,$39,$3A,$3B,$3C
PLEFT     DC.B    $50,$3E,$3F,$40,$41,$42,$50,$50,$43,$50,$44,$50,$45,$50,$50,$50
RIGHT     DC.B    $50,$33,$36,$39,$30,$34,$50,$3A,$31,$50,$37,$3B,$32,$35,$38,$3C
PRIGHT    DC.B    $50,$41,$43,$45,$3E,$42,$50,$50,$3F,$50,$44,$50,$40,$50,$50,$50

LDSHFTL   LDX     #$03
          BNE     LDSHFT1
LDSHFTH   LDX     #$07
LDSHFT1   LDY     #$03
LDSHFT2   LDA     (TEMP8),Y
          STA     TEMP0,X
          DEX
          DEY
          BPL     LDSHFT2
          CLC
          LDA     TEMP8
          ADC     #$04
          STA     TEMP8
          BCC     LDSHFT3
          INC     TEMP8+1
LDSHFT3   RTS


; <=======================================================================>

;*  THIS ROUTINE LOADS IN THE DOTS FOR A NEW RACK INTO DOTARRAY
;*  USES:  TEMP0-1, X
LOADDOTS  LDX     RACK;                   ;SET UP FOR TRANSFER
        ;   LDA     DOTBEGL,X
          LDA     DOTBEGL
          STA     TEMP0
        ;   LDA     DOTBEGH,X
          LDA     DOTBEGH
          STA     TEMP1

          LDY     #$7F
LDDLOOP   LDA     (TEMP0),Y;              ;AND MOVE THEM
          STA     DOTARRAY,Y
          DEY
          BPL     LDDLOOP
          RTS


; <=======================================================================>

;*  THIS ROUTINE USES THE CHARACTER MAP IN SCREEN TO UPDATE THE INFORMATION
;*  IN DOTARRAY.
SAVEDOTS  LDA     #$00;                   ;INITIALIZE EVERYTHING TO ZERO
          TAY
          STA     TEMP0
          STA     TEMP1

SDLOOP    JSR     SDDOTS;                 ;DO EACH OF THE 8 BITS
          JSR     SDDOTS
          JSR     SDDOTS
          JSR     SDDOTS
          JSR     SDDOTS
          JSR     SDDOTS
          JSR     SDDOTS
          JSR     SDDOTS
          LDA     TEMP15
          STA     DOTARRAY,Y
          INY
          CPY     #$78
          BNE     SDLOOP
          RTS


;*  THIS ROUTINE CHECKS FOR A PARTICULAR DOT
SDDOTS    LDA     TEMP1;                  ;SEE IF OUT OF RANGE
          CMP     #$1C
          BPL     SDNODOTS
          JSR     GETCHAR;                ;FIND OUT WHAT IS HERE
          CMP     #DOTCHAR
          BMI     SDNODOTS
          SEC;                            ;SHIFT IN A 1
          JMP     SDDOIT
SDNODOTS  CLC;                            ;SHIFT IN A 0
SDDOIT    ROL     TEMP15

;*  THIS ROUTINE INCREMENTS THE COLUMN FOR ROUTINES USING PUT/PLOPCHAR
NEXTPLOP  INC     TEMP1;                  ;NEXT COLUMN
          LDA     TEMP1
          CMP     #$20
          BMI     NCOUT
          LDA     #$00;                   ;NEXT ZONE
          STA     TEMP1
          INC     TEMP0
NCOUT     RTS

; <=======================================================================>

;TABLES OF POINTERS TO TABLES...

MAZEBEGL  DC.B      <MAZE1
MAZEBEGH  DC.B      >MAZE1

DOTBEGL   DC.B      <DOT1
DOTBEGH   DC.B      >DOT1

; <=======================================================================>

MAZE1     
         dc.b $ff, $9f, $ff, $7f
         dc.b $01, $9e, $07, $41
         dc.b $01, $9e, $07, $41
         dc.b $79, $9e, $27, $48
         dc.b $79, $9e, $27, $48
         dc.b $79, $9e, $e7, $49
         dc.b $01, $00, $00, $48
         dc.b $01, $00, $00, $48
         dc.b $c9, $9f, $27, $4f
         dc.b $09, $02, $20, $48
         dc.b $09, $02, $20, $48
         dc.b $49, $f2, $24, $49
         dc.b $41, $f0, $04, $41
         dc.b $41, $f0, $04, $41
         dc.b $cf, $f3, $3c, $4f

DOT1      
          DC.B      $00,$00,$00,$00
          DC.B      $7F,$F9,$FF,$E0       ; all these bytes are left to right
          DC.B      $42,$09,$04,$20
          DC.B      $42,$09,$04,$20        
          DC.B      $43,$FF,$FC,$20
          DC.B      $42,$40,$24,$20        
          DC.B      $42,$40,$24,$20
          DC.B      $7E,$79,$E7,$E0        
          DC.B      $02,$00,$04,$00        
          DC.B      $02,$00,$04,$00        
          DC.B      $02,$00,$04,$00        
          DC.B      $02,$00,$04,$00        
          DC.B      $02,$00,$04,$00        
          DC.B      $02,$00,$04,$00        
          DC.B      $02,$00,$04,$00        
          DC.B      $02,$00,$04,$00        
          DC.B      $02,$00,$04,$00        
          DC.B      $02,$00,$04,$00        
          DC.B      $02,$00,$04,$00        
          DC.B      $7f,$f9,$ff,$E0        
          DC.B      $42,$09,$04,$20        
          DC.B      $42,$09,$04,$20        
          DC.B      $73,$FF,$FC,$e0        
          DC.B      $12,$40,$24,$80        
          DC.B      $12,$40,$24,$80        
          DC.B      $7E,$79,$E7,$E0        
          DC.B      $40,$09,$00,$20        
          DC.B      $40,$09,$00,$20        
          DC.B      $7F,$FF,$FF,$E0        
          DC.B      $00,$00,$00,$00         

; <=======================================================================>

          ;CONSTANT VALUES FOR MS.PACMAN
WIDTH     EQU     28
HEIGHT    EQU     30

;*  ZONES AND COLUMNS FOR THE ENERGY DOTS - INDEXED BY RACK
EDZONE0   DC.B      $03,$03,$03,$03
EDZONE1   DC.B      $16,$16,$16,$16
EDCOL0    DC.B      $01,$01,$01,$01
EDCOL1    DC.B      $1A,$1A,$1A,$1A
