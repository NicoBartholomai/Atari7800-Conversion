	processor 6502 
;GDAC4.S
;
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
;
;
;THIS TABLE IS A MOTION TABLE WHICH CAUSES A SHIP TO ENTER IN THE FIRST, FOURTH,
;AND FIFTH WAVES.  X AND ANGLE MUST BE NEGATED FOR HALF OF THE FIRST WAVE AND
;THE FIFTH WAVE.
;THERE ARE 110 ENTRIES.
;
MOTION1   DC.B      $F6,$04
          DC.B      $56,$04
          DC.B      $E5,$04,$E4,$04,$E4,$04,$E4,$04
          DC.B      $56,$E4,$C4,$E4,$C4,$E4
          DC.B      $C4,$E4,$C4,$E4,$C4,$E4,$C4,$E4,$C4,$E4
          DC.B      $C4,$E4,$C4,$E4,$C4,$F6,$E4
          DC.B      $E4,$E4,$04,$E4,$04,$46
          DC.B      $E4,$04,$E4,$04,$E4,$04,$E4,$04,$E4,$04
          DC.B      $E4,$04,$E4,$04,$E4,$26,$04,$E7,$04
          DC.B      $E4,$C6
          DC.B      $04,$27,$04,$24,$04,$36,$24
          DC.B      $44,$24,$44,$24,$24,$20,$24,$40
          DC.B      $27,$20,$24
          DC.B      $F6,$20
          DC.B      $26,$20,$3F,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $5C,$3C,$5C,$36,$3C,$1C,$3C
          DC.B      $66,$1C,$1F,$26,$1C
          DC.B      $3C,$1C,$3C,$A6
          DC.B      $1C,$02

;
;THIS IS THE TABLE WHICH CAUSES A SHIP TO ENTER IN THE SECOND AND THIRD WAVES.
;X AND ANGLE MUST BE NEGATED FOR THE THIRD WAVE.
;141 ENTRIES
MOTION2   DC.B      $3C,$20,$3C,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $3C,$20,$3C,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $3C,$20,$3C,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $3C,$20,$3C,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $3C,$3C,$3C,$20,$3C,$20,$3C,$3C,$3C,$20
          DC.B      $3C,$20
          DC.B      $F6,$3C
          DC.B      $46,$3C,$1C,$3C,$1C,$3C,$1C,$3F,$66,$1C
          DC.B      $FC,$1C,$FC,$26
          DC.B      $1C,$FC,$1C,$FF,$1C,$26,$FC,$E0
          DC.B      $FC,$E0,$E3,$86
          DC.B      $E0,$E7,$E0,$E4,$E0,$E4,$E0,$E4,$E0
          DC.B      $E4,$04,$E4,$04,$E4,$04,$E7,$86
          DC.B      $04,$27,$04,$24,$04
          DC.B      $24,$04,$24,$04,$26,$24,$20,$24,$20
          DC.B      $23
          DC.B      $A6,$20,$3F,$20,$3C,$20,$26,$3C,$1C
          DC.B      $3C,$1C,$3C,$1C,$3C,$1C,$3C,$1C,$3C
          DC.B      $46,$1C,$1F,$26,$1C,$3C,$1C
          DC.B      $3C
          DC.B      $C6,$1C,$02


;THIS TABLE IS A MOTION TABLE WHICH IS FOLLOWED BY AN ATTACKING BLUE SHIP.
;IT IS GONE THROUGH TWICE.
;THERE ARE TWO PARTS, ONLY THE SECOND PART IS REPEATED.
;THERE ARE A TOTAL OF 58 ENTRIES
;
BATBL1    DC.B      $FF,$1C,$DF,$FC,$C7,$E4,$E7
BATBL1B   DC.B      $F6,$04
          DC.B      $D6,$04
BATBL1A   DC.B      $56,$04,$24,$04,$27,$04
          DC.B      $24,$04,$24,$04,$26,$24,$00,$24,$00
          DC.B      $27,$20,$24,$66,$20
          DC.B      $24,$20,$25,$20,$24,$20,$24,$20,$24,$20
          DC.B      $24,$20,$24,$20,$28,$24,$28,$24,$24,$04
          DC.B      $24,$04,$25,$04,$24,$04,$02

;THIS TABLE INDEXED BY RACK TELLS HOW MANY MISSLES CAN EXIST AT A TIME
;DURING THE SPECIFIC RACK
;32 ENTRIES
NUMMIS    DC.B      53,47,48,46,48,49,49,46      ;46=0,47=1,ETC
          DC.B      49,49,49,46,49,50,50,46
          DC.B      48,49,49,46,49,49,50,46
          DC.B      49,49,49,46,50,50,51
END3      DC.B      46

          ORG     $DF76
;COPYWRITE GCC 1984
          DC.B      $47,$43,$43,$28,$63,$29,$31,$39,$38,$34

;THIS NEXT SECTION GOES AFTER GLOADER.S
          ORG     END01

;
;THIS IS THE MOTION TABLE WHICH CAUSES AN ATTACKING BLUE SHIP TO CURVE
;UP TOWARD THE FORMATION.
;THERE ARE 4 ENTRIES
;
BATBL2    DC.B      $E5,$04,$C5,$E4,$DD,$FC,$FD,$1C,$06

;
;
;THIS TABLE INDEXED BY RACK TELLS HOW MANY SHIPS CAN BE FLYING AROUND
;IN THE SPECIFIC RACK
;
NUMATTK   DC.B      4,2,2,1,3,3,3,1
          DC.B      2,2,2,1,3,3,3,1
          DC.B      3,3,3,1,3,3,3,1
          DC.B      3,3,3,1,4,4,4,1

;  THIS TABLE IS FOR THE RACK 3 CHALLENGING STAGE
CHRACK3A  DC.B      $F6,$08
          DC.B      $F6,$08
          DC.B      $36,$08,$E8,$08,$08,$E9
          DC.B      $E8,$08,$E8,$08,$26,$E8,$08,$36,$E8
          DC.B      $E4,$E4,$36,$E8,$E4,$E4
          DC.B      $E8,$E8,$E4,$E4,$E8,$E4,$E4,$E8,$56,$E4
          DC.B      $C4,$26,$E4
          DC.B      $26,$C4,$C0,$C0,$DC,$DD,$DC,$F8,$F9
          DC.B      $18,$F8,$18,$38,$18,$38,$38,$39,$38,$20,$3C
          DC.B      $58,$58,$20,$3C,$58,$20,$3D,$20,$3C,$20,$3C
          DC.B      $20,$3C,$20,$3C,$58,$40,$20,$3C,$5C,$20
          DC.B      $3C,$20,$3C,$40,$20,$3C,$20,$3C,$20,$3C,$40
          DC.B      $20,$3C,$40,$40,$20,$3C,$40,$20,$3C,$40,$20
          DC.B      $3C,$20,$3C,$40,$20,$3C,$40,$20,$3C,$20
          DC.B      $3C,$40,$20,$3C,$40,$20,$3C,$20,$3C,$40
          DC.B      $20,$3C,$40,$20,$3C,$20,$3C,$40,$20,$3C
          DC.B      $40,$20,$3C,$20,$3C,$40,$20,$3C,$40,$20
          DC.B      $3C,$20,$3C,$40,$20,$3C,$40,$20,$3C,$20
          DC.B      $3C,$40,$20,$3C,$40,$20,$3C,$02

CHRACK3B  DC.B      $E0,$E0,$FC,$26,$E0,$FC,$E0,$FC,$E0
          DC.B      $FC,$E0,$FC,$E0,$FC,$E0,$FC,$E0,$FC,$E0
          DC.B      $FC,$E0,$FC,$E0,$FC,$E0,$FC,$E0,$FC,$E0
          DC.B      $FC,$E0,$FC,$E0,$FC,$E0,$FC,$E0,$FC,$E0
          DC.B      $FC,$E0,$FC,$E0,$FC,$E0,$FC,$E0,$FC,$E0
          DC.B      $FC,$E0,$FC,$E0,$D8,$FC,$E0,$FC,$E0
          DC.B      $FC,$E0,$D8,$FC,$E0,$D8,$FC,$E0
          DC.B      $D8,$FC,$E0,$D8,$FC,$E0,$FC,$E0
          DC.B      $FC,$E0,$FC,$FC,$1C,$56
          DC.B      $FC
          DC.B      $1C,$26,$FC,$FD
          DC.B      $FC,$1C,$FC,$FD,$F8
          DC.B      $36,$1C,$F8,$F6,$1C
          DC.B      $F6,$1C
          DC.B      $B6,$1C
          DC.B      $3D,$3C,$1C,$3C,$3C,$3D,$26,$20,$24
          DC.B      $20,$25,$26,$24,$20,$24,$24,$04,$24
          DC.B      $05,$F6,$04
          DC.B      $F6,$04
          DC.B      $B6,$04
          DC.B      $E9
          DC.B      $E0,$FC,$E0,$FC,$FD
          DC.B      $FC,$FD
          DC.B      $F6,$FC
          DC.B      $F6,$FC
          DC.B      $F6,$FC
          DC.B      $F6,$FC
          DC.B      $F6,$FC,$F2
          DC.B      $02

CHRACK7B  DC.B      $F6,$20
          DC.B      $F6,$20
          DC.B      $F6,$20
          DC.B      $F6,$20
          DC.B      $F6,$20
          DC.B      $36,$20,$3C,$26,$20
          DC.B      $3C,$26,$20,$3C,$20,$3C,$20,$3C,$20
          DC.B      $36,$5C,$5F,$5C,$58,$5C,$58,$58
          DC.B      $38,$58,$58,$38,$58,$26,$38,$58,$46
          DC.B      $38,$3B,$18,$38,$38,$18,$38
          DC.B      $18,$38,$26,$18,$38,$56,$18
          DC.B      $F8,$26,$18,$F8,$18,$F8,$18
          DC.B      $F8,$F8,$18,$F8,$FB,$66,$F8
          DC.B      $26,$D8,$86,$DC
          DC.B      $C3,$DC,$C0,$C0,$DC,$B6,$C0
          DC.B      $C4,$C0,$C3,$C4
          DC.B      $C0,$76,$C4,$36
          DC.B      $C8,$46,$E8,$EB,$26
          DC.B      $08,$E8,$E8,$08,$E8,$08,$E8,$26
          DC.B      $08,$E8,$56,$08,$28
          DC.B      $26,$08,$28,$08,$28,$08,$28,$28,$08
          DC.B      $56,$28,$48,$28,$28,$2B
          DC.B      $48,$28,$48,$48,$28,$48,$48,$44,$48,$44
          DC.B      $24,$20,$24,$20,$27,$20,$24,$20,$24,$20
          DC.B      $24,$20,$24,$20,$24,$26,$20,$24,$26
          DC.B      $20,$24,$F6,$20
          DC.B      $F6,$20
          DC.B      $F6,$20,$F6,$20
          DC.B      $F6,$20
          DC.B      $26,$20,$02

;*THIS DATA IS ALSO USED FOR CHRACK11A
CHRACK7A  DC.B      $F6,$08
          DC.B      $F6,$08
          DC.B      $A6,$08
          DC.B      $28,$2B,$28,$56,$48
          DC.B      $44,$48,$44,$48,$26,$44,$47
          DC.B      $44,$40,$44,$40,$44,$40,$44,$41,$45,$41
          DC.B      $C1,$DC,$C0,$DC,$C1,$DC,$C0,$DC,$C0
          DC.B      $46,$DC,$D8,$DC,$D8,$DC,$56,$D8
          DC.B      $F9,$F8,$F8,$F6,$18
          DC.B      $F6,$18
          DC.B      $A6,$18
          DC.B      $02

CHRCK11B  DC.B      $F6,$40
          DC.B      $F6,$40
          DC.B      $86,$40,$36,$03,$B6,$C0
          DC.B      $DD
          DC.B      $DC,$DC,$D8,$DC,$36,$D8,$36,$F8
          DC.B      $18,$F8,$F8,$18,$F8,$F8,$18,$F9
          DC.B      $18,$F8,$18,$F8,$18,$F8,$26,$18,$F8
          DC.B      $36,$18,$F8,$66,$18
          DC.B      $38,$18,$38,$38,$18,$66,$38
          DC.B      $39,$86,$58
          DC.B      $26,$5C,$5D,$5C,$5C
          DC.B      $40,$45,$44,$48,$28,$29,$28,$28,$08,$08
          DC.B      $28,$26,$08,$28,$F6,$08
          DC.B      $46,$08,$2B,$28,$48,$48
          DC.B      $47,$44,$F6,$40
          DC.B      $F6,$40
          DC.B      $86,$40
          DC.B      $02

CHRCK15A  DC.B      $76,$08,$0B,$03
          DC.B      $40,$44,$40,$44,$45,$48,$48,$4C,$28,$29
          DC.B      $28,$08,$28,$08,$E8,$08,$26,$E8,$C9
          DC.B      $26,$C8,$C4,$C1,$C4,$36,$C0
          DC.B      $36,$C4,$C7,$C8,$C8,$CC,$E8,$0B
          DC.B      $E8,$36,$08,$28,$08,$28,$28,$4B
          DC.B      $48,$48,$64,$40,$47,$46,$40
          DC.B      $44,$40,$44,$48,$49,$48,$48,$28,$28,$09
          DC.B      $28,$26,$08,$E8,$08,$26,$E8,$C9
          DC.B      $C8,$A8,$C4,$C0,$C1,$C4,$26,$C0,$46
          DC.B      $DC,$D9,$D8,$D4,$F8,$F8,$19
          DC.B      $F8,$18,$18,$38,$18,$36,$38,$59
          DC.B      $58,$26,$5C,$41,$5C,$26,$40,$5C
          DC.B      $40,$26,$5C,$5B,$58,$58,$38,$38,$3B
          DC.B      $18,$38,$18,$18,$F8,$18,$26,$F8,$DB
          DC.B      $B4,$D8,$DC,$DC,$DF,$46,$C0
          DC.B      $DC,$C0,$DC,$DC,$DD,$D8,$26,$F8,$F9
          DC.B      $18,$F8,$18,$18,$38,$18,$38,$18,$38,$59
          DC.B      $58,$58,$5C,$5C,$5D,$40,$5C,$40,$43,$03
          DC.B      $86,$18,$02

CHRCK15B  DC.B      $5C,$5C,$66,$58,$38
          DC.B      $3B,$36,$38,$18,$38,$18,$38,$18
          DC.B      $38,$18,$38,$18,$18,$38,$18,$38,$18,$38
          DC.B      $18,$36,$38,$58,$38,$58,$38,$5D
          DC.B      $58,$5C,$5C,$41,$5C
;*THIS IS THE FIRST LOOP
CHRCK15C
          DC.B      $46,$40,$44,$45,$44,$24
          DC.B      $48,$26,$28,$09,$28,$08,$28,$08,$08
          DC.B      $28,$08,$08,$C8,$08,$C8,$08,$C8,$08,$C8
          DC.B      $C8,$C9,$C8,$C4,$C9,$C8,$C4,$C0,$D8,$D9
          DC.B      $D8,$18,$F9,$46,$18,$38,$18
          DC.B      $38,$18,$38,$18,$46,$38,$59
          DC.B      $38,$26,$58,$59,$58,$40,$58,$40

          DC.B      $46,$40,$44,$45,$44,$24
          DC.B      $48,$26,$28,$09,$28,$08,$28,$08,$08
          DC.B      $28,$08,$08,$C8,$08,$C8,$08,$C8,$08,$C8
          DC.B      $C8,$C9,$C8,$C4,$C9,$C8,$C4,$C0,$D8,$D9
          DC.B      $D8,$18,$F9,$46,$18,$38,$18
          DC.B      $38,$18,$38,$18,$46,$38,$59
          DC.B      $38,$26,$58,$59,$58,$40,$58,$40

          DC.B      $46,$40,$44,$45,$44,$24
          DC.B      $48,$26,$28,$09,$28,$08,$28,$08,$08
          DC.B      $28,$08,$08,$C8,$08,$C8,$08,$C8,$08,$C8
          DC.B      $C8,$C9,$C8,$C4,$C9,$C8,$C4,$C0,$D8,$D9
          DC.B      $D8,$18,$F9,$46,$18,$38,$18
          DC.B      $38,$18,$38,$18,$46,$38,$59
          DC.B      $38,$26,$58,$59,$58,$40,$58,$40
;*THIS IS THE DEPARTING PATH
CHRCK15D
          DC.B      $40,$44,$45
          DC.B      $48,$48,$26,$28,$48,$26,$28,$29
          DC.B      $08,$28,$08,$28,$08,$28,$26,$08,$28
          DC.B      $08,$28,$08,$28,$08,$28,$08,$28,$08,$28
          DC.B      $08,$26,$28,$2B,$36,$28,$47
          DC.B      $40,$40,$02

CHRCK19A  DC.B      $F6,$E8,$F6,$E8,$F6,$E8,$46,$E8,$EB,$08,$2B
          DC.B      $F6,$48,$48,$47,$40,$5F,$F6,$58,$58
          DC.B      $3B,$38,$FB
          DC.B      $F8,$F6,$D8,$26,$D8,$DF,$C7,$D6,$C8,$EB
          DC.B      $08,$2B,$B6,$48,$47,$40,$5F,$B6
          DC.B      $58,$3B,$18,$FB,$A6,$D8,$DF,$C7
          DC.B      $A6,$C8,$EB,$08,$2B,$86,$48,$47
          DC.B      $40,$5F,$86,$58,$3B,$18,$FB,$76
          DC.B      $D8,$DF,$C7,$76,$C8,$EB,$2B,$66
          DC.B      $48,$47,$5F,$56,$58,$5B,$1B,$F6
          DC.B      $D8,$F6,$D8,$F6,$D8,$36,$D8,$02

CHRCK19B
          DC.B      $76,$40,$5F,$26,$5C,$F6,$58,$F6,$58,$96
          DC.B      $58,$5D,$26,$5C,$36,$40,$45,$26,$44,$48
          DC.B      $49,$36,$28,$36,$08,$E9,$26,$E8,$C8,$C8
          DC.B      $C4,$C5,$76,$C0,$DD,$26,$DC,$F6,$D8,$D8
          DC.B      $36,$DC,$C3,$26,$C0,$C7,$26,$C4,$C8,$C8
          DC.B      $EB,$26,$E8,$36,$08,$2B,$26,$28,$48,$48
          DC.B      $36,$44,$43,$26,$40,$5F,$26,$5C,$F6,$58
          DC.B      $26,$58
          DC.B      $3B,$26,$38,$36,$18,$FB,$26,$F8,$D8,$D8
          DC.B      $36,$DC,$C3,$26,$C0,$C7,$26,$C4,$C8,$CB
          DC.B      $36,$E8,$36,$08,$2B,$F6,$28,$F6,$28,$86
          DC.B      $28,$36,$48,$76,$44,$43,$D6,$40,$02

CHRCK23A  DC.B      $F6,$08,$36,$08,3,3,$B6,$40
          DC.B      1,1,$F6,8,$36,8,3,3,$B6,$40,1,1
          DC.B      $F6,8,$36,8,3,3,$F6,$40,$36,$40
          DC.B      $02

CHRCK23B  DC.B      $36,$40,$5F,$F6,$5C,$F6,$5C,$F6,$5C,$F6,$5C,$5C
          DC.B      $58,$3B,$18,$FB,$D8,$96,$DC,$C3,$F6,$C0
          DC.B      $F6,$C0,$DD,$26,$DC,$D8,$F9,$18
          DC.B      $39,$58,$36,$5C,$41,$F6,$40,$76,$40,$5F
          DC.B      $26,$5C,$58,$3B,$18,$FB,$D8,$36,$DC,$C3
          DC.B      $F6,$C0,$C0,$C0,$DD,$26,$DC,$D8,$F9,$18
          DC.B      $39,$48,$36,$5C,$41,$76,$40,$03,$03,$76
          DC.B      $18,$02

CHRCK27A  DC.B      $76,$08,$01,$01,$F6,$C0,$F6,$C0,$C0,$C3
          DC.B      $03,$03,$F6,$24,$F6,$24,$F6,$24,$F6,$24
          DC.B      $F6,$24,$F6,$24,$F6,$24,$F6,$24,$F6,$24
          DC.B      $49,$01,$01,$F6,$C0,$F6,$C0,$F6,$C0,$F6
          DC.B      $C0,$B6,$C0,$02

CHRCK27B  DC.B      $F6,$20,$5F,$26,$5C,$36,$3C,$3B,$26,$38
          DC.B      $F6,$18,$A6,$18,$39,$26,$38,$36,$3C,$21
          DC.B      $3C,$20,$3C,$76,$20,$25,$20,$24,$20
          DC.B      $24,$20,$24,$20,$24,$20,$24,$20,$24,$20,$96,$24
          DC.B      $24,$20,$27,$20
          DC.B      $B6,$20,$3F,$20,$3C,$20,$96,$3C
          DC.B      $3C,$20,$3C,$20,$3C,$20,$3C,$20,$3C,$20,$3D,$20
          DC.B      $76,$20,$25,$20,$24,$20,$36,$24,$36,$28
          DC.B      $05,$F6,$08,$A6,$08,$2B,$26,$28,$36,$24
          DC.B      $36,$44,$23,$A6,$20,$02

CHRCK31A  DC.B      $F6,$08,$B6,$08,$2B,$26,$28,$48,$48,$26
          DC.B      $44,$47,$56,$40,$5F,$26,$5C,$58,$5B,$36
          DC.B      $38,$56,$18,$FB,$26,$F8,$D8,$DB,$36,$DC
          DC.B      $56,$C0,$C7,$26,$C4,$C8,$C8,$F6,$E8,$F6
          DC.B      $E8,$56,$E8,$C8,$C8,$36,$C4,$C1,$46,$C0
          DC.B      $DD,$26,$DC,$D8,$D8,$36,$F8,$19,$46,$18
          DC.B      $36,$38,$59,$58,$26,$5C,$5D,$56,$40
          DC.B      $36,$44,$49,$48,$36,$28,$09,$46,$08,$E9
          DC.B      $F6,$E8,$E8,$36,$C8,$B6,$C4,$C1,$76,$C0
          DC.B      $02

CHRCK31B  DC.B      $F6,$5C,$F6,$5C,$F6,$5C,$56,$5C,$36,$58
          DC.B      $3B,$46,$38,$76,$18,$56,$F8,$DB,$26,$D8
          DC.B      $56,$DC,$C3,$66,$C0,$56,$C4,$CB,$26,$C8
          DC.B      $56,$E8,$0B,$66,$08,$56,$28,$4B,$26,$48
          DC.B      $56,$44,$43,$66,$40,$5F,$F6,$5C,$F6,$5C
          DC.B      $46,$5C,$02
END2      DC.B      $02

          ORG     END4
;
;THIS IS THE MOTION TABLE WHICH CAUSES AN ATACKING BLUE SHIP TO CIRCLE AROUND.
;THERE ARE 110 ENTRIES
BATBL3    DC.B      $E4,$04,$E5,$04,$E4,$04,$E4,$04,$26
          DC.B      $E4,$E0,$E4,$E0,$E4,$E0,$E4,$E0,$E5,$E0
          DC.B      $E4,$C6
          DC.B      $E0,$FC,$E0,$FD,$E0,$FC,$E0
          DC.B      $FC,$E0,$FC,$E0,$FC,$E0,$46
          DC.B      $FC,$1C,$FC,$1C,$FC,$1C,$FC,$1C,$FD,$1C
          DC.B      $FC,$C6
          DC.B      $1C,$3C,$1C,$3D,$1C,$3C,$1C
          DC.B      $3C,$1C,$3C,$1C,$3C,$1C,$46
          DC.B      $3C,$20,$3C,$20,$3C,$20,$3C,$20,$3D,$20
          DC.B      $3C,$C6
          DC.B      $20,$24,$20,$25,$20,$24,$20
          DC.B      $24,$20,$24,$20,$24,$20,$46
          DC.B      $24,$04,$24,$04,$24,$04,$24,$04,$25,$04
          DC.B      $24
          DC.B      $F6,$04,$F6,$04
          DC.B      $F6,$04,$04
BATBL3A   DC.B      $F6,$04
          DC.B      $76,$04,$0E

;THESE TABLES ARE THE MOTION TABLES FOR BOSS ATTACK
;9 ENTRIES
BOTBL1    DC.B      $FF,$1C,$DF,$FC,$C7,$E4,$E7,$04,$02

;66 ENTRIES
BOTBL2    DC.B      $05,$E4,$04,$E4,$04,$E4,$04,$26,$E4
          DC.B      $E0,$E4,$E0,$E5,$A6
          DC.B      $E0,$E1,$E0,$FC,$E0
          DC.B      $26,$FC,$1C,$FC,$1C,$FC,$1C,$FC,$1C,$FD
          DC.B      $86,$1C,$3D
          DC.B      $1C,$3C,$1C,$3C,$1C,$3C,$20,$3C,$20,$3C
          DC.B      $20,$3C,$20,$3D,$86
          DC.B      $20,$21,$20,$24,$20,$26,$24
          DC.B      $04,$24,$04,$24,$26,$04,$25,$04,$24
          DC.B      $56,$04
END5      DC.B      $02
