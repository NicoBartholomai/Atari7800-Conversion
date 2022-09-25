	processor 6502 

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

    

