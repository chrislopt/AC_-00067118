;Christian Jesus Lopez Tejada  carne:00067118
; parte 1: Escribir cuatro iniciales de su nombre completo empezando en la dirección de memoria 200h (25%):

;En 200h el carácter: C
;En 201h el carácter: J
;En 202h el carácter: L
;En 203h el carácter: T


 org 	100h

	section	.text



	mov	byte [200h], "C"
	mov	byte [201h], "J"
	mov	byte [202h], "L"
	mov	byte [203h], "T"

	int	20h

; COMMANDOS DE DEBUG

; r = mostrar estado de los registros
; t = ejecutar una sola instruccion
; g = ejecutar todo
; d 200 = ver estado de memoria en la direccion 200
; q = salir

; ENSAMBLAR ARCHIVO
; nasm -f bin <nombre>.asm -o <output>.com

; ABRIR DOSBOX
; dosbox .

; DEBUGGEAR PROGRAMA EN DOS
; debug.exe <output>.com