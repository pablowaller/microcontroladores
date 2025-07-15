PORTB   equ 0x06
TRISB   equ 0x86
STATUS  equ 0x03

Va      equ 0x20
Vb      equ 0x21
Vc      equ 0x22

main

    bsf STATUS, RP0
    
    bcf TRISB, 0
    bcf TRISB, 1
    bcf TRISB, 2

    bcf STATUS, RP0
    
    bsf PORTB, 0
    NOP
    bcf PORTB, 0
    NOP
    bsf PORTB, 1
    NOP
    bcf PORTB, 1
    NOP
    
ret_semaforo
    call ret_100mseg
    NOP
    NOP
    goto ret_semaforo

ret_100mseg
    movlw .100
    movwf Va

loop
    call ret_1mseg
    DECFSZ Va, f  
    goto loop
    NOP

ret_1mseg
    movlw .100
    movwf Vb
loop1
    call ret_base
    DECFSZ Vb, f  
    goto loop1
    NOP

ret_base
    ; Carga el valor 245 en el registro Vc
    movlw .245
    movwf Vc

loop2
    DECFSZ Vc, f 
    goto loop2
    NOP
    RETURN       
