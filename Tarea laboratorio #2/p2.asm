;Christian Jesus Lopez Tejada  carne:00067118
; parte 2: Luego, copiar a los siguientes registros los códigos ASCII de los caracteres guardados en 200h (75%):

;Copiar el valor de 200h a AX usando direccionamiento directo.
;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.


org	100h

	section .text

	mov 	AX, 25A0h 
	mov	BX, 200h

; Direccionamiento directo o absoluto
	mov 	[200h], AX 
	mov 	SI, [200h]

; Direccionamiento indirecto por registro
; Usamos el registro base como puntero para acceder a la memoria
	mov	CX, [BX]

; Direccionamiento indirecto base mas indice 
; Usamos el registro base junto con un registro apuntador
	mov 	AX, [BX+DI]
	mov	[BX+DI], AX

; Direccionamiento relativo por registro
	mov	AX, [DI+100h]

	int 	20h