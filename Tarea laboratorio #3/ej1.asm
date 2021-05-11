                        ;TAREA LABORATORIO 3 DE ARQUI

; ALUMNO: LOPEZ TEJADA, CHRISTIAN JESUS          CARNE:00067118

;EJERCICIO 1:
; Utilizando SALTOS E ITERACIONES realizar:
; El promedio de la suma de los 8 dígitos de su carnet, el resultado del promedio guardarlo en 20Ah (50%).
;   Suma de los dígitos (20%).
; Promedio (este promedio será la DIVISION ENTERA, no trabajaremos con decimales)(25%).
; Guardar el resultado en el registro 20Ah (5%).
;   Ejemplo: 0+0+1+0+8+5+1+7 y luego, el total de la sum dividirlo entre 8.

; DESARROLLO:

; Se inicializa con:
org 100h

section .text

; Limpiando el registro AX.

        XOR AX, AX 
        XOR BX, BX 
        XOR SI, SI
        MOV BL,8d
        MOV word CX,8d
        MOV SI,00

; Mover a AX 0.
        MOV AX, 00d 

        MOV byte [0200h],00
        MOV byte [0201h],00
        MOV byte [0202h],00
        MOV byte [0203h],00
        MOV byte [0204h],05
        MOV byte [0205h],02
        MOV byte [0206h],01
        MOV byte [0207h],08

; Salto sin condición, vamos a la etiqueta Sumando.        
        jmp Sumando  Sumando:

; Se Suma a AX un 0       
        ADD AL, [0200h+ SI] 
        INC SI
        loop iterar
       
; Se realiza un metodo que calcula el promedio.
;0+0+0+0+5+2+1+8 = 16
; promedio = 2 

promedio:
        DIV BL
        MOV [20Ah], AX
        jmp exit

;Salida del programa.
exit:
        int 20h

