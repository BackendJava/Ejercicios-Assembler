;****** CÓDIGO DE INICIO **********************************
ideal
dosseg
model small
stack 256
;****** VARIABLES DEL PROGRAMA ****************************

dataseg
codsal db 0
limite dw ?
raiz dw ?
aux dw 0
;****** CÓDIGO DEL PROGRAMA *******************************
codeseg
inicio:
mov ax, @data ; Inicializa el
mov ds, ax ; segmento de datos
mov cl, 1
mov bx, 0


ciclo:
mov al,cl ; al = cl
mul cl    ; ax = al*cl
add [aux], ax    ;aux+=ax 
mov ax, [aux]    ;ax = aux 

cmp ax, [limite]
ja final ;si ax es mayor a l limite se salta a la etiqueta final 
inc bx ;bx++
inc cx ;cx++
jmp ciclo ;salta a la etiqueta ciclo



final:
mov raiz, bx; raiz = bx

salir:
mov ah, 04Ch
mov al, [codsal]
int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************
end inicio