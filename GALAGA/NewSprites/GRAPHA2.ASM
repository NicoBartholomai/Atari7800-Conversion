
;LINE TWELVE - Bottom row for all sprites in this file
          ORG     $A000
G2START
          DC.B      0,$0C,0 ;Explo7
          DC.B      0,0 ;Percent
          DC.B      0,0 ; Scorpion 0
          DC.B      0,0 ; scorpion 1
          DC.B      0,0 ; scorpion 2
          DC.B      0,0 ; scorpion 3
          DC.B      0,0 ; scorpion 4
          DC.B      0,0 ; scorpion 5
          DC.B      0,0 ; scorpion 6
          DC.B      0,0 ; scorpion 7
          DC.B      0,0 ; scorpion f
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,0,0 ; Explosion 5
          DC.B      0,0,0 ; Explosion 4
          DC.B      0,0,0 ; Explosion 3
          DC.B      $00,$0C,$00 ; Explosion 2
          DC.B      0,0,0 ; Explosion 1
          DC.B      3,0,0 ; Explosion 0
          DC.B      0,0 ; New Bird 0
          DC.B      0,0 ; New Bird 1
          DC.B      0,0 ; New Bird 2
          DC.B      0,0 ; New Bird 3
          DC.B      0,0 ; New Bird 4
          DC.B      0,0 ; New Bird 5
          DC.B      0,0 ; New Bird 6
          DC.B      0,0 ; New Bird 7
          DC.B      0,0,0,0,0,0,0,0,0 ; Novice
          DC.B      0,0 ; S one
          DC.B      0,0 ; S two
          DC.B      0,0,0,0,0,0,0,0 ; Level
          DC.B      0,0,0,0,0,0,0,0,0,0,0,0 ; Advanced
          DC.B      0,0,0,0,0,0,0,0,0 ; Expert
MARIA2    DC.B      0,0,0,0 ; twinkle 0
          DC.B      0,0,0,0 ; twinkle 1
          DC.B      0,0,0,0 ; twinkle 2
          DC.B      0,0,0,0 ; twinkle 3
          DC.B      0,0,0,0 ; twinkle 4
          DC.B      0,0,0,0 ; twinkle 5
          DC.B      0,3,0,0 ; twinkle 6
          DC.B      $0A,$8F,$E8,$C0 ; twinkle 7
          DC.B      0,0,0,0,0 ; Left shield
          DC.B      0 ; Right shield
          DC.B      0,0,0,0 ; four type
          DC.B      0,0,0,0 ; eight type
          DC.B      0,0,0,0 ; tho type
          DC.B      0,0,0,0 ; six type
          DC.B      0,0 ; special
          DC.B      0,0 ; blue bug
          DC.B      0,0 ; blue bug f
          DC.B      0,0 ; red bug
          DC.B      0,0 ; red bug f
          DC.B      0,0 ; galaga 
          DC.B      0,0 ; galaga f
          DC.B      0,0 ; hero 0
          DC.B      0,0 ; hero 1
          DC.B      0,0 ; hero 2
          DC.B      0,0 ; hero 3
          DC.B      0,0 ; hero 4
          DC.B      0,0 ; hero 5
          DC.B      0,0 ; hero 6
          DC.B      0,0 ; hero 7
          DC.B      0,0,0,0 ; missle
          DC.B      0,0 ; missle 4
          DC.B      0,0 ; star graf
          DC.B      0,0 ; blue bug 1
          DC.B      0,0 ; blue bug 2
          DC.B      0,0 ; blue bug 3
          DC.B      0,0 ; blue bug 4
          DC.B      0,0 ; blue bug 5
          DC.B      0,0 ; blue bug 6
          DC.B      0,0 ; blue bug 7
          DC.B      0,0 ; red bug 1
          DC.B      0,0 ; red bug 2
          DC.B      0,0 ; red bug 3
          DC.B      0,0 ; red bug 4
          DC.B      0,0 ; red bug 5
          DC.B      0,0 ; red bug 6
          DC.B      0,0 ; red bug 7
          DC.B      0,0 ; galaga 1
          DC.B      0,0 ; galaga 2
          DC.B      0,0 ; galaga 3
          DC.B      0,0 ; galaga 4
          DC.B      0,0 ; galaga 5
          DC.B      0,0 ; galaga 6
          DC.B      0,0 ; galaga 7
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
        ;   DC.B      0,0
        ;   DC.B      0,0




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
        ;   DC.B      0,0
        ;   DC.B      0,0





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
        ;   DC.B      0,0
        ;   DC.B      0,0




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
        ;   DC.B      0,0






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
        ;   DC.B      0,0





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
        ;   DC.B      0,0



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
        ;   DC.B      0,0



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
        ;   DC.B      0,0
        ;   DC.B      0,0




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
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0
        ;   DC.B      0,0



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
        ;   DC.B      0,0





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
        ;   DC.B      0,0





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