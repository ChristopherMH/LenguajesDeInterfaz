;Escribir un programa que visualice en pantalla los n?meros pares entre 1 y 25..
            .model small
            .stack
            .data
titulo      db  "Numeros pares entre 1 y 25.$"
msg         db 10, 13, "El ciclo ha terminado.$"
espacio     db 10, 13, "$"
numero      db  1
            .code
main        proc
            .startup
            ;mensaje del titulo del programa
            mov ah, 09h
            lea dx, titulo
            int 21h
            
            ;veces que se entrara al ciclo
            mov cx, 25
            mov ah, 09h
            lea dx, espacio
            int 21h 
            ;inicia el ciclo
            ciclo:
                ;Imprime un espacio
                xor ax, ax
                mov al, numero
                mov bl, 2
                div bl
                cmp ah, 0
                
                jne par
                
                
                ;Imprime el numero a seguir del ciclo
                ;imprimir primer digito
                mov al, numero
                AAM
                mov bx, ax
                mov ah, 02h
                mov dl, bh
                add dl, 30h
                int 21h
                
                ;imprimir segundo digito
                mov ah, 02h
                mov dl, bl
                add dl, 30h
                int 21h
                
                ;a la variable de numero se le suma 1
                mov ah, 09h
                lea dx, espacio
                int 21h 
                
                par:
                inc numero
            loop ciclo;se llama al ciclo
            
            ;imprime el mensaje de que el ciclo ha terminado.
            mov ah, 09h
            lea dx, msg
            int 21h
            
            .exit
main        endp
            end