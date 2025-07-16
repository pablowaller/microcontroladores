retardo_XXX_mseg
    movlw d'5'
    movwf CONTADOR_3       ; Bucle externo, 5 repeticiones

loop_2
    movlw d'100'
    movwf CONTADOR_2       ; Segundo nivel, 100 repeticiones

loop_1
    movlw d'250'
    movwf CONTADOR_1       ; Bucle interno, 250 repeticiones

loop_k
    NOP                    ; Este NOP da precisión (1 μs)
    decfsz CONTADOR_1, f
    GOTO loop_k            ; 250 * (2+1) μs = ~750 μs aprox

    decfsz CONTADOR_2, f
    GOTO loop_1            ; 100 * 750 μs = ~75 ms

    decfsz CONTADOR_3, f
    GOTO loop_2            ; 5 * 75 ms = **375 ms total aprox**

    NOP
    RETURN
