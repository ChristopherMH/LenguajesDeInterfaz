;division
            .model small
            .stack
            .data  
            ;mensajes a mostrar
titulo      db "Division $"
mensaje1    db 10, 13, "Escribe el primer numero: $"
mensaje2    db 10, 13, "Escribe el segundo numero: $"
mensRes     db 10, 13, "El resultado de la division es: $"
            ;variables para almacenar los numeros
num1        db 0
num2        db 0
resultado   db 0
            .code
mult        proc
            .startup
            mov ax, seg @data
            mov ds, ax
            
            ;mostrar titulo
            mov ah, 09h
            lea dx, titulo
            int 21h
            
            ;mostrar el mensaje1
            mov ah, 09h;imprime en pantalla
            lea dx, mensaje1;se pasa el mensaje1 al registro dx
            int 21h;se hace una interrupcion
            
            ;leer el primer numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num1, al
            
            ;mostrar el mensaje2
            mov ah, 09h
            lea dx, mensaje2
            int 21h
            
            ;leer el segundo numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num2, al
            
            ;al registro al se le da el valor del num1
            xor ax, ax
            mov bl, num2
            mov al, num1
            div bl;con div se divide el valor de num2 a al (lo que se dio en num1)
            mov resultado, al ;se mueve el valor de al a resultado
            
            ;se imprime el mensaje mensRes
            mov ah, 09h
            lea dx, mensRes
            int 21h
            
            ;esto imprime el primer digito de la division
            mov al, resultado
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
mult        endp
            end