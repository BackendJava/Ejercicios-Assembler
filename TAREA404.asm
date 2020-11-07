;Haga un programa que complemente el valor del i-ésimo bit de una variable de un byte, esto es,
;si el bit tiene el valor de uno deberá cambiarlo a cero y viceversa. La variable deberá llamarse
;dato, el bit a complementar estará en la variable bit y el resultado en la variable resul. El
;programa deberá llamarse TAREA404.
;
;****** CÓDIGO DE INICIO **********************************
 ideal
 dosseg
 model small
 stack 256
;****** VARIABLES DEL PROGRAMA ****************************
 dataseg
codsal	db 0
da	db 01
dato	db ?
bits	db ?
resul	db ?

;****** CÓDIGO DEL PROGRAMA *******************************
 codeseg
inicio:

mov 	ax, @data ; Inicializa el
mov 	ds, ax ; segmento de datos
mov	al, [dato] ; moviendo el valor del dato al registro al
mov	cl, 01
add	cl,[bits] ; suma el valor de bits con el valor del registro cl
not	al	; invierte el valor que esta en el registro al
rcr	al,cl ; rota hacia la izquiera la cantidad de veces que esta en el valor cl
not	al
rcl	al,cl
mov	[resul],al

salir:
 mov ah, 04Ch
 mov al, [codsal]
 int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************
 end inicio
