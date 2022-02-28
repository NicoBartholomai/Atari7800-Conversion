	processor 6502 

;*  END.S          CONTAINS THE END STATEMENT

END       DC.B      "GCC(C)1984";           ;LABEL TO SEE WHERE END OF ROM IS

        ORG     $FFF8
          DC.B      $FF,$C7;                ;START AT $C000, + MARIA SIGNATURE
          DC.W      DLI;                    ;INTERRUPT VECTOR
          DC.W      MAIN;                   ;START VECTOR
ROMTOP    DC.W      NULLRTI;                ;UNUSED VECTOR

