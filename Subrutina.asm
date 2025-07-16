            ORG 0x000
            GOTO main

; ========================
CONTADOR_1  EQU 0x20
CONTADOR_2  EQU 0x21
CONTADOR_3  EQU 0x22
; ========================

main
            call retardo_XXX_mseg
            goto main

; ========================
retardo_XXX_mseg
            movlw d'5'
            movwf CONTADOR_3      ; bucle externo (multiplica duración)

loop_2
            movlw d'100'
            movwf CONTADOR_2      ; bucle medio

loop_1
            movlw d'250'
            movwf CONTADOR_1      ; bucle interno

loop_k
            NOP
            decfsz CONTADOR_1, f
            goto loop_k

            decfsz CONTADOR_2, f
            goto loop_1

            decfsz CONTADOR_3, f
            goto loop_2

            return

            END
