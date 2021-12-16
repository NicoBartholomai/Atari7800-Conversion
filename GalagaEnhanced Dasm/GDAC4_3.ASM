
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

TWINKX    DC.B      $28,$3E,$47,$50,$30,$57,$5B,$72

;THESE TABLES ARE THE MOTION TABLES FOR BOSS ATTACK
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

