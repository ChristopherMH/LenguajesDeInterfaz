;Escribir un programa que calcule la media de 5 numeros de un digito introducidos por el teclado.
                .model small
                .stack
                .data
titulo          db "Promedio de 5 numeros.$"
pedir           db 10, 13, "Ingrese un numero.$"
num             db 0
suma            db 0
prom            db 0
msg1            db 10, 13, "La suma es = $"
msg2            db 10, 13, "El promedio es = $"
                .code
main            proc
                .startup
                ;mostrar titulo
                mov ah, 09h
                lea dx, titulo
                int 21h
                
                mov cx, 5
                ciclo:
                ;pedir numeros
                mov ah, 09h
                lea dx, pedir
                int 21h
                ;leer numeros
                mov ah, 01h
                int 21h
                sub al, 30h
                add num, al
                mov al, num
                mov suma, al
                mov bl, suma
                loop ciclo
                jmp promedio
                
                promedio:
                mov ax, bx
                mov bl, 05h
                div bl
                ;aad
                mov prom, al
                
                ;mensaje de suma
                mov ah, 09h
                lea dx, msg1
                int 21h
                
                ;esto imprime el primer digito de la suma
                mov al, suma
                AAM
                mov bx, ax
                mov ah, 02h
                mov dl, bh
                add dl, 30h
                int 21h
                
                ;y esto el segundo digito
                mov ah, 02h
                mov dl, bl
                add dl, 30h
                int 21h
                
                ;mensaje de promedio
                mov ah, 09h
                lea dx, msg2
                int 21h
                ;esto imprime el primer digito del promedio
                mov al, prom
                AAM
                mov bx, ax
                mov ah, 02h
                mov dl, bh
                add dl, 30h
                int 21h
                
                ;y esto el segundo digito
                mov ah, 02h
                mov dl, bl
                add dl, 30h
                int 21h
                
                .exit
main            endp
                end