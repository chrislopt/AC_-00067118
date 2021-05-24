;Tarea Laboratorio 4        nombre:Lopez Tejada, Christian Jesus    carne:00067118 

;Hacer un programa utilizando una o más subrutinas donde, con la ayuda de un arreglo de elementos numéricos con tamaño de 1 byte, 
;se separe los números pares e impares. (100%)
;El arreglo debe contener 10 números y debe estar declarado en la directiva "section .data". 
;Los pares colocarlos en la dirección 0300H y los impares colocarlos a partir de la dirección 0320H. 
;Colocar el repositorio de la tarea como entrega.

;Desarrollo de ejercicio:
        org     100h
; Aqui esta parte es "Main"
        section .text

        mov     BP, arrNum     ; BP = puntero a arrByte
; llamada a la función "CompImparVpar"
        call    CompImparVpar        
   
        int     20h

        section .data

; arreglo de numeros del tipo "byte" 
arrNum db      01,02,03,04,06,07,08,09,10,11,12,13,0xA   
     

;Subrutina: "CompImparVpar" es la funcion que comprueba si el numero en el arreglo es par o es impar
CompImparVpar:                       
        xor     SI, SI          ; SI = 0
        xor     DI, DI 
;Bucle while que permite recorrer el arreglo hasta que se recorran los 14 elementos del array
while:  
        mov     AL, [BP+SI]     ; AL = [puntero a arreglo + SI]
        cmp     AL, 0xA         ; verifica si AL == 0xA
        je       end
        inc     SI
        mov      BL,2
        div      BL            
        cmp      AH,0
        je       par
        ja       impar     
par:
        mov byte    [300h+DI], AL   
        inc     DI  
        jmp     while
impar:
        mov byte    [320h+DI], AL 
        inc     DI   
        jmp     while

end:    
        ret       
