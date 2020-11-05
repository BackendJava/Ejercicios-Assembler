;**********************************************************
;			MCD
;**********************************************************
;Programa que calcula el máximo común divisor de 2 números
;**********************************************************

;****** CÓDIGO DE INICIO **********************************
	ideal
	dosseg
	model small
	stack 256
;****** VARIABLES DEL PROGRAMA ****************************
	dataseg
codsal	db	0
n1	dw	?
n2	dw	?
divi	dw 	?
resul	dw 	?
;****** CÓDIGO DEL PROGRAMA *******************************
 	codeseg
inicio:
	mov ax, @data	; Inicializa el
	mov ds, ax	; segmento de datos

	mov ah, 01h	;leemos el primer numero
	int 21H
	sub al, 30h
	mov bx, 10
	mul bx
	mov [byte n1], al
	mov ah, 01h
	int 21H
	sub al, 30h
	add [byte n1], al	
	mov ah, 01h
	int 21H
	sub al, 30h
	push ax
	mov ax,[n1]
	mov bx,10
	mul bx
	mov [n1],ax
	pop ax
	add [byte n1],al	
	mov ah, 01h
	int 21H
	sub al, 30h
	push ax
	mov ax,[n1]
	mov bx,10
	mul bx
	mov [n1],ax
	pop ax
	add [byte n1],al

	mov ah, 01h	;leemos el segundo numero
	int 21H
	sub al, 30h
	mov bx, 10
	mul bx
	mov [byte n2], al
	mov ah, 01h
	int 21H
	sub al, 30h
	add [byte n2], al	
	mov ah, 01h
	int 21H
	sub al, 30h
	push ax
	mov ax,[n2]
	mov bx,10
	mul bx
	mov [n2],ax
	pop ax
	add [byte n2],al	
	mov ah, 01h
	int 21H
	sub al, 30h
	push ax
	mov ax,[n2]
	mov bx,10
	mul bx
	mov [n2],ax
	pop ax
	add [byte n2],al
	mov ax, [n1]
	mov dx,[n2]
	call mcd
	mov [resul],ax
	mov ax,[n1]
	mul [n2]
	div [resul]
	mov cx,[resul]	
salir:
	mov ah,04Ch
	mov al,[codsal]
	int 21h

;**************PROCEDIMIENTOS******************************
;**********************************************************
;	MCD
;Determina el MCD de dos números
;Parámetros:
;	AX = número1
;	DX = número2
;Regresa:
;	AX = Máximo Común Divisor
;***********************************************************
proc	mcd
	push ax
	push dx
	sub ax,dx
	pop dx
	pop ax
	je @@iguales
	jnbe @@n1mayor
	jmp @@n2mayor
@@n1mayor:
	mov [divi],dx
	mov dx,0
	div [divi]
	cmp ax,0
	mov bx, ax
	mov ax, [divi]
	mov [divi], bx
	je cmde
	jmp @@n1mayor	
cmde:
	ret

@@n2mayor:


@@iguales:
	ret
endp	mcd
;****** CÓDIGO DE TERMINACIÓN *****************************
	end inicio