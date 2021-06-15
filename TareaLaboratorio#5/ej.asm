;Tarea Laboratorio 5        nombre:Lopez Tejada, Christian Jesus    carne:00067118 

;Imprimir en pantalla su nombre completo. Cada nombre y apellido debe ir separado en filas (como se muestra en la imagen) (100%).
;Pueden utilizar interrupciones BIOS o DOS:
;imagen XD


;;;;;;;Nota: si tienen problemas al utilizar SI/DI para ir cambiando la posición de las filas en cada iteración, 
;;;;;;;pueden utilizar 200h para guardar el # de fila, luego, al momento de posicionar el cursor, mueven el contenido de 200h a DH (DH es el registro que contiene las filas al usar la interrupción INT 10h; AH 02) 
;;;;;;;y por ultimo, al terminar de imprimir los caracteres/la cadena, se suma/mueve un valor al contenido de 200h para obtener la nueva fila. 
;;;;;;;Modo texto:
;;;;;;;25 filas, 80 columnas utilizando INT 10H, 03H.
;;;;;;;25 filas, 40 columnas utilizando INT 10H, 00h.


;Desarrollo de ejercicio:

org 100h ;comienza el programa

    section .text
    ;se limpian los espacios de memoria ocupados
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

  ;  MOV BP, cadena

    MOV DH, 10; fila en la que se mostrará el cursor
    MOV DL, 20 ;columna en la que se mostrará el cursor
    MOV byte [200h], 12 ; seteando a la direccion de memoria 200 el valor de 12(fila)
    MOV byte [201h], 14 ; seteando a la direccion de memoria 200 el valor de 14(fila)
    MOV byte [202h], 16 ; seteando a la direccion de memoria 200 el valor de 16(fila)

    call modotxt

    LoopPrimerNombre:
    ;Loop para mover el cursor e imprimir el primer nombre
    
        call moverCursor ;llamada a mover cursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribirCaracter; Llamada a escribirCaracter

        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 6
        CMP DI, 10d ; Comparación de DI con 10d que son los caracteres de "Christian" mas el caracter de "espacio"

        JB LoopPrimerNombre ; si DI es menor a 10, entonces que siga iterando.

        MOV DI, 0  ; se reinicia el iterador de caracteres
        MOV DL, 20  ; ser reinicia el valor de la columna otra vez a 20 para comenzar en la siguiente fila 

        jmp LoopSegundoNombre ; salta a la iteracion del segundo nombre.
;
;
    LoopSegundoNombre:
    ;Loop para mover el cursor y el caracter a imprimir en pantalla
        MOV DH, [200h]
        call moverCursor ;llamada a mover cursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribirCaracter; Llamada a escribirCaracter

        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 8
        CMP DI, 06d ; Se comparan los chars de: "Jesus" mas el caracter de "espacio"
        
        JB LoopSegundoNombre ; si DI es menor a 8, entonces que siga iterando.

        MOV DI, 0 ; se reinicia el iterador de caracteres
        MOV DL, 20 ; ser reinicia el valor de la columna otra vez a 20 para comenzar en la siguiente fila 

        jmp LoopPrimerApellido ; salta a la iteracion del primer apellido
;
;  
    LoopPrimerApellido:
    ;Loop para mover el cursor y el caracter a imprimir en pantalla
        MOV DH, [201h]
        call moverCursor ;llamada a mover cursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribirCaracter; Llamada a escribirCaracter

        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 6
        CMP DI, 06d ; se comparar caracteres de "Lopez" y se toma en cuenta el "espacio"

        JB LoopPrimerApellido ; si DI es menor a 10, entonces que siga iterando.
        MOV DI, 0 ; se reinicia el iterador de caracteres
        MOV DL, 20 ; se reinicia el iterador de caracteres
        jmp LoopSegundoApellido ; salta a la iteracion del segundo apellido
;
;
    LoopSegundoApellido:
    ;Loop para mover el cursor y el caracter a imprimir en pantalla
        MOV DH, [202h]
        call moverCursor ;llamada a mover cursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribirCaracter; Llamada a escribirCaracter

        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 7
        CMP DI, 07d ; Comparación de DI con 09d que es el numero de caracteres de "Tejada" ademas, se toma en cuenta el "espacio"
        
        JB LoopSegundoApellido ; si DI es menor a 9, entonces que siga iterando.
        MOV DI, 0 ; se reinicia el iterador de caracteres
        MOV DL, 20 ; se reinicia el iterador de caracteres
        jmp esperarTecla ; salta a esperar tecla, para finalizar la ejecucion
;
;
;   funciones mototexto, moverCursor,escribirCaracter y esperarTecla
    modotxt: 
    
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado
        INT 10h
        RET
;
    moverCursor:
     
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV BH, 0h 
        INT 10h
        RET
;
    escribirCaracter:
            
        MOV AH, 0Ah ; escribe caracter en pantalla según posición del cursor
        MOV AL, CL ; denotamos el caracter a escribir en pantalla, los valores deben ser según código hexadecimal de tabla ASCII
        MOV BH, 0h ; número de página
        MOV CX, 1h ; número de veces a escribir el caracter
        INT 10h
        RET
;
    esperarTecla:
    ;se espera que se aprete una tecla
        MOV AH, 00h ;espera buffer del teclado para avanzar en la siguiente instrucción
        INT 16h
    exit:           
        int 20h



    section .data

    ;Se debe agregar el nombre completo del estudiante que se desea imprimir en la pantalla del dosbox
    cadena DB 'Christian Jesus Lopez Tejada'

    ;termina el programa