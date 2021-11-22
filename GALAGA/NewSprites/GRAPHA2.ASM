;LINE TWELVE - Bottom row for all sprites in this file
          ORG     $A000
G2START   DC.B      0,$0C,0 ;Explo7
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
DIGIT     DC.B      $05,$40 ; 0
          DC.B      $05,$50 ; 1 
          DC.B      $55,$50 ; 2
          DC.B      $55,$40 ; 3
          DC.B      $00,$40 ; 4
          DC.B      $55,$40 ; 5
          DC.B      $15,$40 ; 6
          DC.B      $15,$40 ; 7
          DC.B      $15,$40 ; 8
          DC.B      $54,$00 ; 9
;11th LINE
          ORG     $A100 ;  
          DC.B      0,$C0,$B0 ; Explosion 7
          DC.B      0,0 ; Percent
          DC.B      0,0 ; Scorpion 0
          DC.B      0,0 ; Scorpion 1
          DC.B      0,0 ; Scorpion 2
          DC.B      0,0 ; Scorpion 3
          DC.B      0,0 ; Scorpion 4
          DC.B      0,0 ; Scorpion 5
          DC.B      0,0 ; Scorpion 6
          DC.B      0,0 ; Scorpion 7
          DC.B      0,0 ; Scorpion F
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,0,0 ; Explosion 5
          DC.B      0,0,0 ; Explosion 4
          DC.B      0,0,0 ; Explosion 3
          DC.B      0,0,0 ; Explosion 2
          DC.B      $30,$C0,0 ; Explosion 1
          DC.B      0,0,$30 ; Explosion 0
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
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,0,0,0 ; Twinkle 2
          DC.B      0,0,0,0 ; Twinkle 3
          DC.B      0,0,0,0 ; Twinkle 4
          DC.B      0,3,0,0 ; Twinkle 5
          DC.B      0,$0F,$C0,0 ; Twinkle 6
          DC.B      $AE,$AF,$EB,$E0 ; Twinkle 7
          DC.B      $FF,$FF,$FF,$FF,$FF ; Left Shield
          DC.B      $FF ; Right Shield
          DC.B      0,0,0,0 ; Four Type
          DC.B      0,0,0,0 ; Eight Type
          DC.B      0,0,0,0 ; Tho Type
          DC.B      0,0,0,0 ; Six Type
          DC.B      0,0 ; Special
          DC.B      0,0 ; Blue Bug 0
          DC.B      0,0 ; Blue Bug F
          DC.B      0,0 ; Red Bug 0
          DC.B      0,0 ; Red Bug F
          DC.B      $10,$10 ; Galaga 0
          DC.B      0,0 ; Galaga F
          DC.B      0,0 ; Hero 0
          DC.B      0,0 ; Hero 1
          DC.B      0,0 ; Hero 2
          DC.B      0,0 ; Hero 3
          DC.B      0,0 ; Hero 4
          DC.B      0,0 ; Hero 5
          DC.B      0,0 ; Hero 6
          DC.B      0,0 ; Hero 7
          DC.B      0,0,0,0 ; Missile
          DC.B      0,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      0,0 ; Blue Bug 1
          DC.B      0,0 ; Blue Bug 2
          DC.B      0,0 ; Blue Bug 3
          DC.B      0,0 ; Blue Bug 4
          DC.B      0,0 ; Blue Bug 5
          DC.B      0,0 ; Blue Bug 6
          DC.B      0,0 ; Blue Bug 7
          DC.B      0,0 ; Red Bug 1
          DC.B      0,0 ; Red Bug 2
          DC.B      0,0 ; Red Bug 3
          DC.B      0,0 ; Red Bug 4
          DC.B      0,0 ; Red Bug 5
          DC.B      0,0 ; Red Bug 6
          DC.B      0,0 ; Red Bug 7
          DC.B      0,0 ; Galaga 1
          DC.B      0,0 ; Galaga 2
          DC.B      0,0 ; Galaga 3
          DC.B      0,0 ; Galaga 4
          DC.B      0,0 ; Galaga 5
          DC.B      0,0 ; Galaga 6
          DC.B      0,0 ; Galaga 7
          DC.B      $15,$50 ; 0
          DC.B      $5,$50 ; 1
          DC.B      $15,$50 ; 2
          DC.B      $55,$50 ; 3
          DC.B      0,$40 ; 4
          DC.B      $55,$50 ; 5
          DC.B      $55,$50 ; 6
          DC.B      $5,0 ; 7
          DC.B      $55,$50 ; 8
          DC.B      $15,0 ; 9
;10TH LINE ;  
          ORG     $A200 ;  
          DC.B      0,$28,$80 ; Explosion 7
          DC.B      0,0 ; Percent
          DC.B      $28,$00 ; Scorpion 0
          DC.B      $A0,$00 ; Scorpion 1
          DC.B      $00,$15 ; Scorpion 2
          DC.B      $02,$40 ; Scorpion 3
          DC.B      $CC,$33 ; Scorpion 4
          DC.B      $01,$80 ; Scorpion 5
          DC.B      0,0 ; Scorpion 6
          DC.B      0,$08 ; Scorpion 7
          DC.B      $00,$28 ; Scorpion F
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,0,0 ; Explosion 5
          DC.B      0,0,0 ; Explosion 4
          DC.B      0,$0C,0 ; Explosion 3
          DC.B      $0C,$30,0 ; Explosion 2
          DC.B      0,0,$C0 ; Explosion 1
          DC.B      0,0,0 ; Explosion 0
          DC.B      $03,$00 ; New Bird 0
          DC.B      $81,$00 ; New Bird 1
          DC.B      $15,$A0 ; New Bird 2
          DC.B      $02,$30 ; New Bird 3
          DC.B      $1C,$D0 ; New Bird 4
          DC.B      $32,$00 ; New Bird 5
          DC.B      $29,$50 ; New Bird 6
          DC.B      $01,$08 ; New Bird 7
          DC.B      0,0,0,0,0,0,0,0,0 ; Novice
          DC.B      0,0 ; S one
          DC.B      0,0 ; S two
          DC.B      0,0,0,0,0,0,0,0 ; Level
          DC.B      0,0,0,0,0,0,0,0,0,0,0,0 ; Advanced
          DC.B      0,0,0,0,0,0,0,0,0 ; Expert
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,0,0,0 ; Twinkle 2
          DC.B      0,0,0,0 ; Twinkle 3
          DC.B      0,3,0,0 ; Twinkle 4
          DC.B      0,3,0,0 ; Twinkle 5
          DC.B      0,$3D,$F0,0 ; Twinkle 6
          DC.B      $AF,$EF,$EF,$E8 ; Twinkle 7
          DC.B      0,0,0,0,0 ; Left Shield
          DC.B      0 ; Right Shield
          DC.B      0,0,0,0 ; Four Type
          DC.B      0,0,0,0 ; Eight Type
          DC.B      0,0,0,0 ; Tho Type
          DC.B      0,0,0,0 ; Six Type
          DC.B      0,0 ; Special
          DC.B      $80,$08 ; Blue Bug 0
          DC.B      $20,$20 ; Blue Bug F
          DC.B      $30,$30 ; Red Bug 0
          DC.B      $30,$30 ; Red Bug F
          DC.B      $60,$24 ; Galaga 0
          DC.B      $04,$40 ; Galaga F
          DC.B      $CB,$8C ; Hero 0
          DC.B      $3,0 ; Hero 1
          DC.B      $55,0 ; Hero 2
          DC.B      $0,0 ; Hero 3
          DC.B      1,0 ; Hero 4
          DC.B      0,0 ; Hero 5
          DC.B      1,$54 ; Hero 6
          DC.B      3,0 ; Hero 7
          DC.B      0,0,0,0 ; Missile
          DC.B      0,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      $0A,$00 ; Blue Bug 1
          DC.B      $A8,$00 ; Blue Bug 2
          DC.B      $0A,$10 ; Blue Bug 3
          DC.B      $04,$40 ; Blue Bug 4
          DC.B      $12,$80 ; Blue Bug 5
          DC.B      $00,$A8 ; Blue Bug 6
          DC.B      $02,$80 ; Blue Bug 7
          DC.B      $0F,$C0 ; Red Bug 1
          DC.B      $0F,$30 ; Red Bug 2
          DC.B      $0F,$50 ; Red Bug 3
          DC.B      $14,$50 ; Red Bug 4
          DC.B      $17,$C0 ; Red Bug 5
          DC.B      $33,$C0 ; Red Bug 6
          DC.B      $0F,$C0 ; Red Bug 7
          DC.B      $06,$40 ; Galaga 1
          DC.B      $25,$10 ; Galaga 2
          DC.B      $09,$10 ; Galaga 3
          DC.B      $05,$00 ; Galaga 4
          DC.B      $11,$80 ; Galaga 5
          DC.B      $45,$80 ; Galaga 6
          DC.B      $06,$40 ; Galaga 7
          DC.B      $54,$54 ; 0
          DC.B      $1,$40 ; 1
          DC.B      $5,0 ; 2
          DC.B      $40,$50 ; 3
          DC.B      $55,$50 ; 4
          DC.B      0,$50 ; 5
          DC.B      $50,$50 ; 6
          DC.B      $5,0 ; 7
          DC.B      $50,$50 ; 8
          DC.B      $5,$40 ; 9
;9TH LINE ;  
          ORG     $A300 ;  
          DC.B      0,$2A,$80 ; Explosion 7
          DC.B      0,0 ; Percent
          DC.B      $82,0 ; Scorpion 0
          DC.B      $88,$10 ; Scorpion 1
          DC.B      0,$54 ; Scorpion 2
          DC.B      5,$40 ; Scorpion 3
          DC.B      $D3,$C7 ; Scorpion 4
          DC.B      $01,$50 ; Scorpion 5
          DC.B      $54,0 ; Scorpion 6
          DC.B      4,$22 ; Scorpion 7
          DC.B      0,$82 ; Scorpion F
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,0,0 ; Explosion 5
          DC.B      0,$0C,0 ; Explosion 4
          DC.B      3,0,0 ; Explosion 3
          DC.B      0,3,4 ; Explosion 2
          DC.B      0,0,0 ; Explosion 1
          DC.B      0,0,0 ; Explosion 0
          DC.B      $03,$00 ; New Bird 0
          DC.B      $A1,$40 ; New Bird 1
          DC.B      $15,$A0 ; New Bird 2
          DC.B      $0A,$3C ; New Bird 3
          DC.B      $0E,$C0 ; New Bird 4
          DC.B      $F2,$80 ; New Bird 5
          DC.B      $29,$50 ; New Bird 6
          DC.B      $05,$28 ; New Bird 7
          DC.B      0,0,0,0,0,0,0,0,0 ; Novice
          DC.B      0,0 ; S one
          DC.B      0,0 ; S two
          DC.B      0,0,0,0,0,0,0,0 ; Level
          DC.B      0,0,0,0,0,0,0,0,0,0,0,0 ; Advanced
          DC.B      0,0,0,0,0,0,0,0,0 ; Expert
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,0,0,0 ; Twinkle 2
          DC.B      0,3,0,0 ; Twinkle 3
          DC.B      0,3,0,0 ; Twinkle 4
          DC.B      0,$0F,$C0,0 ; Twinkle 5
          DC.B      $00,$F5,$7C,$00 ; Twinkle 6
          DC.B      $AB,$F7,$7F,$A8 ; Twinkle 7
          DC.B      $AA,$AA,$AA,$AA,$AA ; Left Shield
          DC.B      $AA ; Right Shield
          DC.B      0,0,0,0 ; Four Type
          DC.B      0,0,0,0 ; Eight Type
          DC.B      0,0,0,0 ; Tho Type
          DC.B      0,0,0,0 ; Six Type
          DC.B      0,0 ; Special
          DC.B      $A3,$28 ; Blue Bug 0
          DC.B      $23,$20 ; Blue Bug F
          DC.B      $F1,$3C ; Red Bug 0
          DC.B      $31,$30 ; Red Bug F
          DC.B      $A0,$28 ; Galaga 0
          DC.B      $10,$10 ; Galaga F
          DC.B      $EB,$AC ; Hero 0
          DC.B      $33,$C0 ; Hero 1
          DC.B      $FF,0 ; Hero 2
          DC.B      $0F,$3C ; Hero 3
          DC.B      3,0 ; Hero 4
          DC.B      $F3,$C0 ; Hero 5
          DC.B      3,$FC ; Hero 6
          DC.B      $F,$30 ; Hero 7
          DC.B      2,0,8,0 ; Missile
          DC.B      0,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      $0A,$80 ; Blue Bug 1
          DC.B      $AA,$80 ; Blue Bug 2
          DC.B      $2A,$B0 ; Blue Bug 3
          DC.B      $0D,$C0 ; Blue Bug 4
          DC.B      $3A,$A0 ; Blue Bug 5
          DC.B      $0A,$A8 ; Blue Bug 6
          DC.B      $0A,$80 ; Blue Bug 7
          DC.B      $0F,$F0 ; Red Bug 1
          DC.B      $3F,$FC ; Red Bug 2
          DC.B      $3E,$C0 ; Red Bug 3
          DC.B      $FD,$FC ; Red Bug 4
          DC.B      $0E,$F0 ; Red Bug 5
          DC.B      $FF,$F0 ; Red Bug 6
          DC.B      $3F,$C0 ; Red Bug 7
          DC.B      $01,$50 ; Galaga 1
          DC.B      $65,$D0 ; Galaga 2
          DC.B      $0D,$D0 ; Galaga 3
          DC.B      $5F,$50 ; Galaga 4
          DC.B      $1D,$C0 ; Galaga 5
          DC.B      $75,$90 ; Galaga 6
          DC.B      $15,$00 ; Galaga 7
          DC.B      $50,$14 ; 0
          DC.B      $1,$40 ; 1
          DC.B      $1,$40 ; 2
          DC.B      0,$50 ; 3
          DC.B      $55,$50 ; 4
          DC.B      0,$50 ; 5
          DC.B      $50,$50 ; 6
          DC.B      $1,$40 ; 7
          DC.B      $50,$50 ; 8
          DC.B      $1,$40 ; 9
; 8TH LINE ;  
          ORG     $A400 ;  
          DC.B      0,$0A,$AC ; Explosion 7
          DC.B      $02,$80 ; Percent
          DC.B      $02,0 ; Scorpion 0
          DC.B      $88,$54 ; Scorpion 1
          DC.B      $00,$40 ; Scorpion 2
          DC.B      $15,$10 ; Scorpion 3
          DC.B      $D2,$87 ; Scorpion 4
          DC.B      $04,$54 ; Scorpion 5
          DC.B      $15,$00 ; Scorpion 6
          DC.B      $15,$22 ; Scorpion 7
          DC.B      $00,$80 ; Scorpion F
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,$0C,0 ; Explosion 5
          DC.B      0,$C0,0 ; Explosion 4
          DC.B      0,$0C,$10 ; Explosion 3
          DC.B      2,0,0 ; Explosion 2
          DC.B      8,0,0 ; Explosion 1
          DC.B      $80,0,0 ; Explosion 0
          DC.B      $53,$14 ; New Bird 0
          DC.B      $29,$50 ; New Bird 1
          DC.B      $05,$A0 ; New Bird 2
          DC.B      $1A,$3C ; New Bird 3
          DC.B      $A2,$28 ; New Bird 4
          DC.B      $F2,$90 ; New Bird 5
          DC.B      $29,$40 ; New Bird 6
          DC.B      $15,$A0 ; New Bird 7
          DC.B      $A0,$82,$A0,$08,$0A,$A0,$A8,$2A,$A0 ; Novice
          DC.B      $AA,$00 ; S one
          DC.B      $AA,$80 ; S two
          DC.B      $AA,$8A,$A8,$08,$0A,$A8,$AA,$80 ; Level
          DC.B      $A2,$8A,$A0,$08,$0A,$28,$A0,$82,$A0,$AA,$8A,$A0 ; Advanced
          DC.B      $AA,$8A,$28,$A0,$0A,$A8,$A2,$82,$80 ; Expert
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,3,0,0 ; Twinkle 2
          DC.B      0,1,0,0 ; Twinkle 3
          DC.B      0,$0D,$C0,0 ; Twinkle 4
          DC.B      0,$3D,$F0,0 ; Twinkle 5
          DC.B      $03,$DD,$DF,$00 ; Twinkle 6
          DC.B      $8A,$DD,$DE,$A8 ; Twinkle 7
          DC.B      0,0,0,0,0 ; Left Shield
          DC.B      0 ; Right Shield
          DC.B      0,0,0,0 ; Four Type
          DC.B      0,0,0,0 ; Eight Type
          DC.B      0,0,0,0 ; Tho Type
          DC.B      0,0,0,0 ; Six Type
          DC.B      0,0 ; Special
          DC.B      $A3,$28 ; Blue Bug 0
          DC.B      $23,$20 ; Blue Bug F
          DC.B      $F1,$3C ; Red Bug 0
          DC.B      $35,$70 ; Red Bug F
          DC.B      $52,$14 ; Galaga 0
          DC.B      $52,$14 ; Galaga F
          DC.B      $F7,$DC ; Hero 0
          DC.B      $F7,$F0 ; Hero 1
          DC.B      $3C,0 ; Hero 2
          DC.B      $3C,$FC ; Hero 3
          DC.B      3,0 ; Hero 4
          DC.B      $FC,$F0 ; Hero 5
          DC.B      0,$F0 ; Hero 6
          DC.B      $3F,$7C ; Hero 7
          DC.B      2,0,8,0 ; Missile
          DC.B      3,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      $02,$A0 ; Blue Bug 1
          DC.B      $2A,$84 ; Blue Bug 2
          DC.B      $AE,$50 ; Blue Bug 3
          DC.B      $05,$40 ; Blue Bug 4
          DC.B      $16,$E8 ; Blue Bug 5
          DC.B      $4A,$A0 ; Blue Bug 6
          DC.B      $2A,$00 ; Blue Bug 7
          DC.B      $03,$F0 ; Red Bug 1
          DC.B      $FF,$F4 ; Red Bug 2
          DC.B      $FF,$B4 ; Red Bug 3
          DC.B      $FA,$BC ; Red Bug 4
          DC.B      $7B,$FC ; Red Bug 5
          DC.B      $6F,$FC ; Red Bug 6
          DC.B      $3F,$00 ; Red Bug 7
          DC.B      $00,$50 ; Galaga 1
          DC.B      $01,$C0 ; Galaga 2
          DC.B      $17,$F4 ; Galaga 3
          DC.B      $1F,$40 ; Galaga 4
          DC.B      $7F,$50 ; Galaga 5
          DC.B      $34,$00 ; Galaga 6
          DC.B      $14,$00 ; Galaga 7
          DC.B      $50,$14 ; 0
          DC.B      $1,$40 ; 1
          DC.B      $0,$40 ; 2
          DC.B      $5,$50 ; 3
          DC.B      $50,$40 ; 4
          DC.B      $55,$50 ; 5
          DC.B      $50,$50 ; 6
          DC.B      $1,$40 ; 7
          DC.B      $55,$50 ; 8
          DC.B      $55,$50 ; 9
;7 TH LINE ;  
          ORG     $A500 ;  
          DC.B      3,$AA,$80 ; Explosion 7
          DC.B      $82,$80 ; Percent
          DC.B      $02,$80 ; Scorpion 0
          DC.B      $0A,$55 ; Scorpion 1
          DC.B      $0A,$A1 ; Scorpion 2
          DC.B      $14,$A4 ; Scorpion 3
          DC.B      $D2,$87 ; Scorpion 4
          DC.B      $1A,$14 ; Scorpion 5
          DC.B      $01,$00 ; Scorpion 6
          DC.B      $55,$A0 ; Scorpion 7
          DC.B      $02,$80 ; Scorpion F
          DC.B      0,$0F,$80 ; Explosion 6
          DC.B      0,$30,0 ; Explosion 5
          DC.B      0,$0C,$40 ; Explosion 4
          DC.B      0,$80,0 ; Explosion 3
          DC.B      0,0,0 ; Explosion 2
          DC.B      0,0,0 ; Explosion 1
          DC.B      0,0,0 ; Explosion 0
          DC.B      $56,$54 ; New Bird 0
          DC.B      $0A,$68 ; New Bird 1
          DC.B      $01,$8C ; New Bird 2
          DC.B      $56,$80 ; New Bird 3
          DC.B      $AA,$A8 ; New Bird 4
          DC.B      $0A,$54 ; New Bird 5
          DC.B      $C9,$00 ; New Bird 6
          DC.B      $A6,$80 ; New Bird 7
          DC.B      $A2,$8A,$A8,$2A,$02,$82,$AA,$2A,$A0 ; Novice
          DC.B      $AA,$00 ; S one
          DC.B      $AA,$80 ; S two
          DC.B      $AA,$8A,$A8,$2A,$0A,$A8,$AA,$80 ; Level
          DC.B      $A2,$8A,$A8,$2A,$0A,$28,$A2,$8A,$A8,$AA,$8A,$A8 ; Advanced
          DC.B      $AA,$8A,$28,$A0,$0A,$A8,$A2,$82,$80 ; Expert
          DC.B      0,1,0,0 ; Twinkle 0
          DC.B      0,3,0,0 ; Twinkle 1
          DC.B      0,$0D,$C0,0 ; Twinkle 2
          DC.B      0,$0D,$C0,0 ; Twinkle 3
          DC.B      0,$35,$70,0 ; Twinkle 4
          DC.B      $00,$F5,$7C,$00 ; Twinkle 5
          DC.B      $0F,$75,$77,$C0 ; Twinkle 6
          DC.B      $BF,$F7,$77,$F8 ; Twinkle 7
          DC.B      $55,$55,$55,$55,$55 ; Left Shield
          DC.B      $55 ; Right Shield
          DC.B      $8A,$8A,$8A,$80 ; Four Type
          DC.B      $8A,$8A,$8A,$80 ; Eight Type
          DC.B      $A8,$A8,$A8,$00 ; Tho Type
          DC.B      $08,$A8,$A8,$00 ; Six Type
          DC.B      $F0,$FC ; Special
          DC.B      $A5,$68 ; Blue Bug 0
          DC.B      $25,$E0 ; Blue Bug F
          DC.B      $F5,$7C ; Red Bug 0
          DC.B      $35,$70 ; Red Bug F
          DC.B      $53,$14 ; Galaga 0
          DC.B      $53,$14 ; Galaga F
          DC.B      $F7,$DC ; Hero 0
          DC.B      $3D,$F0 ; Hero 1
          DC.B      $AF,$C0 ; Hero 2
          DC.B      $F7,$F0 ; Hero 3
          DC.B      $7,$40 ; Hero 4
          DC.B      $3F,$7C ; Hero 5
          DC.B      $0F,$E8 ; Hero 6
          DC.B      $3D,$F0 ; Hero 7
          DC.B      2,0,8,0 ; Missile
          DC.B      $0A,$80 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      $21,$A0 ; Blue Bug 1
          DC.B      $07,$D8 ; Blue Bug 2
          DC.B      $A7,$5C ; Blue Bug 3
          DC.B      $21,$20 ; Blue Bug 4
          DC.B      $D7,$68 ; Blue Bug 5
          DC.B      $9F,$40 ; Blue Bug 6
          DC.B      $29,$20 ; Blue Bug 7
          DC.B      $04,$F0 ; Red Bug 1
          DC.B      $05,$F4 ; Red Bug 2
          DC.B      $F5,$B4 ; Red Bug 3
          DC.B      $3E,$F0 ; Red Bug 4
          DC.B      $79,$7C ; Red Bug 5
          DC.B      $6D,$40 ; Red Bug 6
          DC.B      $3C,$40 ; Red Bug 7
          DC.B      $40,$74 ; Galaga 1
          DC.B      $0F,$D0 ; Galaga 2
          DC.B      $55,$F4 ; Galaga 3
          DC.B      $25,$80 ; Galaga 4
          DC.B      $7D,$F4 ; Galaga 5
          DC.B      $7F,$00 ; Galaga 6
          DC.B      $74,$04 ; Galaga 7
          DC.B      $50,$14 ; 0
          DC.B      $1,$40 ; 1
          DC.B      0,$50 ; 2
          DC.B      $5,$50 ; 3
          DC.B      $14,$40 ; 4
          DC.B      $55,$40 ; 5
          DC.B      $55,$40 ; 6
          DC.B      $0,$40 ; 7
          DC.B      $55,$50 ; 8
          DC.B      $50,$50 ; 9
;6 TH LINE ;  
          ORG     $A600 ;  
          DC.B      0,$8A,$A0 ; Explosion 7
          DC.B      $A2,$80 ; Percent
          DC.B      $02,$80 ; Scorpion 0
          DC.B      $0A,$85 ; Scorpion 1
          DC.B      $2A,$A8 ; Scorpion 2
          DC.B      $06,$A1 ; Scorpion 3
          DC.B      $1A,$94 ; Scorpion 4
          DC.B      $4A,$90 ; Scorpion 5
          DC.B      $4A,$A0 ; Scorpion 6
          DC.B      $52,$A0 ; Scorpion 7
          DC.B      $02,$80 ; Scorpion F
          DC.B      0,$3F,0 ; Explosion 6
          DC.B      0,$C1,0 ; Explosion 5
          DC.B      3,$20,0 ; Explosion 4
          DC.B      0,0,0 ; Explosion 3
          DC.B      0,0,$80 ; Explosion 2
          DC.B      0,0,$20 ; Explosion 1
          DC.B      0,0,0 ; Explosion 0
          DC.B      $56,$54 ; New Bird 0
          DC.B      $56,$A8 ; New Bird 1
          DC.B      $AA,$BC ; New Bird 2
          DC.B      $56,$A8 ; New Bird 3
          DC.B      $56,$54 ; New Bird 4
          DC.B      $AA,$54 ; New Bird 5
          DC.B      $FA,$A8 ; New Bird 6
          DC.B      $AA,$54 ; New Bird 7
          DC.B      $AA,$8A,$28,$AA,$82,$82,$8A,$28,$0 ; Novice
          DC.B      $28,$00 ; S one
          DC.B      $2A,$00 ; S two
          DC.B      $A0,$0A,$00,$AA,$8A,$00,$A0,$00 ; Level
          DC.B      $AA,$8A,$28,$AA,$8A,$A8,$AA,$8A,$28,$A0,$0A,$28 ; Advanced
          DC.B      $A0,$0A,$A8,$AA,$0A,$00,$AA,$82,$80 ; Expert
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,$0D,$C0,0 ; Twinkle 1
          DC.B      0,$35,$70,0 ; Twinkle 2
          DC.B      0,$D5,$5C,0 ; Twinkle 3
          DC.B      3,$D5,$5F,0 ; Twinkle 4
          DC.B      $0F,$D5,$5F,$C0 ; Twinkle 5
          DC.B      $3D,$55,$55,$F0 ; Twinkle 6
          DC.B      $BF,$DD,$DF,$F8 ; Twinkle 7
          DC.B      0,0,0,0,0 ; Left Shield
          DC.B      0 ; Right Shield
          DC.B      $88,$88,$88,$80 ; Four Type
          DC.B      $88,$88,$88,$80 ; Eight Type
          DC.B      $88,$88,$88,$00 ; Tho Type
          DC.B      $08,$88,$88,$00 ; Six Type
          DC.B      $CC,$C0 ; Special
          DC.B      $AF,$E8 ; Blue Bug 0
          DC.B      $2F,$E0 ; Blue Bug F
          DC.B      $F5,$7C ; Red Bug 0
          DC.B      $3E,$F0 ; Red Bug F
          DC.B      $57,$54 ; Galaga 0
          DC.B      $57,$54 ; Galaga F
          DC.B      $F7,$DC ; Hero 0
          DC.B      $0F,$70 ; Hero 1
          DC.B      $55,$54 ; Hero 2
          DC.B      $DF,$C0 ; Hero 3
          DC.B      $C7,$CC ; Hero 4
          DC.B      $0F,$DC ; Hero 5
          DC.B      $55,$54 ; Hero 6
          DC.B      $37,$C0 ; Hero 7
          DC.B      2,0,8,0 ; Missile
          DC.B      2,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      $29,$E0 ; Blue Bug 1
          DC.B      $A7,$54 ; Blue Bug 2
          DC.B      $81,$E4 ; Blue Bug 3
          DC.B      $2F,$E0 ; Blue Bug 4
          DC.B      $6D,$08 ; Blue Bug 5
          DC.B      $57,$68 ; Blue Bug 6
          DC.B      $2D,$A0 ; Blue Bug 7
          DC.B      $C5,$7C ; Red Bug 1
          DC.B      $95,$F8 ; Red Bug 2
          DC.B      $F5,$6C ; Red Bug 3
          DC.B      $35,$70 ; Red Bug 4
          DC.B      $E5,$3C ; Red Bug 5
          DC.B      $AD,$58 ; Red Bug 6
          DC.B      $F5,$4C ; Red Bug 7
          DC.B      $A3,$74 ; Galaga 1
          DC.B      $0F,$D0 ; Galaga 2
          DC.B      $5B,$7C ; Galaga 3
          DC.B      $50,$50 ; Galaga 4
          DC.B      $57,$94 ; Galaga 5
          DC.B      $7F,$00 ; Galaga 6
          DC.B      $77,$28 ; Galaga 7
          DC.B      $50,$14 ; 0
          DC.B      $1,$40 ; 1
          DC.B      $50,$50 ; 2
          DC.B      0,$50 ; 3
          DC.B      $15,$40 ; 4
          DC.B      $50,0 ; 5
          DC.B      $50,0 ; 6
          DC.B      $40,$50 ; 7
          DC.B      $50,$50 ; 8
          DC.B      $50,$50 ; 9
; 5 TH LINE ;  
          ORG     $A700 ;  
          DC.B      0,$0A,$80 ; Explosion 7
          DC.B      $28,0 ; Percent
          DC.B      $1A,$94 ; Scorpion 0
          DC.B      $06,$A1 ; Scorpion 1
          DC.B      $8A,$A1 ; Scorpion 2
          DC.B      $0A,$85 ; Scorpion 3
          DC.B      $02,$80 ; Scorpion 4
          DC.B      $52,$A0 ; Scorpion 5
          DC.B      $2A,$A8 ; Scorpion 6
          DC.B      $4A,$90 ; Scorpion 7
          DC.B      $1A,$94 ; Scorpion F
          DC.B      0,$0D,$C0 ; Explosion 6
          DC.B      0,$0C,0 ; Explosion 5
          DC.B      0,3,0 ; Explosion 4
          DC.B      $0C,0,$C0 ; Explosion 3
          DC.B      $30,$C0,$0C ; Explosion 2
          DC.B      0,0,0 ; Explosion 1
          DC.B      0,0,0 ; Explosion 0
          DC.B      $AA,$A8 ; New Bird 0
          DC.B      $56,$80 ; New Bird 1
          DC.B      $0A,$8C ; New Bird 2
          DC.B      $0A,$68 ; New Bird 3
          DC.B      $56,$54 ; New Bird 4
          DC.B      $A6,$80 ; New Bird 5
          DC.B      $C9,$00 ; New Bird 6
          DC.B      $0A,$54 ; New Bird 7
          DC.B      $AA,$8A,$28,$A2,$82,$82,$80,$2A,$80 ; Novice
          DC.B      $28,$00 ; S one
          DC.B      $0A,$80 ; S two
          DC.B      $A0,$0A,$A0,$A2,$8A,$A0,$A0,$00 ; Level
          DC.B      $AA,$8A,$28,$A2,$8A,$A8,$AA,$8A,$00,$AA,$0A,$28 ; Advanced
          DC.B      $AA,$02,$A0,$AA,$8A,$A0,$AA,$02,$80 ; Expert
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,3,0,0 ; Twinkle 1
          DC.B      0,$0D,$C0,0 ; Twinkle 2
          DC.B      0,$0D,$C0,0 ; Twinkle 3
          DC.B      0,$35,$70,0 ; Twinkle 4
          DC.B      0,$F5,$7C,0 ; Twinkle 5
          DC.B      $0F,$75,$77,$C0 ; Twinkle 6
          DC.B      $AA,$F7,$76,$A8 ; Twinkle 7
          DC.B      $3F,$FF,$FF,$FF,$FF ; Left Shield
          DC.B      $FC ; Right Shield
          DC.B      $8A,$88,$88,$80 ; Four Type
          DC.B      $88,$88,$88,$80 ; Eight Type
          DC.B      $A8,$88,$88,$00 ; Tho Type
          DC.B      $A8,$88,$88,$00 ; Six Type
          DC.B      $CC,$C0 ; Special
          DC.B      $2F,$E0 ; Blue Bug 0
          DC.B      $2E,$E0 ; Blue Bug F
          DC.B      $3E,$F0 ; Red Bug 0
          DC.B      $3E,$F0 ; Red Bug F
          DC.B      $27,$60 ; Galaga 0
          DC.B      $17,$50 ; Galaga F
          DC.B      $C7,$CC ; Hero 0
          DC.B      $DF,$C0 ; Hero 1
          DC.B      $FF,$FC ; Hero 2
          DC.B      $0F,$70 ; Hero 3
          DC.B      $F7,$DC ; Hero 4
          DC.B      $37,$C0 ; Hero 5
          DC.B      $FF,$FC ; Hero 6
          DC.B      $F,$DC ; Hero 7
          DC.B      2,0,8,0 ; Missile
          DC.B      2,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      $81,$E4 ; Blue Bug 1
          DC.B      $A7,$54 ; Blue Bug 2
          DC.B      $29,$E0 ; Blue Bug 3
          DC.B      $AF,$E8 ; Blue Bug 4
          DC.B      $2D,$A0 ; Blue Bug 5
          DC.B      $57,$68 ; Blue Bug 6
          DC.B      $6D,$88 ; Blue Bug 7
          DC.B      $F5,$6C ; Red Bug 1
          DC.B      $95,$F8 ; Red Bug 2
          DC.B      $C5,$7C ; Red Bug 3
          DC.B      $75,$7C ; Red Bug 4
          DC.B      $F5,$4C ; Red Bug 5
          DC.B      $AD,$58 ; Red Bug 6
          DC.B      $E5,$7C ; Red Bug 7
          DC.B      $5B,$7C ; Galaga 1
          DC.B      $01,$C0 ; Galaga 2
          DC.B      $A3,$74 ; Galaga 3
          DC.B      $50,$50 ; Galaga 4
          DC.B      $77,$28 ; Galaga 5
          DC.B      $34,$00 ; Galaga 6
          DC.B      $57,$94 ; Galaga 7
          DC.B      $54,$54 ; 0
          DC.B      $1,$40 ; 1
          DC.B      $50,$50 ; 2
          DC.B      $40,$50 ; 3
          DC.B      $5,$40 ; 4
          DC.B      $50,$0 ; 5
          DC.B      $50,$10 ; 6
          DC.B      $50,$50 ; 7
          DC.B      $50,$50 ; 8
          DC.B      $50,$50 ; 9
;4 TH LINE ;  
          ORG     $A800 ;  
          DC.B      $00,$E8,$B0 ; Explosion 7
          DC.B      $0A,0 ; Percent
          DC.B      $D2,$87 ; Scorpion 0
          DC.B      $14,$A4 ; Scorpion 1
          DC.B      $80,$40 ; Scorpion 2
          DC.B      $0A,$55 ; Scorpion 3
          DC.B      $02,$80 ; Scorpion 4
          DC.B      $55,$A0 ; Scorpion 5
          DC.B      $4A,$A2 ; Scorpion 6
          DC.B      $1A,$14 ; Scorpion 7
          DC.B      $5E,$D4 ; Scorpion F
          DC.B      0,$0C,$C0 ; Explosion 6
          DC.B      0,$C3,0 ; Explosion 5
          DC.B      0,$4C,0 ; Explosion 4
          DC.B      0,$30,0 ; Explosion 3
          DC.B      0,0,0 ; Explosion 2
          DC.B      3,0,0 ; Explosion 1
          DC.B      0,0,0 ; Explosion 0
          DC.B      $A2,$28 ; New Bird 0
          DC.B      $1A,$3C ; New Bird 1
          DC.B      $05,$A0 ; New Bird 2
          DC.B      $29,$50 ; New Bird 3
          DC.B      $53,$14 ; New Bird 4
          DC.B      $15,$A0 ; New Bird 5
          DC.B      $29,$40 ; New Bird 6
          DC.B      $F2,$90 ; New Bird 7
          DC.B      $AA,$8A,$28,$A2,$82,$82,$80,$2A,$80 ; Novice
          DC.B      $28,$00 ; S one
          DC.B      $A2,$80 ; S two
          DC.B      $A0,$0A,$A0,$A2,$8A,$A0,$A0,$00 ; Level
          DC.B      $A2,$8A,$28,$A2,$8A,$28,$AA,$8A,$00,$AA,$0A,$28 ; Advanced
          DC.B      $AA,$02,$A0,$A2,$8A,$A0,$A2,$82,$80 ; Expert
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,3,0,0 ; Twinkle 2
          DC.B      0,1,0,0 ; Twinkle 3
          DC.B      0,$0D,$C0,0 ; Twinkle 4
          DC.B      0,$3D,$F0,0 ; Twinkle 5
          DC.B      $03,$DD,$DF,$00 ; Twinkle 6
          DC.B      $AB,$DD,$DF,$A8 ; Twinkle 7
          DC.B      0,0,0,0,0 ; Left Shield
          DC.B      0 ; Right Shield
          DC.B      $88,$08,$88,$80 ; Four Type
          DC.B      $88,$88,$88,$80 ; Eight Type
          DC.B      $88,$88,$88,$00 ; Tho Type
          DC.B      $88,$88,$88,$00 ; Six Type
          DC.B      $F0,$FC ; Special
          DC.B      $21,$20 ; Blue Bug 0
          DC.B      $21,$20 ; Blue Bug F
          DC.B      $3E,$F0 ; Red Bug 0
          DC.B      $3A,$B0 ; Red Bug F
          DC.B      $1F,$D0 ; Galaga 0
          DC.B      $1F,$D0 ; Galaga F
          DC.B      $07,$40 ; Hero 0
          DC.B      $F7,$F0 ; Hero 1
          DC.B      $AF,$C0 ; Hero 2
          DC.B      $3D,$F0 ; Hero 3
          DC.B      $F7,$DC ; Hero 4
          DC.B      $3D,$F0 ; Hero 5
          DC.B      $0F,$E8 ; Hero 6
          DC.B      $3F,$7C ; Hero 7
          DC.B      $02,$00,$08,$00         ; $A,$80,$2A,0 ; Missile
          DC.B      2,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      $A7,$5C ; Blue Bug 1
          DC.B      $07,$D8 ; Blue Bug 2
          DC.B      $21,$A0 ; Blue Bug 3
          DC.B      $A5,$68 ; Blue Bug 4
          DC.B      $29,$20 ; Blue Bug 5
          DC.B      $9F,$40 ; Blue Bug 6
          DC.B      $D7,$68 ; Blue Bug 7
          DC.B      $F5,$B4 ; Red Bug 1
          DC.B      $05,$F4 ; Red Bug 2
          DC.B      $04,$F0 ; Red Bug 3
          DC.B      $F1,$3C ; Red Bug 4
          DC.B      $3C,$40 ; Red Bug 5
          DC.B      $6D,$40 ; Red Bug 6
          DC.B      $79,$7C ; Red Bug 7
          DC.B      $55,$F4 ; Galaga 1
          DC.B      $65,$D0 ; Galaga 2
          DC.B      $40,$74 ; Galaga 3
          DC.B      $50,$50 ; Galaga 4
          DC.B      $74,$04 ; Galaga 5
          DC.B      $75,$90 ; Galaga 6
          DC.B      $7D,$54 ; Galaga 7
          DC.B      $15,$50 ; 0
          DC.B      $05,$40 ; 1
          DC.B      $55,$50 ; 2
          DC.B      $55,$50 ; 3
          DC.B      $1,$40 ; 4
          DC.B      $55,$50 ; 5
          DC.B      $55,$50 ; 6
          DC.B      $55,$50 ; 7
          DC.B      $55,$50 ; 8
          DC.B      $55,$50 ; 9
; 3RD LINE ;  
          ORG     $A900 ;  
          DC.B      0,$C,0 ; Explosion 7
          DC.B      $A2,$80 ; Percent
          DC.B      $D2,$87 ; Scorpion 0
          DC.B      $15,$10 ; Scorpion 1
          DC.B      $20,$54 ; Scorpion 2
          DC.B      $88,$54 ; Scorpion 3
          DC.B      $02,$00 ; Scorpion 4
          DC.B      $15,$22 ; Scorpion 5
          DC.B      $01,$02 ; Scorpion 6
          DC.B      $04,$54 ; Scorpion 7
          DC.B      $5E,$D4 ; Scorpion F
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,0,0 ; Explosion 5
          DC.B      0,0,$C0 ; Explosion 4
          DC.B      1,2,$30 ; Explosion 3
          DC.B      0,3,0 ; Explosion 2
          DC.B      0,0,$C0 ; Explosion 1
          DC.B      $0C,0,0 ; Explosion 0
          DC.B      $0E,$C0 ; New Bird 0
          DC.B      $0A,$3C ; New Bird 1
          DC.B      $15,$A0 ; New Bird 2
          DC.B      $A1,$40 ; New Bird 3
          DC.B      $43,$04 ; New Bird 4
          DC.B      $05,$28 ; New Bird 5
          DC.B      $29,$50 ; New Bird 6
          DC.B      $F2,$80 ; New Bird 7
          DC.B      $AA,$8A,$28,$A2,$82,$82,$8A,$28,$0 ; Novice
          DC.B      $A8,$00 ; S one
          DC.B      $A2,$80 ; S two
          DC.B      $A0,$0A,$00,$A2,$8A,$00,$A0,$00 ; Level
          DC.B      $A2,$8A,$28,$A2,$8A,$28,$AA,$8A,$28,$A0,$0A,$28 ; Advanced
          DC.B      $A0,$0A,$A8,$A2,$8A,$00,$A2,$82,$80 ; Expert
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,0,0,0 ; Twinkle 2
          DC.B      0,3,0,0 ; Twinkle 3
          DC.B      0,3,0,0 ; Twinkle 4
          DC.B      0,$0F,$C0,0 ; Twinkle 5
          DC.B      0,$F5,$7C,0 ; Twinkle 6
          DC.B      $AF,$EF,$EF,$E8 ; Twinkle 7
          DC.B      $2A,$AA,$AA,$AA,$AA ; Left Shield
          DC.B      $A8 ; Right Shield
          DC.B      $8A,$8A,$8A,$80 ; Four Type
          DC.B      $8A,$8A,$8A,$80 ; Eight Type
          DC.B      $A8,$A8,$A8,$00 ; Tho Type
          DC.B      $88,$A8,$A8,$00 ; Six Type
          DC.B      0,0 ; Special
          DC.B      $05,$40 ; Blue Bug 0
          DC.B      $05,$40 ; Blue Bug F
          DC.B      $FA,$BC ; Red Bug 0
          DC.B      $3D,$F0 ; Red Bug F
          DC.B      $5C,$D4 ; Galaga 0
          DC.B      $5C,$D4 ; Galaga F
          DC.B      $03,$00 ; Hero 0
          DC.B      $3C,$FC ; Hero 1
          DC.B      $3C,0 ; Hero 2
          DC.B      $F7,$F0 ; Hero 3
          DC.B      $F7,$DC ; Hero 4
          DC.B      $3F,$7C ; Hero 5
          DC.B      0,$F0 ; Hero 6
          DC.B      $FC,$F0 ; Hero 7
          DC.B      3,0,$0C,0 ; Missile
          DC.B      2,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      $AE,$50 ; Blue Bug 1
          DC.B      $2A,$84 ; Blue Bug 2
          DC.B      $02,$A0 ; Blue Bug 3
          DC.B      $A3,$28 ; Blue Bug 4
          DC.B      $2A,$00 ; Blue Bug 5
          DC.B      $4A,$A0 ; Blue Bug 6
          DC.B      $16,$E8 ; Blue Bug 7
          DC.B      $FF,$B4 ; Red Bug 1
          DC.B      $FF,$F4 ; Red Bug 2
          DC.B      $03,$F0 ; Red Bug 3
          DC.B      $F1,$3C ; Red Bug 4
          DC.B      $3F,$00 ; Red Bug 5
          DC.B      $7B,$FC ; Red Bug 6
          DC.B      $7B,$FC ; Red Bug 7
          DC.B      $17,$F4 ; Galaga 1
          DC.B      $25,$10 ; Galaga 2
          DC.B      $01,$50 ; Galaga 3
          DC.B      $A0,$A0 ; Galaga 4
          DC.B      $16,$00 ; Galaga 5
          DC.B      $45,$80 ; Galaga 6
          DC.B      $7F,$50 ; Galaga 7
          DC.B      $5,$40 ; 0
          DC.B      $5,$40 ; 1
          DC.B      $15,$40 ; 2
          DC.B      $55,$40 ; 3
          DC.B      $0,$40 ; 4
          DC.B      $55,$50 ; 5
          DC.B      $15,$40 ; 6
          DC.B      $15,$50 ; 7
          DC.B      $15,$40 ; 8
          DC.B      $15,$40 ; 9
; 2 ND LINE ;  
          ORG     $AA00 ;  
          DC.B      0,0,0 ; Explosion 7
          DC.B      $A0,$80 ; Percent
          DC.B      $D3,$C7 ; Scorpion 0
          DC.B      $05,$40 ; Scorpion 1
          DC.B      $00,$15 ; Scorpion 2
          DC.B      $88,$10 ; Scorpion 3
          DC.B      $82,$00 ; Scorpion 4
          DC.B      $04,$22 ; Scorpion 5
          DC.B      $15,$08 ; Scorpion 6
          DC.B      $01,$50 ; Scorpion 7
          DC.B      $52,$14 ; Scorpion F
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,0,0 ; Explosion 5
          DC.B      0,0,0 ; Explosion 4
          DC.B      0,$0C,0 ; Explosion 3
          DC.B      $0C,$80,$0C ; Explosion 2
          DC.B      0,0,0 ; Explosion 1
          DC.B      0,0,$30 ; Explosion 0
          DC.B      $0F,$C0 ; New Bird 0
          DC.B      $02,$30 ; New Bird 1
          DC.B      $15,$A0 ; New Bird 2
          DC.B      $81,$00 ; New Bird 3
          DC.B      $03,$00 ; New Bird 4
          DC.B      $01,$08 ; New Bird 5
          DC.B      $29,$50 ; New Bird 6
          DC.B      $32,$00 ; New Bird 7
          DC.B      $A2,$8A,$A8,$A2,$82,$82,$AA,$2A,$A0 ; Novice
          DC.B      $A8,$00 ; S one
          DC.B      $AA,$80 ; S two
          DC.B      $A0,$0A,$A8,$A2,$8A,$A8,$A0,$00 ; Level
          DC.B      $AA,$8A,$A8,$A2,$8A,$A8,$A2,$8A,$A8,$AA,$8A,$A8 ; Advanced
          DC.B      $AA,$8A,$28,$AA,$8A,$A8,$AA,$8A,$A0 ; Expert
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,0,0,0 ; Twinkle 2
          DC.B      0,0,0,0 ; Twinkle 3
          DC.B      0,3,0,0 ; Twinkle 4
          DC.B      0,3,0,0 ; Twinkle 5
          DC.B      0,$3D,$F0,0 ; Twinkle 6
          DC.B      $2E,$AF,$CA,$F0 ; Twinkle 7
          DC.B      0,0,0,0,0 ; Left Shield
          DC.B      0 ; Right Shield
          DC.B      0,0,0,0 ; Four Type
          DC.B      0,0,0,0 ; Eight Type
          DC.B      0,0,0,0 ; Tho Type
          DC.B      0,0,0,0 ; Six Type
          DC.B      0,0 ; Special
          DC.B      $0D,$C0 ; Blue Bug 0
          DC.B      $0D,$C0 ; Blue Bug F
          DC.B      $FD,$FC ; Red Bug 0
          DC.B      $34,$70 ; Red Bug F
          DC.B      $04,$40 ; Galaga 0
          DC.B      $08,$80 ; Galaga F
          DC.B      $03,$00 ; Hero 0
          DC.B      3,0 ; Hero 1
          DC.B      $0F,$00 ; Hero 2
          DC.B      $DF,0 ; Hero 3
          DC.B      $33,$C0 ; Hero 4
          DC.B      $EB,$AC ; Hero 5
          DC.B      $0F,$30 ; Hero 6
          DC.B      $01,$5C ; Hero 7
          DC.B      0,0,0,0 ; Missile
          DC.B      2,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      $2A,$B0 ; Blue Bug 1
          DC.B      $AA,$80 ; Blue Bug 2
          DC.B      $0A,$80 ; Blue Bug 3
          DC.B      $A3,$28 ; Blue Bug 4
          DC.B      $0A,$80 ; Blue Bug 5
          DC.B      $0A,$A8 ; Blue Bug 6
          DC.B      $3A,$A0 ; Blue Bug 7
          DC.B      $3E,$C0 ; Red Bug 1
          DC.B      $3F,$FC ; Red Bug 2
          DC.B      $0F,$F0 ; Red Bug 3
          DC.B      $F0,$3C ; Red Bug 4
          DC.B      $3F,$C0 ; Red Bug 5
          DC.B      $F3,$F0 ; Red Bug 6
          DC.B      $0E,$F0 ; Red Bug 7
          DC.B      $0D,$D0 ; Galaga 1
          DC.B      0,0 ; Galaga 2
          DC.B      $01,$50 ; Galaga 3
          DC.B      $60,$90 ; Galaga 4
          DC.B      $15,$00 ; Galaga 5
          DC.B      0,0 ; Galaga 6
          DC.B      $1D,$C0 ; Galaga 7
          DC.B      0,0 ; 0
          DC.B      0,0 ; 1
          DC.B      0,0 ; 2
          DC.B      0,0 ; 3
          DC.B      0,0 ; 4
          DC.B      0,0 ; 5
          DC.B      0,0 ; 6
          DC.B      0,0 ; 7
          DC.B      0,0 ; 8
          DC.B      0,0 ; 9
; 1 ST LINE ;  
          ORG     $AB00 ;  
          DC.B      0,0,0 ; Explosion 7
          DC.B      $A0,0 ; Percent
          DC.B      $E4,$1B ; Scorpion 0
          DC.B      $02,$40 ; Scorpion 1
          DC.B      0,0 ; Scorpion 2
          DC.B      $20,0 ; Scorpion 3
          DC.B      $28,0 ; Scorpion 4
          DC.B      0,$0A ; Scorpion 5
          DC.B      $54,0 ; Scorpion 6
          DC.B      $01,$80 ; Scorpion 7
          DC.B      $44,$44 ; Scorpion F
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,0,0 ; Explosion 5
          DC.B      0,0,0 ; Explosion 4
          DC.B      0,0,0 ; Explosion 3
          DC.B      0,$0C,$10 ; Explosion 2
          DC.B      0,$80,0 ; Explosion 1
          DC.B      0,0,0 ; Explosion 0
          DC.B      0,0 ; New Bird 0
          DC.B      0,0 ; New Bird 1
          DC.B      0,0 ; New Bird 2
          DC.B      0,0 ; New Bird 3
          DC.B      $03,0 ; New Bird 4
          DC.B      0,0 ; New Bird 5
          DC.B      0,0 ; New Bird 6
          DC.B      0,0 ; New Bird 7
          DC.B      $82,$82,$A0,$A2,$8A,$A0,$A8,$2A,$A0 ; Novice
          DC.B      $28,$00 ; S one
          DC.B      $2A,$00 ; S two
          DC.B      $A0,$0A,$A8,$A2,$8A,$A8,$A0,$00 ; Level
          DC.B      $2A,$0A,$A0,$A2,$82,$A0,$82,$82,$A0,$AA,$8A,$A0 ; Advanced
          DC.B      $AA,$8A,$28,$AA,$0A,$A8,$AA,$0A,$A0 ; Expert
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,0,0,0 ; Twinkle 2
          DC.B      0,0,0,0 ; Twinkle 3
          DC.B      0,0,0,0 ; Twinkle 4
          DC.B      0,3,0,0 ; Twinkle 5
          DC.B      0,$0F,$C0,0 ; Twinkle 6
          DC.B      $02,$AF,$EA,$88 ; Twinkle 7
          DC.B      $15,$55,$55,$55,$55 ; Left Shield
          DC.B      $50 ; Right Shield
          DC.B      0,0,0,0 ; Four Type
          DC.B      0,0,0,0 ; Eight Type
          DC.B      0,0,0,0 ; Tho Type
          DC.B      0,0,0,0 ; Six Type
          DC.B      0,0 ; Special
          DC.B      $04,$40 ; Blue Bug 0
          DC.B      $04,$40 ; Blue Bug F
          DC.B      $34,$70 ; Red Bug 0
          DC.B      $04,$40 ; Red Bug F
          DC.B      0,0 ; Galaga 0
          DC.B      $04,$40 ; Galaga F
          DC.B      $01,$00 ; Hero 0
          DC.B      $0,0 ; Hero 1
          DC.B      $FF,0 ; Hero 2
          DC.B      $03,0 ; Hero 3
          DC.B      $CB,$8C ; Hero 4
          DC.B      $03,0 ; Hero 5
          DC.B      $03,$FC ; Hero 6
          DC.B      0,0 ; Hero 7
          DC.B      0,0,0,0 ; Missile
          DC.B      0,0 ; Missile 4
          DC.B      3,0 ; Star Graph
          DC.B      $0A,$10 ; Blue Bug 1
          DC.B      $A8,$00 ; Blue Bug 2
          DC.B      $0A,$00 ; Blue Bug 3
          DC.B      $80,$08 ; Blue Bug 4
          DC.B      $02,$80 ; Blue Bug 5
          DC.B      $00,$A8 ; Blue Bug 6
          DC.B      $12,$80 ; Blue Bug 7
          DC.B      $0F,$50 ; Red Bug 1
          DC.B      $0F,$30 ; Red Bug 2
          DC.B      $0F,$C0 ; Red Bug 3
          DC.B      $30,$30 ; Red Bug 4
          DC.B      $0F,$C0 ; Red Bug 5
          DC.B      $33,$C0 ; Red Bug 6
          DC.B      $17,$C0 ; Red Bug 7
          DC.B      $09,$10 ; Galaga 1
          DC.B      $00,$00 ; Galaga 2
          DC.B      $06,$40 ; Galaga 3
          DC.B      $10,$40 ; Galaga 4
          DC.B      $06,$40 ; Galaga 5
          DC.B      $00,$00 ; Galaga 6
          DC.B      $11,$80 ; Galaga 7
          DC.B      0,0 ; 0
          DC.B      0,0 ; 1
          DC.B      0,0 ; 2
          DC.B      0,0 ; 3
          DC.B      0,0 ; 4
          DC.B      0,0 ; 5
          DC.B      0,0 ; 6
          DC.B      0,0 ; 7
          DC.B      0,0 ; 8
          DC.B      0,0 ; 9
; 0 TH LINE ;  
          ORG     $AC00 ;  
EXPLO7    DC.B      0,0,0 ; Explosion 7
PERCENT   DC.B      0,0 ; Percent
SCORP0    DC.B      0,0 ; Scorpion 0
SCORP1    DC.B      0,0 ; Scorpion 1
SCORP2    DC.B      0,0 ; Scorpion 2
SCORP3    DC.B      0,0 ; Scorpion 3
SCORP4    DC.B      0,0 ; Scorpion 4
SCORP5    DC.B      0,0 ; Scorpion 5
SCORP6    DC.B      0,0 ; Scorpion 6
SCORP7    DC.B      0,0 ; Scorpion 7
SCORPF    DC.B      0,0 ; Scorpion F
EXPLO6    DC.B      0,0,0 ; Explosion 6
EXPLO5    DC.B      0,0,0 ; Explosion 5
EXPLO4    DC.B      0,0,0 ; Explosion 4
EXPLO3    DC.B      0,0,0 ; Explosion 3
EXPLO2    DC.B      0,0,0 ; Explosion 2
EXPLO1    DC.B      0,0,0 ; Explosion 1
EXPLO0    DC.B      0,0,0 ; Explosion 0
NEWBIRD0  DC.B      0,0 ; New Bird 0
NEWBIRD1  DC.B      0,0 ; New Bird 1
NEWBIRD2  DC.B      0,0 ; New Bird 2
NEWBIRD3  DC.B      0,0 ; New Bird 3
NEWBIRD4  DC.B      0,0 ; New Bird 4
NEWBIRD5  DC.B      0,0 ; New Bird 5
NEWBIRD6  DC.B      0,0 ; New Bird 6
NEWBIRD7  DC.B      0,0 ; New Bird 7
NOVICE    DC.B      0,0,0,0,0,0,0,0,0 ; Novice
SONE      DC.B      0,0 ; S one
STWO      DC.B      0,0 ; S two
LEVEL     DC.B      0,0,0,0,0,0,0,0 ; Level
ADVANCED  DC.B      0,0,0,0,0,0,0,0,0,0,0,0 ; Advanced
EXPERT    DC.B      0,0,0,0,0,0,0,0,0 ; Expert
TWINKLE   DC.B      0,0,0,0 ; Twinkle 0
TWINKL1   DC.B      0,0,0,0 ; Twinkle 1
TWINKL2   DC.B      0,0,0,0 ; Twinkle 2
TWINKL3   DC.B      0,0,0,0 ; Twinkle 3
TWINKL4   DC.B      0,0,0,0 ; Twinkle 4
TWINKL5   DC.B      0,0,0,0 ; Twinkle 5
TWINKL6   DC.B      0,0,0,0 ; Twinkle 6
TWINKL7   DC.B      0,0,0,0 ; Twinkle 7
LSHIELD   DC.B      0,0,0,0,0 ; Left Shield
RSHIELD   DC.B      0 ; Right Shield
FOUTYPE   DC.B      0,0,0,0 ; Four Type
EIGTYPE   DC.B      0,0,0,0 ; Eight Type
THOTYPE   DC.B      0,0,0,0 ; Tho Type
SIXTYPE   DC.B      0,0,0,0 ; Six Type
SPECIAL   DC.B      0,0 ; Special
BLUBUG    DC.B      0,0 ; Blue Bug 0
BLUBUGF   DC.B      0,0 ; Blue Bug F
REDBUG    DC.B      0,0 ; Red Bug 0
REDBUGF   DC.B      0,0 ; Red Bug F
BOSGAL    DC.B      0,0 ; Galaga 0
BOSGALF   DC.B      0,0 ; Galaga F
HEROS     DC.B      0,0 ; Hero 0
HERO1     DC.B      0,0 ; Hero 1
HERO2     DC.B      0,0 ; Hero 2
HERO3     DC.B      0,0 ; Hero 3
HERO4     DC.B      0,0 ; Hero 4
HERO5     DC.B      0,0 ; Hero 5
HERO6     DC.B      0,0 ; Hero 6
HERO7     DC.B      0,0 ; Hero 7
MISSLE    DC.B      0,0,0,0 ; Missile
MISSLE4   DC.B      0,0 ; Missile 4
STARGRAF  DC.B      0,0 ; Star Graph
BLUBUG1   DC.B      0,0 ; Blue Bug 1
BLUBUG2   DC.B      0,0 ; Blue Bug 2
BLUBUG3   DC.B      0,0 ; Blue Bug 3
BLUBUG4   DC.B      0,0 ; Blue Bug 4
BLUBUG5   DC.B      0,0 ; Blue Bug 5
BLUBUG6   DC.B      0,0 ; Blue Bug 6
BLUBUG7   DC.B      0,0 ; Blue Bug 7
REDBUG1   DC.B      0,0 ; Red Bug 1
REDBUG2   DC.B      0,0 ; Red Bug 2
REDBUG3   DC.B      0,0 ; Red Bug 3
REDBUG4   DC.B      0,0 ; Red Bug 4
REDBUG5   DC.B      0,0 ; Red Bug 5
REDBUG6   DC.B      0,0 ; Red Bug 6
REDBUG7   DC.B      0,0 ; Red Bug 7
BOSGAL1   DC.B      0,0 ; Galaga 1
BOSGAL2   DC.B      0,0 ; Galaga 2
BOSGAL3   DC.B      0,0 ; Galaga 3
BOSGAL4   DC.B      0,0 ; Galaga 4
BOSGAL5   DC.B      0,0 ; Galaga 5
BOSGAL6   DC.B      0,0 ; Galaga 6
BOSGAL7   DC.B      0,0 ; Galaga 7
          DC.B      0,0 ; 0
          DC.B      0,0 ; 1
          DC.B      0,0 ; 2
          DC.B      0,0 ; 3
          DC.B      0,0 ; 4
          DC.B      0,0 ; 5
          DC.B      0,0 ; 6
          DC.B      0,0 ; 7
          DC.B      0,0 ; 8
          DC.B      0,0 ; 9
; Magic -1 Line ;  
          ORG     $AD00 ;  
          DC.B      0,0,0 ; Explosion 7
          DC.B      0,0 ; Percent
          DC.B      0,0 ; Scorpion 0
          DC.B      0,0 ; Scorpion 1
          DC.B      0,0 ; Scorpion 2
          DC.B      0,0 ; Scorpion 3
          DC.B      0,0 ; Scorpion 4
          DC.B      0,0 ; Scorpion 5
          DC.B      0,0 ; Scorpion 6
          DC.B      0,0 ; Scorpion 7
          DC.B      0,0 ; Scorpion F
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,0,0 ; Explosion 5
          DC.B      0,0,0 ; Explosion 4
          DC.B      0,0,0 ; Explosion 3
          DC.B      0,0,0 ; Explosion 2
          DC.B      0,0,0 ; Explosion 1
          DC.B      0,0,0 ; Explosion 0
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
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,0,0,0 ; Twinkle 2
          DC.B      0,0,0,0 ; Twinkle 3
          DC.B      0,0,0,0 ; Twinkle 4
          DC.B      0,0,0,0 ; Twinkle 5
          DC.B      0,0,0,0 ; Twinkle 6
          DC.B      0,0,0,0 ; Twinkle 7
          DC.B      0,0,0,0,0 ; Left Shield
          DC.B      0 ; Right Shield
          DC.B      0,0,0,0 ; Four Type
          DC.B      0,0,0,0 ; Eight Type
          DC.B      0,0,0,0 ; Tho Type
          DC.B      0,0,0,0 ; Six Type
          DC.B      0,0 ; Special
          DC.B      0,0 ; Blue Bug 0
          DC.B      0,0 ; Blue Bug F
          DC.B      0,0 ; Red Bug 0
          DC.B      0,0 ; Red Bug F
          DC.B      0,0 ; Galaga 0
          DC.B      0,0 ; Galaga F
          DC.B      0,0 ; Hero 0
          DC.B      0,0 ; Hero 1
          DC.B      0,0 ; Hero 2
          DC.B      0,0 ; Hero 3
          DC.B      0,0 ; Hero 4
          DC.B      0,0 ; Hero 5
          DC.B      0,0 ; Hero 6
          DC.B      0,0 ; Hero 7
          DC.B      0,0,0,0 ; Missile
          DC.B      0,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      0,0 ; Blue Bug 1
          DC.B      0,0 ; Blue Bug 2
          DC.B      0,0 ; Blue Bug 3
          DC.B      0,0 ; Blue Bug 4
          DC.B      0,0 ; Blue Bug 5
          DC.B      0,0 ; Blue Bug 6
          DC.B      0,0 ; Blue Bug 7
          DC.B      0,0 ; Red Bug 1
          DC.B      0,0 ; Red Bug 2
          DC.B      0,0 ; Red Bug 3
          DC.B      0,0 ; Red Bug 4
          DC.B      0,0 ; Red Bug 5
          DC.B      0,0 ; Red Bug 6
          DC.B      0,0 ; Red Bug 7
          DC.B      0,0 ; Galaga 1
          DC.B      0,0 ; Galaga 2
          DC.B      0,0 ; Galaga 3
          DC.B      0,0 ; Galaga 4
          DC.B      0,0 ; Galaga 5
          DC.B      0,0 ; Galaga 6
          DC.B      0,0 ; Galaga 7
          DC.B      0,0 ; 0
          DC.B      0,0 ; 1
          DC.B      0,0 ; 2
          DC.B      0,0 ; 3
          DC.B      0,0 ; 4
          DC.B      0,0 ; 5
          DC.B      0,0 ; 6
          DC.B      0,0 ; 7
          DC.B      0,0 ; 8
          DC.B      0,0 ; 9
; Magic -2 Line ;  
          ORG     $AE00 ;  
          DC.B      0,0,0 ; Explosion 7
          DC.B      0,0 ; Percent
          DC.B      0,0 ; Scorpion 0
          DC.B      0,0 ; Scorpion 1
          DC.B      0,0 ; Scorpion 2
          DC.B      0,0 ; Scorpion 3
          DC.B      0,0 ; Scorpion 4
          DC.B      0,0 ; Scorpion 5
          DC.B      0,0 ; Scorpion 6
          DC.B      0,0 ; Scorpion 7
          DC.B      0,0 ; Scorpion F
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,0,0 ; Explosion 5
          DC.B      0,0,0 ; Explosion 4
          DC.B      0,0,0 ; Explosion 3
          DC.B      0,0,0 ; Explosion 2
          DC.B      0,0,0 ; Explosion 1
          DC.B      0,0,0 ; Explosion 0
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
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,0,0,0 ; Twinkle 2
          DC.B      0,0,0,0 ; Twinkle 3
          DC.B      0,0,0,0 ; Twinkle 4
          DC.B      0,0,0,0 ; Twinkle 5
          DC.B      0,0,0,0 ; Twinkle 6
          DC.B      0,0,0,0 ; Twinkle 7
          DC.B      0,0,0,0,0 ; Left Shield
          DC.B      0 ; Right Shield
          DC.B      0,0,0,0 ; Four Type
          DC.B      0,0,0,0 ; Eight Type
          DC.B      0,0,0,0 ; Tho Type
          DC.B      0,0,0,0 ; Six Type
          DC.B      0,0 ; Special
          DC.B      0,0 ; Blue Bug 0
          DC.B      0,0 ; Blue Bug F
          DC.B      0,0 ; Red Bug 0
          DC.B      0,0 ; Red Bug F
          DC.B      0,0 ; Galaga 0
          DC.B      0,0 ; Galaga F
          DC.B      0,0 ; Hero 0
          DC.B      0,0 ; Hero 1
          DC.B      0,0 ; Hero 2
          DC.B      0,0 ; Hero 3
          DC.B      0,0 ; Hero 4
          DC.B      0,0 ; Hero 5
          DC.B      0,0 ; Hero 6
          DC.B      0,0 ; Hero 7
          DC.B      0,0,0,0 ; Missile
          DC.B      0,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      0,0 ; Blue Bug 1
          DC.B      0,0 ; Blue Bug 2
          DC.B      0,0 ; Blue Bug 3
          DC.B      0,0 ; Blue Bug 4
          DC.B      0,0 ; Blue Bug 5
          DC.B      0,0 ; Blue Bug 6
          DC.B      0,0 ; Blue Bug 7
          DC.B      0,0 ; Red Bug 1
          DC.B      0,0 ; Red Bug 2
          DC.B      0,0 ; Red Bug 3
          DC.B      0,0 ; Red Bug 4
          DC.B      0,0 ; Red Bug 5
          DC.B      0,0 ; Red Bug 6
          DC.B      0,0 ; Red Bug 7
          DC.B      0,0 ; Galaga 1
          DC.B      0,0 ; Galaga 2
          DC.B      0,0 ; Galaga 3
          DC.B      0,0 ; Galaga 4
          DC.B      0,0 ; Galaga 5
          DC.B      0,0 ; Galaga 6
          DC.B      0,0 ; Galaga 7
          DC.B      0,0 ; 0
          DC.B      0,0 ; 1
          DC.B      0,0 ; 2
          DC.B      0,0 ; 3
          DC.B      0,0 ; 4
          DC.B      0,0 ; 5
          DC.B      0,0 ; 6
          DC.B      0,0 ; 7
          DC.B      0,0 ; 8
          DC.B      0,0 ; 9
;Magic -3 line ;  
          ORG     $AF00 ;  
          DC.B      0,0,0 ; Explosion 7
          DC.B      0,0 ; Percent
          DC.B      0,0 ; Scorpion 0
          DC.B      0,0 ; Scorpion 1
          DC.B      0,0 ; Scorpion 2
          DC.B      0,0 ; Scorpion 3
          DC.B      0,0 ; Scorpion 4
          DC.B      0,0 ; Scorpion 5
          DC.B      0,0 ; Scorpion 6
          DC.B      0,0 ; Scorpion 7
          DC.B      0,0 ; Scorpion F
          DC.B      0,0,0 ; Explosion 6
          DC.B      0,0,0 ; Explosion 5
          DC.B      0,0,0 ; Explosion 4
          DC.B      0,0,0 ; Explosion 3
          DC.B      0,0,0 ; Explosion 2
          DC.B      0,0,0 ; Explosion 1
          DC.B      0,0,0 ; Explosion 0
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
          DC.B      0,0,0,0 ; Twinkle 0
          DC.B      0,0,0,0 ; Twinkle 1
          DC.B      0,0,0,0 ; Twinkle 2
          DC.B      0,0,0,0 ; Twinkle 3
          DC.B      0,0,0,0 ; Twinkle 4
          DC.B      0,0,0,0 ; Twinkle 5
          DC.B      0,0,0,0 ; Twinkle 6
          DC.B      0,0,0,0 ; Twinkle 7
          DC.B      0,0,0,0,0 ; Left Shield
          DC.B      0 ; Right Shield
          DC.B      0,0,0,0 ; Four Type
          DC.B      0,0,0,0 ; Eight Type
          DC.B      0,0,0,0 ; Tho Type
          DC.B      0,0,0,0 ; Six Type
          DC.B      0,0 ; Special
          DC.B      0,0 ; Blue Bug 0
          DC.B      0,0 ; Blue Bug F
          DC.B      0,0 ; Red Bug 0
          DC.B      0,0 ; Red Bug F
          DC.B      0,0 ; Galaga 0
          DC.B      0,0 ; Galaga F
          DC.B      0,0 ; Hero 0
          DC.B      0,0 ; Hero 1
          DC.B      0,0 ; Hero 2
          DC.B      0,0 ; Hero 3
          DC.B      0,0 ; Hero 4
          DC.B      0,0 ; Hero 5
          DC.B      0,0 ; Hero 6
          DC.B      0,0 ; Hero 7
          DC.B      0,0,0,0 ; Missile
          DC.B      0,0 ; Missile 4
          DC.B      0,0 ; Star Graph
          DC.B      0,0 ; Blue Bug 1
          DC.B      0,0 ; Blue Bug 2
          DC.B      0,0 ; Blue Bug 3
          DC.B      0,0 ; Blue Bug 4
          DC.B      0,0 ; Blue Bug 5
          DC.B      0,0 ; Blue Bug 6
          DC.B      0,0 ; Blue Bug 7
          DC.B      0,0 ; Red Bug 1
          DC.B      0,0 ; Red Bug 2
          DC.B      0,0 ; Red Bug 3
          DC.B      0,0 ; Red Bug 4
          DC.B      0,0 ; Red Bug 5
          DC.B      0,0 ; Red Bug 6
          DC.B      0,0 ; Red Bug 7
          DC.B      0,0 ; Galaga 1
          DC.B      0,0 ; Galaga 2
          DC.B      0,0 ; Galaga 3
          DC.B      0,0 ; Galaga 4
          DC.B      0,0 ; Galaga 5
          DC.B      0,0 ; Galaga 6
          DC.B      0,0 ; Galaga 7
          DC.B      0,0 ; 0
          DC.B      0,0 ; 1
          DC.B      0,0 ; 2
          DC.B      0,0 ; 3
          DC.B      0,0 ; 4
          DC.B      0,0 ; 5
          DC.B      0,0 ; 6
          DC.B      0,0 ; 7
          DC.B      0,0 ; 8
          DC.B      0,0 ; 9
