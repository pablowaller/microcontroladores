var_1 EQU 0X23
var_2 EQU 0X24
resultado_1 EQU 0X25
resultado_2 EQU 0X26
resultado_3 EQU 0X27
bandera EQU 0X27
resta EQU 0X28

ORG 0X000
goto main

main
movlw .7
movwf var_2
movlw .15
movwf var_1
call sub_resta
movwf resultado_1

movlw .5
movwf var_1
movlw .5
movwf var_2
call sub_resta
movwf resultado_2

movlw .7
movwf var_2
call sub_resta
movwf resultado_3

nop
goto main

sub_resta
bcf bandera, 0
movf var_2,w
subwf var_1,w
movwf resta
btfsc STATUS, C
return

es_negativo
comf resta, f
incf resta, f
bsf bandera, 0
movf resta,w
return

END
