main

retardo_XXX_mseg
  movlw d'5';
  movwf CONTADOR_3;

loop_2
  movlw d'100';
  movwf CONTADOR_2;

loop_1
 movlw d'250';
 movwf CONTADOR_1;

loop_k
  NOP;
  decfsz CONTADOR_1;
  GOTO loop_k; 
  decfsz CONTADOR_2;
  GOTO loop_1;
  decfsz CONTADOR_3;
  GOTO loop_2;

  nop
  return

	END     
