main

clrf cont
clrf cont2

loop

decfsz cont, f
goto loop

decfsz cont2, f
goto loop
nop

call ret_1aseg
NOP
NOP

goto main

ret_1aseg
 clrf     vA
 movlw    .100
 movwf    vA

loop1
 call     ret_100mseg
 DECfsz   vA,f
 goto loop1
 NOP
 RETURN

ret_100mseg
 clrf    vB
 movlw   .100
 movwf   vB

loop2
 call     ret_1mseg
 DECfsz   vB,f
 goto loop2
 NOP
 RETURN

ret_1mseg
 clrf    vC
 movlw   .245
 movwf   vC

loop3
 NOP
 DECfsz   vC,f
 goto loop2
 NOP
 RETURN
