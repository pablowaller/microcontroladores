cont    equ 0x20
cont2   equ 0x21
vA      equ 0x22
vB      equ 0x23
vC      equ 0x24

            ORG 0x000
            GOTO main

main
            clrf cont
            clrf cont2

loop

            call ret_1aseg  
            NOP
            NOP
            GOTO main

ret_1aseg
            movlw .100
            movwf vA
loop1
            call ret_100mseg
            decfsz vA, f
            goto loop1
            return

ret_100mseg
            movlw .100
            movwf vB
loop2
            call ret_1mseg
            decfsz vB, f
            goto loop2
            return

ret_1mseg
            movlw .245
            movwf vC
loop3
            nop
            decfsz vC, f
            goto loop3
            return

            END
