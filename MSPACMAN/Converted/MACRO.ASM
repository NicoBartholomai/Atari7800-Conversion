	processor 6502 
; FILL      MACRO   ADDR,DATA,COUNT        ;THIS FILLS AN AREA WITH A CONSTANT
;           LDA     &DATA
;           LDX     &COUNT
; F&INDX    STA     &ADDR-1,X
;           DEX
;           BNE     F&INDX
;           ENDM
; LOAD      MACRO   ADDR1,ADDR2,COUNT      ;THIS MOVES DATA FROM ONE AREA TO ANOTH
;           LDX     &COUNT
; L&INDX    LDA     &ADDR2-1,X
;           STA     &ADDR1-1,X
;           DEX
;           BNE     L&INDX
;           ENDM
; PFILL     MACRO   ADDR,DATA,PAGENUM      ;THIS FILLS A NUMBER OF PAGES
;           LDA     #>&ADDR;              ;TEMP0 AND TEMP1 ARE USED
;           STA     TEMP1
;           LDA     #<&ADDR
;           STA     TEMP0
;           LDA     &DATA
;           LDX     &PAGENUM
;           JSR     PFILLIT
;           ENDM
; PLOAD     MACRO   ADDR,ADDR2,PAGENUM     ;THIS LOADS A NUMBER OF PAGES
;           LDA     #>&ADDR;              ;TEMP0 - TEMP3 ARE USED
;           STA     TEMP1
;           LDA     #<&ADDR
;           STA     TEMP0
;           LDA     #>&ADDR2
;           STA     TEMP3
;           LDA     #<&ADDR2
;           STA     TEMP2
;           LDX     &PAGENUM
;           JSR     PLOADIT
;           ENDM


    MAC FILL; ADDR, DATA, COUNT
        LDA     {2}
        LDX     {3}
MCFIDX  STA     {1}-1,X
        DEX
        BNE     MCFIDX
    ENDM

    MAC LOAD ;  ADDR1,ADDR2,COUNT      ;THIS MOVES DATA FROM ONE AREA TO ANOTH
        LDX     {3}
MCLDX   LDA     {2}-1,X
        STA     {1}-1,X
        DEX
        BNE     MCLDX
    ENDM
    

    MAC PFILL ; ADDR,DATA,PAGENUM      ;THIS FILLS A NUMBER OF PAGES
        LDA     #>{1};              ;TEMP0 AND TEMP1 ARE USED
        STA     TEMP1
        LDA     #<{1}
        STA     TEMP0
        LDA     {2}
        LDX     {3}
        JSR     PFILLIT
    ENDM

    MAC PLOAD ;  ADDR,ADDR2,PAGENUM     ;THIS LOADS A NUMBER OF PAGES
        LDA     #>{1};              ;TEMP0 - TEMP3 ARE USED
        STA     TEMP1
        LDA     #<{1}
        STA     TEMP0
        LDA     #>{2}
        STA     TEMP3
        LDA     #<{2}
        STA     TEMP2
        LDX     {3}
        JSR     PLOADIT
    ENDM

    

