;TAREA LABORATORIO 3 DE ARQUI

;EJERCICIO 2, sobre factorial del num.5:
;Obtener el factorial del numero 5 (5! = 120 -> 78 en hexadecimal) y 
;guardar el resultado en 20Bh(50%).
;Estos ejercicios deben ser realizados utilizando ITERACIONES, por lo que no se tomará como valido 
;"MOV 20Bh, 120" por ejemplo. 
;Ademas, cada ejercicio debe de ir en archivos separados (ej1.asm, ej2.asm).
;La entrega será en el mismo GitHub de la entrega pasada
;ahora deberá contener una carpeta llamada "Tarea 3" en la raíz del repositorio.

org     100h

        XOR CX,CX
        mov ch,00
        mov cl,05  
        mov ah,00
        mov al,01
        cmp cl,00
        jz salto1

condic  mul cx
        loop condic

salto1  mov [20Bh],al        


        int 20h
