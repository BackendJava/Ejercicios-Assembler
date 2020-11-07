;****** CÓDIGO DE INICIO **********************************
 ideal
 dosseg
 model small
 stack 256
;****** VARIABLES DEL PROGRAMA ****************************
 	dataseg
codsal	db	0
dato	dw 	?
pares	db 	?
nones	db 	?
;****** CÓDIGO DEL PROGRAMA *******************************
 	codeseg
inicio:
	mov 	ax, @data ; Inicializa el
	mov 	ds, ax ; segmento de datos
	mov	bx,[dato]
	;1	
	rcr	bx, 1 ;rota los valores hacia la izquerda con el valor de 1
	rcr	[nones],1
	rcr	bx,1
	rcr	[pares],1
	;2
	rcr	bx, 1
	rcr	[nones],1
	rcr	bx,1
	rcr	[pares],1
	;3
	rcr	bx, 1
	rcr	[nones],1
	rcr	bx,1
	rcr	[pares],1
	;4
	rcr	bx, 1
	rcr	[nones],1
	rcr	bx,1
	rcr	[pares],1
	;5
	rcr	bx, 1
	rcr	[nones],1
	rcr	bx,1
	rcr	[pares],1
	;6
	rcr	bx, 1
	rcr	[nones],1
	rcr	bx,1
	rcr	[pares],1
	;7
	rcr	bx, 1
	rcr	[nones],1
	rcr	bx,1
	rcr	[pares],1
	;8
	rcr	bx, 1
	rcr	[nones],1
	rcr	bx,1
	rcr	[pares],1
salir:
 	mov	ah, 04Ch
 	mov 	al, [codsal]
 	int 	21h
;****** CÓDIGO DE TERMINACIÓN *****************************
 	end	inicio
