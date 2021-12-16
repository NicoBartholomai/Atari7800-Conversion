	processor 6502 
;GDAC3.S
;
;THE FOLLOWING TABLE GIVES SINGLE OR DOUBLE BIRTH INFORMATION
LOWPAIR   DC.B      0,2,1,1,1,1         ;2,2,2,2,2
HIGHPAIR  DC.B      2,2,2,2,2,2,2,1,1,1,1,2,2        ;,2,2
CHALPAIR  DC.B      2,2,1,1,1,1
          DC.B      2,2,2,1,1
          DC.B      1,2,2,1,1
          DC.B      2,1,1,2,2
          DC.B      1,1,1,1,1
          DC.B      1,2,2,1,1
          DC.B      1,1,1,1,1
          DC.B      2,1,1,2;                ;LAST MEMBER IS @ LOCATION ZERO

;THE FOLLOWING TABLE INDEXED BY SHIPCNT GIVES THE SHIP NUMBER OF EACH SHIP
;AS IT IS BORN.  NON-FORMATION SHIPS HOLD A SPECIAL CODE
SHPNUTB   DC.B      38;                     ;1
          DC.B      36;                     ;
          DC.B      39;                     ;
          DC.B      37;                     ;
          DC.B      33;                     ;
          DC.B      31;                     ;
          DC.B      34;                     ;
          DC.B      32;                     ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;10
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      6;                      ;
          DC.B      29;                     ;
          DC.B      26;                     ;
          DC.B      30;                     ;
          DC.B      35;                     ;
          DC.B      24;                     ;
          DC.B      17;                     ;
          DC.B      25;                     ;20
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      12;                     ;
          DC.B      21;                     ;
          DC.B      16;                     ;
          DC.B      5;                      ;
          DC.B      11;                     ;
          DC.B      20;                     ;30
          DC.B      15;                     ;
          DC.B      4;                      ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      19;                     ;
          DC.B      28;                     ;
          DC.B      14;                     ;
          DC.B      23;                     ;40
          DC.B      27;                     ;
          DC.B      18;                     ;
          DC.B      22;                     ;
          DC.B      13;                     ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      2;                      ;
          DC.B      9;                      ;50
          DC.B      0;                      ;
          DC.B      7;                      ;
          DC.B      10;                     ;
          DC.B      3;                      ;
          DC.B      8;                      ;
          DC.B      1;                      ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;
          DC.B      <NOTFOSH;             ;60
          DC.B      1;                      ;

;THIS TABLE GIVES THE INDEX INTO THE CHALTBL, LOWREGTBL, OR HIREGTBL
;  ACCORDING TO THE SHIP"S SHIPCNT
SHIPINDX  DC.B      0,2,0,2,0,2,0,2,0,2,22,22
          DC.B      4,6,4,6,4,6,4,6,4,6,22,22
          DC.B      8,10,8,10,8,10,8,10,8,10,22,22
          DC.B      12,14,12,14,12,14,12,14,12,14,22,22
          DC.B      16,18,16,18,16,18,16,18,18,16,22,22
          DC.B      20

;THIS TABLE GIVES A CHALLENGING STAGE SEQUENCE
CHALTBL   DC.B      <RACK3,>RACK3
          DC.B      <RACK7,>RACK7
          DC.B      <RACK11,>RACK11
          DC.B      <RACK15,>RACK15
          DC.B      <RACK19,>RACK19
          DC.B      <RACK23,>RACK23
          DC.B      <RACK27,>RACK27
          DC.B      <RACK31,>RACK31

RACK3     DC.B      <SHTY9,>SHTY9
          DC.B      <SHTY8,>SHTY8
          DC.B      <SHTY11,>SHTY11
          DC.B      <SHTY12,>SHTY12
          DC.B      <SHTY13,>SHTY13
          DC.B      <SHTY13,>SHTY13
          DC.B      <SHTY8,>SHTY8
          DC.B      <SHTY8,>SHTY8
          DC.B      <SHTY10,>SHTY10
          DC.B      <SHTY10,>SHTY10
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0

RACK7     DC.B      <SHTY18,>SHTY18
          DC.B      <SHTY19,>SHTY19
          DC.B      <SHTY20,>SHTY20
          DC.B      <SHTY21,>SHTY21
          DC.B      <SHTY53,>SHTY53
          DC.B      <SHTY21,>SHTY21
          DC.B      <SHTY19,>SHTY19
          DC.B      <SHTY19,>SHTY19
          DC.B      <SHTY18,>SHTY18
          DC.B      <SHTY18,>SHTY18
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0

RACK11    DC.B      <SHTY22,>SHTY22
          DC.B      <SHTY23,>SHTY23
          DC.B      <SHTY24,>SHTY24
          DC.B      <SHTY25,>SHTY25
          DC.B      <SHTY54,>SHTY54
          DC.B      <SHTY25,>SHTY25
          DC.B      <SHTY22,>SHTY22
          DC.B      <SHTY23,>SHTY23
          DC.B      <SHTY26,>SHTY26
          DC.B      <SHTY27,>SHTY27
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0

RACK15    DC.B      <SHTY29,>SHTY29
          DC.B      <SHTY28,>SHTY28
          DC.B      <SHTY30,>SHTY30
          DC.B      <SHTY50,>SHTY50
          DC.B      <SHTY31,>SHTY31
          DC.B      <SHTY51,>SHTY51
          DC.B      <SHTY28,>SHTY28
          DC.B      <SHTY29,>SHTY29
          DC.B      <SHTY32,>SHTY32
          DC.B      <SHTY33,>SHTY33
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0

RACK19    DC.B      <SHTY34,>SHTY34
          DC.B      <SHTY34,>SHTY34
          DC.B      <SHTY35,>SHTY35
          DC.B      <SHTY55,>SHTY55
          DC.B      <SHTY36,>SHTY36
          DC.B      <SHTY36,>SHTY36
          DC.B      <SHTY34,>SHTY34
          DC.B      <SHTY34,>SHTY34
          DC.B      <SHTY37,>SHTY37
          DC.B      <SHTY37,>SHTY37
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0

RACK23    DC.B      <SHTY38,>SHTY38
          DC.B      <SHTY38,>SHTY38
          DC.B      <SHTY39,>SHTY39
          DC.B      <SHTY40,>SHTY40
          DC.B      <SHTY56,>SHTY56
          DC.B      <SHTY40,>SHTY40
          DC.B      <SHTY41,>SHTY41
          DC.B      <SHTY41,>SHTY41
          DC.B      <SHTY38,>SHTY38
          DC.B      <SHTY38,>SHTY38
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0

RACK27    DC.B      <SHTY42,>SHTY42
          DC.B      <SHTY42,>SHTY42
          DC.B      <SHTY43,>SHTY43
          DC.B      <SHTY57,>SHTY57
          DC.B      <SHTY44,>SHTY44
          DC.B      <SHTY44,>SHTY44
          DC.B      <SHTY45,>SHTY45
          DC.B      <SHTY45,>SHTY45
          DC.B      <SHTY42,>SHTY42
          DC.B      <SHTY42,>SHTY42
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0

RACK31    DC.B      <SHTY46,>SHTY46
          DC.B      <SHTY47,>SHTY47
          DC.B      <SHTY58,>SHTY58
          DC.B      <SHTY48,>SHTY48
          DC.B      <SHTY49,>SHTY49
          DC.B      <SHTY49,>SHTY49
          DC.B      <SHTY46,>SHTY46
          DC.B      <SHTY47,>SHTY47
          DC.B      <SHTY46,>SHTY46
          DC.B      <SHTY47,>SHTY47
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0

LOWREGTB  DC.B      <RACK1,>RACK1
          DC.B      <RACK2,>RACK2

HIREGTB   DC.B      <RACK4,>RACK4
          DC.B      <RACK5,>RACK5
          DC.B      <RACK6,>RACK6

RACK6
RACK1     DC.B      <SHTY3,>SHTY3
          DC.B      <SHTY2,>SHTY2
          DC.B      <SHTY5,>SHTY5
          DC.B      <SHTY6,>SHTY6
          DC.B      <SHTY7,>SHTY7
          DC.B      <SHTY7,>SHTY7
          DC.B      <SHTY2,>SHTY2
          DC.B      <SHTY2,>SHTY2
          DC.B      <SHTY4,>SHTY4
          DC.B      <SHTY4,>SHTY4
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0

RACK5
RACK2     DC.B      <SHTY3,>SHTY3
          DC.B      <SHTY2,>SHTY2
          DC.B      <SHTY14,>SHTY14
          DC.B      <SHTY6,>SHTY6
          DC.B      <SHTY15,>SHTY15
          DC.B      <SHTY7,>SHTY7
          DC.B      <SHTY2,>SHTY2
          DC.B      <SHTY16,>SHTY16
          DC.B      <SHTY17,>SHTY17
          DC.B      <SHTY4,>SHTY4
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0

RACK4     DC.B      <SHTY3,>SHTY3
          DC.B      <SHTY2,>SHTY2
          DC.B      <SHTY5,>SHTY5
          DC.B      <SHTY7,>SHTY7
          DC.B      <SHTY6,>SHTY6
          DC.B      <SHTY7,>SHTY7
          DC.B      <SHTY2,>SHTY2
          DC.B      <SHTY4,>SHTY4
          DC.B      <SHTY2,>SHTY2
          DC.B      <SHTY4,>SHTY4
          DC.B      <SHTY1,>SHTY1
          DC.B      <SHTY0,>SHTY0
;
;THE FOLLOWING ARE THE DEFINITIONS OF THE SHIP TYPES
;
SHTY0     DC.B      $00;                    ;SHIP TYPE  (DOESN"T EXIST)
;
SHTY1     DC.B      $06;                    ;SHIP TYPE  (INVISO)
          DC.B      72;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      $04;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION1;             ;MOTION TBL PTR LOW
          DC.B      >MOTION1;             ;MOTION TBL PTR HIGH
          DC.B      $C0;                    ;MODE BYTE  (INV)
;
SHTY2     DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      88;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      $04;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION1;             ;MOTION TBL PTR LOW
          DC.B      >MOTION1;             ;MOTION TBL PTR HIGH
          DC.B      $80;                    ;MODE BYTE  (NORMAL)
;
SHTY3     DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      72;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      $04;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION1;             ;MOTION TBL PTR LOW
          DC.B      >MOTION1;             ;MOTION TBL PTR HIGH
          DC.B      $C0;                    ;MODE BYTE  (INV)
;
SHTY4     DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      72;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      $04;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION1;             ;MOTION TBL PTR LOW
          DC.B      >MOTION1;             ;MOTION TBL PTR HIGH
          DC.B      $C0;                    ;MODE BYTE  (INV)
;
SHTY5     DC.B      $03;                    ;SHIP TYPE  (BIG)
          DC.B      $F8    ;;               ;BEGINNING X POS  (SIDE)
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      $01;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION2;             ;MOTION TBL PTR LOW
          DC.B      >MOTION2;             ;MOTION TBL PTR HIGH
          DC.B      $80;                    ;MODE BYTE  (NORMAL)
;
SHTY6     DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      $F8   ;;                ;BEGINNING X POS  (SIDE)
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      $01;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION2;             ;MOTION TBL PTR LOW
          DC.B      >MOTION2;             ;MOTION TBL PTR HIGH
          DC.B      $80;                    ;MODE BYTE  (NORMAL)
;
SHTY7     DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      159;                    ;BEGINNING X POS  (SIDE)
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      $07;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION2;             ;MOTION TBL PTR LOW
          DC.B      >MOTION2;             ;MOTION TBL PTR HIGH
          DC.B      $C0;                    ;MODE BYTE  (INV)
;
SHTY8     DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      88;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      $04;                    ;BEGINNING ORIENTATION
          DC.B      <CHRACK3A;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK3A;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)
;
SHTY9     DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      72;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      $04;                    ;BEGINNING ORIENTATION
          DC.B      <CHRACK3A;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK3A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)
;
SHTY10    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      72;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      $04;                    ;BEGINNING ORIENTATION
          DC.B      <CHRACK3A;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK3A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)
;
SHTY11    DC.B      $03;                    ;SHIP TYPE  (BIG)
          DC.B      $F8    ;;               ;BEGINNING X POS  (SIDE)
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      $02;                    ;BEGINNING ORIENTATION
          DC.B      <CHRACK3B;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK3B;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)
;
SHTY12    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      $F8  ;;                 ;BEGINNING X POS  (SIDE)
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      $02;                    ;BEGINNING ORIENTATION
          DC.B      <CHRACK3B;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK3B;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)
;
SHTY13    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      160;                    ;BEGINNING X POS  (SIDE)
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      $06;                    ;BEGINNING ORIENTATION
          DC.B      <CHRACK3B;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK3B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)
;
SHTY14    DC.B      $03;                    ;SHIP TYPE  (BIG)
          DC.B      $F8;                    ;BEGINNING X POS  (SIDE)
          DC.B      148;                    ;BEGINNING Y POS
          DC.B      $01;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION2;             ;MOTION TBL PTR LOW
          DC.B      >MOTION2;             ;MOTION TBL PTR HIGH
          DC.B      $80;                    ;MODE BYTE  (NORMAL)
;
SHTY15    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      159;                    ;BEGINNING X POS  (SIDE)
          DC.B      148;                    ;BEGINNING Y POS
          DC.B      $07;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION2;             ;MOTION TBL PTR LOW
          DC.B      >MOTION2;             ;MOTION TBL PTR HIGH
          DC.B      $C0;                    ;MODE BYTE  (INV)
;
SHTY16    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      78;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      $04;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION1;             ;MOTION TBL PTR LOW
          DC.B      >MOTION1;             ;MOTION TBL PTR HIGH
          DC.B      $80;                    ;MODE BYTE  (NORMAL)
;
SHTY17    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      82;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      $04;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION1;             ;MOTION TBL PTR LOW
          DC.B      >MOTION1;             ;MOTION TBL PTR HIGH
          DC.B      $C0;                    ;MODE BYTE  (INV)
;
SHTY18    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      72;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRACK7A;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK7A;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)
;
SHTY19    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      88;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRACK7A;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK7A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)
;
SHTY20    DC.B      3;                      ;SHIP TYPE  (BOS)
          DC.B      $F8;                    ;BEGINNING X POS  (TOP)
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      2;                      ;BEGINNING ORIENTATION
          DC.B      <CHRACK7B;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK7B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)
;
SHTY21    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      159;                    ;BEGINNING X POS  (TOP)
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      6;                      ;BEGINNING ORIENTATION
          DC.B      <CHRACK7B;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK7B;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY22    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      70;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRACK7A;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK7A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY23    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      70;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRACK7A;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK7A;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY24    DC.B      $03;                    ;SHIP TYPE  (BOSS)
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      2;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK11B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK11B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY25    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      162;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      6;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK11B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK11B;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY26    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      90;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRACK7A;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK7A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY27    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      90;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRACK7A;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK7A;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY28    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      70;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK15A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK15A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY29    DC.B      13;                    ;SHIP TYPE  (SCORPION)
          DC.B      70;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK15A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK15A;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY30    DC.B      $03;                    ;SHIP TYPE  (BOSS)
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      1;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK15B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK15B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY31    DC.B      50;                     ;SHIP TYPE  (NEWBIRD)
          DC.B      160;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      7;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK15B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK15B;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY32    DC.B      13;                     ;SHIP TYPE  (RED)
          DC.B      92;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK15A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK15A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY33    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      92;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK15A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK15A;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY34    DC.B      50;                     ;SHIP TYPE  (NEWBIRD)
          DC.B      90;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      5;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK19A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK19A;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY35    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      140;                    ;BEGINNING Y POS
          DC.B      2;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK19B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK19B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY36    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      160;                    ;BEGINNING X POS
          DC.B      140;                    ;BEGINNING Y POS
          DC.B      6;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK19B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK19B;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY37    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      70;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      3;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK19A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK19A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY38    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      76;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK23A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK23A;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY39    DC.B      $03;                    ;SHIP TYPE  (BOSS)
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      2;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK23B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK23B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY40    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      160;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      6;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK23B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK23B;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY41    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      84;                     ;BEGINNING X POS
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK23A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK23A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY42    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      76;                     ;BEGINNING X POS
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK27A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK27A;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY43    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      2;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK27B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK27B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY44    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      160;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      6;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK27B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK27B;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY45    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      84;                     ;BEGINNING X POS
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK27A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK27A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY46    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      88;                     ;BEGINNING X POS
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK31A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK31A;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY47    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      68;                     ;BEGINNING X POS
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      4;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK31A;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK31A;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY48    DC.B      $01;                    ;SHIP TYPE  (BLUE)
          DC.B      $FA;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      1;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK31B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK31B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY49    DC.B      $02;                    ;SHIP TYPE  (RED)
          DC.B      160;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      7;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK31B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK31B;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY50    DC.B      2;                      ;SHIP TYPE  (RED)
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      1;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK15B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK15B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY51    DC.B      2;                      ;SHIP TYPE  (RED)
          DC.B      160;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      7;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK15B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK15B;            ;MOTION TBL PTR HIGH
          DC.B      $C9;                    ;MODE BYTE  (INV)

SHTY52    DC.B      5;                      ;SHIP TYPE  (HERO)
          DC.B      72;                     ;BEGINNING X POS  (TOP)
          DC.B      $FA;                    ;BEGINNING Y POS
          DC.B      $04;                    ;BEGINNING ORIENTATION
          DC.B      <MOTION1;             ;MOTION TBL PTR LOW
          DC.B      >MOTION1;             ;MOTION TBL PTR HIGH
          DC.B      $C0;                    ;MODE BYTE  (INV)
;
SHTY53    DC.B      1;                      ;SHIP TYPE
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      2;                      ;BEGINNING ORIENTATION
          DC.B      <CHRACK7B;            ;MOTION TBL PTR LOW
          DC.B      >CHRACK7B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY54    DC.B      1;                      ;SHIP TYPE
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      2;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK11B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK11B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY55    DC.B      $03;                    ;SHIP TYPE
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      140;                    ;BEGINNING Y POS
          DC.B      2;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK19B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK19B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY56    DC.B      2;                      ;SHIP TYPE  (RED)
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      2;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK23B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK23B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY57    DC.B      3;                      ;SHIP TYPE
          DC.B      $F8;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      2;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK27B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK27B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)

SHTY58    DC.B      $03;                    ;SHIP TYPE
          DC.B      $FA;                    ;BEGINNING X POS
          DC.B      160;                    ;BEGINNING Y POS
          DC.B      1;                      ;BEGINNING ORIENTATION
          DC.B      <CHRCK31B;            ;MOTION TBL PTR LOW
          DC.B      >CHRCK31B;            ;MOTION TBL PTR HIGH
          DC.B      $89;                    ;MODE BYTE  (NORMAL)
