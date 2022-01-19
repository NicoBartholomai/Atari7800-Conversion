	processor 6502 
;*
;*  SPEED.S         SPEED REGISTER CODE
;*

;*
;* INITSPED        - INITIALIZE SPEED REGISTERS
;*
INITSPED
          LDY     LEVEL;                  ;GET THE RIGHT INITIAL SPEEDS
          CPY     #21
          BMI     ISSMALL
          LDX     #31+128
          JMP     INITSPD

ISSMALL   CPY     #$05
          BMI     ISSMALER
          LDY     #$05
ISSMALER  LDX     ISPED,Y


INITSPD   LDY     #31
SPDLOOP   LDA     SPEEDS,X
          STA     M0SPEED0,Y
          DEX
          DEY
          BPL     SPDLOOP

          LDX     RACK;                   ;GET OFFSET FOR THE RIGHT RED THRESHOLD
          CPX     #18
          BMI     INITREDS
          LDX     #$18

INITREDS  LDY     REDSOFF,X
          LDA     REDS,Y
          STA     REDTHRSH
          LDA     REDS+1,Y
          STA     REDTHRSH+1
          RTS

;*
;* INCMSPED        - INCREMENT MONSTER SPEEDS
;*
INCMSPED  LDX     #4
INCMLOOP  CLC
          ROL     M0SPEED0,X
          ROL     M0SPEED1,X
          ROL     M0SPEED2,X
          ROL     M0SPEED3,X
          LDA     M0SPEED0,X
          ADC     #0
          STA     M0SPEED0,X
          DEX
          BPL     INCMLOOP
          RTS

;*
;* INCPSPED        - INCREMENT PAC SPEEDS
;*
INCPSPED  LDX     #1
INCPLOOP  CLC
          ROL     P0SPEED0,X
          ROL     P0SPEED1,X
          ROL     P0SPEED2,X
          ROL     P0SPEED3,X
          LDA     P0SPEED0,X
          ADC     #0
          STA     P0SPEED0,X
          DEX
          BPL     INCPLOOP

          RTS

;* CHKMON: SETS A IF THIS MONSTER IS TO MOVE THIS CYCLE
;*         IN      X IS THE MONSTER NUMBER
;*         OUT     A IS TRUE IF IT IS TIME TO MOVE
;*         USES    A,Y

CHKMON
          LDA     M0STATE,X
          CMP     #MSTEYES
          BNE     CHKMON1
          LDA     #1
          RTS
CHKMON1
          LDY     M0SPEED,X
          LDA     M0TUNNEL,X
          BEQ     CHKMON2
          LDY     #SPDSLOW
CHKMON2
          LDA     M0SPEED0,Y
          AND     #1
          RTS

;* CHKPAC: SETS A IF PAC IS TO MOVE THIS CYCLE
;*         IN
;*         OUT     A IS TRUE IF IT IS TIME TO MOVE
;*         USES    A,Y

CHKPAC
          LDA     ISBLUE
          BNE     CHKPAC1
          LDA     P0SPEED0
          AND     #1
          RTS
CHKPAC1
          LDA     P0SPEED0+1
          AND     #1
          RTS

SPEEDS    DC.B      $22,$21,$21,$89,$89    ;MONSTER SPEEDS RACK 0
          DC.B      $22,$08,$08,$12,$12    ;  8,6,6,9,9
          DC.B      $22,$21,$21,$24,$24
          DC.B      $22,$08,$08,$44,$44
          DC.B      $4A,$2A;                ;PAC SPEEDS RACK 0
          DC.B      $52,$95;                ;  13,14
          DC.B      $95,$2A
          DC.B      $29,$95
          DC.B      $07,$A4;                ; REVERSE TIMES(HAVE SAME RACKS)
          DC.B      $19,$54

          DC.B      $2A,$24,$22,$55,$6A    ;MONSTER SPEEDS RACK 1
          DC.B      $AA,$92,$22,$55,$AA    ;  15,10,8,16,17
          DC.B      $55,$24,$22,$55,$D5
          DC.B      $55,$92,$22,$55,$55
          DC.B      $55,$6A;                ;PAC SPEEDS RACK 1
          DC.B      $55,$D5;                ;  16,17
          DC.B      $55,$6A
          DC.B      $55,$D5
          DC.B      $01,$A4;                ; REVERSE TIMES(HAVE SAME RACKS)
          DC.B      $06,$54

          DC.B      $6A,$24,$24,$6A,$5A    ;MONSTER SPEEDS RACK 2-4
          DC.B      $AA,$92,$48,$D5,$D6    ;  17,11,9,18,19
          DC.B      $D5,$49,$91,$6A,$B5
          DC.B      $55,$25,$22,$D5,$AD
          DC.B      $6A,$5A;                ;PAC SPEEDS RACK 2-4
          DC.B      $D5,$D6;                ;  18,19
          DC.B      $6A,$B5
          DC.B      $D5,$AD
          DC.B      $01,$A4;                ; REVERSE TIMES(HAVE SAME RACKS)
          DC.B      $06,$54

          DC.B      $5A,$25,$24,$6D,$6D    ;MONSTER SPEEDS RACK 5-20
          DC.B      $D6,$25,$92,$6D,$B6    ;  19,12,10,20,20
          DC.B      $B5,$25,$24,$6D,$6D
          DC.B      $AD,$25,$92,$6D,$B6
          DC.B      $6D,$6D;                ;PAC SPEEDS RACK 5-20
          DC.B      $6D,$6D;                ;  20,20
          DC.B      $6D,$6D
          DC.B      $6D,$6D
          DC.B      $01,$2C;                ; REVERSE TIMES(HAVE SAME RACKS)
          DC.B      $05,$DC

          DC.B      $5A,$24,$24,$6D,$6D    ;MONSTER SPEEDS RACK 21- 
          DC.B      $D6,$48,$92,$6D,$B6    ;  19,9,10,20,20
          DC.B      $B5,$91,$24,$6D,$DB
          DC.B      $AD,$22,$92,$6D,$6D
          DC.B      $6A,$6A;                ;PAC SPEEDS RACK 21- 
          DC.B      $D5,$D5;                ;  18,18
          DC.B      $6A,$6A
          DC.B      $D5,$D5
          DC.B      $01,$2C;                ; REVERSE TIMES(HAVE SAME RACKS)
          DC.B      $05,$DC


REDS      DC.B      $24,$1A;                ;THRESHOLDS FOR RED MONSTER GETTING
          DC.B      $2E,$1F;                ;  MEAN - NOTE:  I HAVE INCREASED ALL
          DC.B      $38,$24;                ;  THESE VALUES BY $10 TO COMPENSATE
          DC.B      $42,$29;                ;  FOR THE SMALLER MAZES
          DC.B      $4C,$2E
          DC.B      $60,$38
          DC.B      $74,$42
          DC.B      $88,$4C

;*  OFFSETS INTO ABOVE TABLE BY RACK
REDSOFF   DC.B      $00,$00,$02,$04,$04,$04,$06,$06
          DC.B      $06,$08,$08,$08,$0A,$0A,$0A,$0C
          DC.B      $0C,$0C,$0E

;*  INITIAL SPEED TABLE, BY RACK THROUGH RACK 5
ISPED     DC.B      31,31+32,31+64,31+64,31+64,31+96