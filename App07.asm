;Programa que muestre en pantalla los n?meros del 1 al 10.
            .model small
            .stack
            .data
titulo      db  "Ciclo de numeros del 1 al 10.$"
msg         db 10, 13, "El ciclo ha terminado.$"
espacio     db 10, 13, "$"
numero      db  1
            .code
main        proc
            .startup
            ;mensaje del titutlo del programa
            mov ah, 09h
            lea dx, titulo
            int 21h
            
            ;veces que se entrara al ciclo
            mov cx, 10
            
            ;inicia el ciclo
            ciclo:
                ;Imprime un espacio
                mov ah, 09h
                lea dx, espacio
                int 21h 
                
                ;Imprime el n?mero a seguir del ciclo
                mov dl, numero
                add dl, 48
                mov ah, 2
                int 21h
                
                ;a la variable de numero se le suma 1 cada vez que el ciclo termina
                add numero, 1
            loop ciclo;se llama al ciclo
            
            ;imprime el mensaje de que el ciclo ha terminado.
            mov ah, 09h
            lea dx, msg
            int 21h
            
            .exit
main        endp
            end