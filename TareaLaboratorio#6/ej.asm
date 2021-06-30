;Tarea Laboratorio 6        nombre:Lopez Tejada, Christian Jesus    carne:00067118 

;Hacer un programa que permita utilizar una clave de acceso (100%).
;Condiciones adicionales:

   ;1.Almacene una contraseña de cinco caracteres en la memoria (usando una celda o una variable).
   ;2. El usuario debe digitar la clave y después oprimir la letra Enter para verificar.
   ; 3.Si la clave es correcta el programa debe parar y mostrar el texto “BIENVENIDO”.
   ; 4.Si la clave es incorrecta, debe parar el programa y mostrar el texto "INCORRECTO".

; MAIN
	org 	100h

	section	.text

    MOV BP, palabra                
	call  	LeerCadena

	call 	EscribirPalabra

	call	EsperarTecla

	int 	20h

	section	.data

frase1	db	"BIENVENIDO$"               ; frase con "BIENVENIDO"
frase2 	db 	"INCORRECTO$"             ; frase con "INCORRECTO"
contrasena 	db 	"clave$"                 ; contrasena
palabra 	times 	20  	db	" " 	 ; palabra a leer

; FUNCIONES: Esperar Tecla, Leer cadena,verificar,bueno, malo, escribir Tecla
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret


; funcion que lee la cadena de texto que introduce el usuario
LeerCadena:
        xor     SI, SI          
while:  
        call    EsperarTecla    
        cmp     AL, 0x0D        
        je      exit           
        mov     [BP+SI], AL   	
        jmp     verificar           


;verifica los caracteres, si coninciden pasan a correcto, sino pues se va a la funcion incorrecto
verificar:
    
	mov 	CL,[palabra + SI]   
	mov 	BL,[contrasena + SI]    
	INC     SI             	  
	CMP     BL,CL          	  
	JE      Bueno      	  ; si todos los caracteres coinciden con la otra cadena se salta a Bueno
	JNP     Malo    	  ; si por lo menos un caracter no coincide, se salta a Malo
	jmp     while 
    
Bueno:
		XOR  DX,DX            
		MOV DX, frase1    ; se manda la cadena al registro DX  que se encarga de escribir el mensaje de "BIENVENIDO" 
		jmp while
Malo:
		XOR  DX,DX
		MOV DX, frase2    ; se manda la cadena al registro DX  que se encarga de escribir el mensaje de "INCORRECTO"
		jmp while


;termina el programa
exit:
	mov 	byte [BP+SI], "$"	
        ret


;funcion que imprime en pantalla la frase
EscribirPalabra:
	mov 	AH, 09h
	int 	21h
	ret