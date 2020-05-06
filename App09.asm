;Escribir un programa que pida un numero de dos digitos
;y si el que se introduce por el teclado es menor de 50 que vuelva a solicitarlo.
            .model small
            .stack
            .data
titulo      db "Numero 50.$"
pedir       db 10, 13, "Introduce un numero.$"
msg         db 10, 13, "Vuelve a introducir numeros.$"
msg2        db 10, 13, "El numero es igual o mayor a 50.$"
num1        db 0
num2        db 0
            .code
main        proc
            .startup
            mov ah, 09h
            lea dx, titulo
            int 21h
            
            mov cx, 1
            
            ciclo:
            ;pedir primer numero
            mov ah, 09h
            lea dx, pedir
            int 21h
            ;leer primer numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num1, al
            
            ;leer segundo numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num2, al
            
            mov al, num1
            mov bl, 10
            mul bl
            mov num1, al
            mov al, num1
            add al, num2
            mov num1, al
            
            cmp num1, 50
            jnge numero
            jmp salto
            
            numero:
            mov ah, 09h
            lea dx, msg
            int 21h
            jmp ciclo
            
            salto:
            mov ah, 09h
            lea dx, msg2
            int 21h
            
            loop ciclo
main        endp
            end