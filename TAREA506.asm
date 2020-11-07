;****** CÓDIGO DE INICIO **********************************
ideal
dosseg
model small
stack 256
;****** VARIABLES DEL PROGRAMA ****************************
dataseg
codsal   db 0
contador db ?
dato     db ?
resul    db ?
;****** CÓDIGO DEL PROGRAMA *******************************
codeseg
inicio:
mov ax, @data ; Inicializa el
mov ds, ax ; segmento de datos
xor ch,ch ; ch = 0
xor ah,ah ; ah =0
mov al, [dato] ;al = dato
mov bh, [dato] ;bh = dato 
mov cl,7 ; cl = 7

ciclo: jcxz finalciclo ; if(cx == 0) ---> final:
shr al,1 ; al>>1 se corre un bit a la derecha
adc ah,0 ; ah += c
loop ciclo ; retorna a la etiqueta ciclo

finalciclo:        ;ve si el contador es par o impar dividiendolo por dos
mov [contador],ah  ; aux = ah
xor ax, ax         ;limpiamos ax
mov al, [contador] ; al = aux
mov bl, 2          ; bl = 2
div bl             ;ax/bx
mov bl, ah         ;el residuo de la division bl = residuo 
mov al, 0          ;al = 0
cmp al,bl          ; compara el residuo al+= 0-residuo 
je par             ; si el contador es un numero par lo manda a la etiqueta par z = 1
jmp impar          ; si no es par 


par:
xor ah, ah         ; ah = 0    
mov al,bh          ; al = dato
shl bh, 1          ; 1 << dato
adc ah,0           ; ah += c
cmp ah,1           ; compara ah con uno 
je restar          ; si ah es igual a 1 se combierte ese bit a 0
jmp fin            ; si no es igual a uno 

restar:
mov bl, 80h        ; bl = 1000 0000b = 128d = 80h
sub al,bl          ; al = al - bl  -> dato-=80h
mov [resul],al     ; resul = al -> aux = dato-80h
jmp salir          ; saltar a salir 


impar:
xor ah, ah         ; ah = 0    
mov al,bh          ; al = dato
shl bh, 1          ; 1 << dato
adc ah,0           ; ah += c
cmp ah,1           ; compara ah con uno 
je  fin          ; si ah es igual a 1 se combierte ese bit a 0
jmp sumar

sumar:
mov bl,80h
add al,bl
mov [resul],al
jmp salir

fin:
mov [resul],al ; contador = ah

salir:
mov ah, 04Ch
mov al, [codsal]
int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************
end inicio