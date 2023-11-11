
retardo_XXX_mseg
 movlw d'5';
 movwf CONTADOR_3;
loop_2
 movlw d'100';
 mowf CONTADOR_2;
loop_1
 movlw d'250';
 movwf CONTADOR_1;
loop_k
 NOP; este nop me permite tener un retardo mas preciso
 decfsz CONTADOR_1;
 GOTO loop_k; un retardo de __us
 decfsz CONTADOR_2;
 GOTO loop_1; un retardo de ___ms
 decfsz CONTADOR_3;
 GOTO loop_2; un retardo de ___s
nop;
return
