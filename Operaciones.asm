main

var_1 EQU 0X23
var_2 EQU 0X24
resultado_1 EQU 0X25
resultado_2 EQU 0X26
resultado_3 EQU 0X27
bandera EQU 0X27; BIT 0 ('1') indica resultado neg de la resta
resta EQU 0X28

ORG 0X000 ; processor rest vector
goto main; go to beginning of program

movlw .7; var_2 = 7;
movwf var_2;
movlw .15; var_1 = 15;
movwf var_1;
call sub_resta;
movwf resultado_1
---------------
movlw .5 ; var_1 = 5;
movwf var_1;
movlw .5; var_2 = 5;
movwf var_2;

call sub_resta;
movwf resultado_2

-----------
movlw .7; var_2 = 7;
movwf var_2;

call sub_resta ;

movwf resultado_3 ;

nop
goto main

-----------
sub rutina de la resta
-------------

sub_resta
 bcf bandera, 0;
 movf var_2,w;
subwf var_1,w;
movwf resta;
btfsc STATUS, C; es_negativo
return ; es positivo o 0

es_negativo
 comf resta, f; resultado se hace complemento a 2;
 incf resta, f;
 bsf bandera, 0;
 movf resta,w;
 return


	END      
