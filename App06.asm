;comprobar si un numero es par o impar
            .model small
            .stack
            .data
;mensajes
titulo      db "Numero par o impar$"
mensaje     db 10, 13, "Introduce un numero: $"
mensPar     db 10, 13, "El numero es par.$"
mensImpar   db 10, 13, "El numero es impar.$"
;variables
numero      db 0
            .code
parimpar    proc
            .startup
            mov ax, @data
            mov ds, ax
            
            mov ah, 00
            mov al, 03h
            int 10h
            
            ;mostrar titulo
            mov ah, 09h
            lea dx, titulo
            int 21h
            
            ;mostrar mensaje para introducir un numero
            mov ah, 09h
            lea dx, mensaje
            int 21h
            
            ;leer el numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov numero, al
                        
            test numero, 1
            
            jp par ;va a la parte del codigo si es par
            jnp impar; va a la parte del codigo si es impar
            
            ;si el numero es par...
            par:
            mov ah, 09h
            lea dx, mensPar
            int 21h
            jmp fin
            
            ;si el numero es impar...
            impar:
            mov ah, 09h
            lea dx, mensImpar
            int 21h
            jmp fin
            
            ;fin
            fin:
            mov ax, 4c00h
            int 21h
parimpar    endp
            end