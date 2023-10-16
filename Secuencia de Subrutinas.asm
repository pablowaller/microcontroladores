main

 call ret_xx
 nop
 nop
 goto main

ret_xx
 movlw .30
 movwf vC
loop3
 call ret_100mseg
 decfsz vC,f
 goto loop3
 return

ret_100mseg
  movlw .100
  movwf vB
loop2
  call ret_1mseg
  decfsz vB,f
  goto loop2
  return

ret_1mseg
 clrf vA
 movlw .199
 movwf vA

loop
 nop
 nop
 decfsz vA, f
 goto loop
 return

END
