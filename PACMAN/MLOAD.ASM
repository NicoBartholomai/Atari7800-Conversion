    processor 6502

 	    SEG     ROM
HEADER  ORG     $0000
    ;Begin Header
    DC.B 3  ; header version 3
    ; Version 3 requires zero filling, dasm defaults to 1's so this must be manually added.
    DC.B "ATARI7800"    ; Atari 7800 magic text
    DS 7, 32            ; magic text must be 16 bytes
    DC.B "Pac-Man"
    DS 25, 32           ; name must be 32 bytes
    ; DS HEADER+49-., 0   ; name must be 32 bytes ; todo double check this
    ; DC.B $00, $00,256->ROMTOP,$00 ; rom size without header - 4 bytes
    ; DC.B $00, $00, $3F, $7E ; rom size without header - 4bytes
    DC.B $00, $00, >ROMTOP, $00 ; rom size without header - 4bytes
    
    DC.B $00, $00; cart type - 2 bytes
    ;    bit  0 - pokey at 4000
    ;    bit  1 - supergame bank switched
    ;    bit  2 - supergame ram at $4000
    ;    bit  3 - rom at $4000
    ;    bit  4 - bank 6 at $4000
    ;    bit  5 - supergame banked ram
    ;    bit  6 - pokey at $450
    ;    bit  7 - mirror ram at $4000
    ;    bit  8 - activision banking
    ;    bit  9 - absolute banking
    ;    bit 10 - pokey at $440
    ;    bit 11 - ym2151 at $461/462
    ;    bit 12 - souper
    ;    bit 13 - bankset
    ;    bit 14-15 - Special
    ;   0 = Normal cart
    
    DC.B $01, $01; controller types (1b per controller) - 2 bytes, 1 = normal
    ;    0=None, 1=joystick, 2=lightgun, 3=paddle, 4=trakball, 5=2600-stick
    ;    6=driving, 7=keypad, 8=st-mouse, 9=amiga-mouse
    
    DC.B $00; TV type; bit0 = 0:NTSC,1:PAL bit1 = 0:component,1:composite
    
    DC.B $00; Save data peripheral - 1 byte (version 2)
    ;    0 = None / unknown (default)
    ;    1 = High Score Cart (HSC)
    ;    2 = SaveKey

    DS 4, 0 ; reserved
    DC.B $00; Expansion Module; bit 0    = XM

    DS 36, 0 ; reserved
    DC.B "ACTUAL CART DATA STARTS HERE" ; magic end header text

    include "MARIAOS.ASM"
    include "MSDEF.ASM"
    include "MSCHAR.ASM"
    align 2
    include "MAIN.ASM"
    include "INIT.ASM"
    align 2
    include "MSMOVE.ASM"  
    include "FRUIT.ASM"
    align 2
    include "MONSTER.ASM"
    include "PATH.ASM"
    align 2
    include "SPEED.ASM"
    include "INTRSECT.ASM"
    align 2
    include "ANIMATE.ASM"
    align 2
    include "TITLE.ASM"
    include "HIGH.ASM"
    align 2
    include "UTIL.ASM"
    include "TUNES.ASM"
    align 2
    include "KERNAL.ASM"
    include "GETJOY.ASM"
    align 2
    include "PUTCHAR.ASM"
    include "LOADMAP.ASM"
    align 2
    include "END.ASM"
    align 2
    include "MACRO.ASM"
    align 2
