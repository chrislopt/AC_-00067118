;Christian Jesus Lopez Tejada  carne:00067118
; parte 2: Luego, copiar a los siguientes registros los códigos ASCII de los caracteres guardados en 200h (75%):


;Copiar el valor de 200h a AX usando direccionamiento directo.
    MOV       AX,  [200h]


;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
    MOV       BX,  [201h]
    MOV       CX,  [BX]


;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
    MOV       BP,  0200h
    MOV       SI,  0002h
    MOV       DX,  [BP + SI]


;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.
    MOV       BX,  0200h
    OV       DI,  [BX + 0003h]  

    int        20h


; Direccionamiento relativo por registro
	mov	AX, [DI+203h]

	int 	20h