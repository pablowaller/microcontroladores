retardo_XXX_mseg
    ; Supongamos que XXX contiene el valor en milisegundos
    ; Supongamos que el ciclo de reloj toma 1 microsegundo

    movlw d'1000'      ; Cargar 1000 en W (representa 1 segundo)
    movwf DELAY_SEC     ; Almacenar 1 segundo en DELAY_SEC

    movf XXX, W         ; Cargar el valor de XXX en W
    movwf CONTADOR_X    ; Almacenar el valor de XXX en CONTADOR_X

loop_1
    movf DELAY_SEC, W   ; Cargar el valor de DELAY_SEC en W
    movwf CONTADOR_SEC  ; Almacenar el valor de DELAY_SEC en CONTADOR_SEC

loop_2
    movlw d'1000'      ; Cargar 1000 en W (representa 1 segundo)
    movwf DELAY_MSEC    ; Almacenar 1 milisegundo en DELAY_MSEC

loop_3
    decfsz CONTADOR_MSEC, F  ; Decrementar el contador de milisegundos
    goto loop_3              ; Si no ha terminado, repetir loop_3

    decfsz CONTADOR_SEC, F   ; Decrementar el contador de segundos
    goto loop_2              ; Si no ha terminado, repetir loop_2

    decfsz CONTADOR_X, F     ; Decrementar el contador de XXX milisegundos
    goto loop_1              ; Si no ha terminado, repetir loop_1

    return                  ; Retornar al programa principal

DELAY_SEC   equ 0   ; Definir una ubicación de memoria para DELAY_SEC
DELAY_MSEC  equ 1   ; Definir una ubicación de memoria para DELAY_MSEC
CONTADOR_X  equ 2   ; Definir una ubicación de memoria para CONTADOR_X
CONTADOR_SEC equ 3  ; Definir una ubicación de memoria para CONTADOR_SEC
CONTADOR_MSEC equ 4 ; Definir una ubicación de memoria para CONTADOR_MSEC
