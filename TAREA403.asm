;**********************************************************
; TAREA403.ASM
;Haga un programa para convertir una temperatura en grados Cent�grados a Fahrenheit. La
;temperatura en grados Cent�grados est� en la variable CENTI, y la temperatura en grados
;Fahrenheit est� en la variable FAHR. El rango de temperaturas que el programa debe manejar
;es de -200 a 200 grados cent�grados. El programa deber� llamarse TAREA403.

;****** C�DIGO DE INICIO **********************************
 ideal
 dosseg
 model small
 stack 256
;********Variable constantes*******************
temp equ 9
temp2 equ 5
;****** VARIABLES DEL PROGRAMA ****************************
 dataseg
codsal db 0


CENTI dw ?
FAHR dw ?
;****** C�DIGO DEL PROGRAMA *******************************
 codeseg
inicio:
 mov ax, @data ; Inicializa el
 mov ds, ax ; segmento de datos
 mov ax, temp; mueve CENTI al registro acumulador
 imul [CENTI]; multiplica los centigrados con el registro acumulador
 mov bx, temp2; mueve 5 para que divida al resultado anterior
 idiv bx;
 add ax, 32d; le suma 32 para completar la formula ((C*9)/5)+32
 mov [FAHR], ax; mueve el resultado a la variable FAHR
salir:
 mov ah, 04Ch
 mov al, [codsal]
 int 21h
;****** C�DIGO DE TERMINACI�N *****************************
 end inicio
