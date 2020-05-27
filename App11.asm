;calculadora basica utilizando macros
            .model small
            .stack
            .data
titulo      db  10, 13, "--CALCULADORA---$"
sel         db  10, 13, "Selecciona una opcion del menu$"
menu        db  10, 13, "------Menu------$"
sum         db  10, 13, "1. SUMA$"
rest        db  10, 13, "2. RESTA$"
div1        db  10, 13, "3. DIVISION$"
multi       db  10, 13, "4. MULTIPLICACION$"
sali        db  10, 13, "5. SALIR$", 10, 13
msgs        db  10, 13, "------Suma------$", 10, 13
msgr        db  10, 13, "------Resta------$", 10, 13
msgd        db  10, 13, "------Division------$", 10, 13
msgm        db  10, 13, "------Multiplicacion------$", 10, 13
ped1        db  10, 13, "Introduce el primer numero: $", 10, 13
ped2        db  10, 13, "Introduce el segundo numero: $", 10, 13
ress        db  10, 13, "El resultado de la suma es: $", 10, 13
resr        db  10, 13, "El resultado de la resta es: $", 10, 13
resd        db  10, 13, "El resultado de la division es: $", 10, 13
resm        db  10, 13, "El resultado de la multiplicacion es: $", 10, 13
volver      db  10, 13, "Presione cualquier tecla para volver al menu$"
saliendo    db  10, 13, "Saliendo...$"
num1        db  0
num2        db  0
num3        db  0
            .code
            .startup  
  ;macros
            suma macro n1, n2
                mov al,n1  
                mov bl,n2 
                add bl,al
                mov num3, bl
                mov ah, 09
                lea dx, ress
                int 21h
                ;esto imprime el primer digito de la resta
                mov al, num3
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
            endm;suma macro
            
            resta macro n1, n2
                mov al, n1
                sub al, n2
                mov num3, al
                mov ah, 09
                lea dx, resr
                int 21h
                ;esto imprime el primer digito de la resta
                mov al, num3
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
            endm;resta macro
            
            division macro n1, n2
                xor ax, ax
                mov bl,n2
                mov al,n1 
                div bl
                mov num3, al
                mov ah, 09
                lea dx, resd
                int 21h
                ;esto imprime el primer digito de la resta
                mov al, num3
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
            endm; division macro
                
            multiplicacion macro n1, n2
                mov al, n1
                mov bl, n2
                mul bl ;se multiplica con mul el valor de al por bl
                mov num3, al ;se mueve el valor de al a resultado
                ;se imprime el mensaje mensRes
                mov ah, 09h
                lea dx, resm
                int 21h
                ;esto imprime el primer digito de la multiplicacion
                mov al, num3
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
            endm;multiplicacion macro
            
main        proc
            ;mostrar todos los mensajes
            mov ah, 09h
            lea dx, titulo
            int 21h
            mov ah, 09h
            lea dx, sel
            int 21h
            mov ah, 09h
            lea dx, menu
            int 21h
            mov ah, 09h
            lea dx, sum
            int 21h
            mov ah, 09h
            lea dx, rest
            int 21h
            mov ah, 09h
            lea dx, div1
            int 21h
            mov ah, 09h
            lea dx, multi
            int 21h
            mov ah, 09h
            lea dx, sali
            int 21h
            
            ;leer numero de opciones
            mov ah, 08
            int 21h
            
            cmp al, 49;ascii de 1
            je adi;suma
            cmp al, 50; ascii de 2
            je subs;resta
            cmp al, 51; ascii de 3
            je salto1
            cmp al, 52; ascii de 4
            je salto2
            cmp al, 53;ascii de 5
            je salto3
            
            salto1:
            jmp divi
            
            salto2:
            jmp mu
            
            salto3:
            jmp salir
            
            adi:
            ;mostrar mensaje de que es Suma
            mov ah, 09h
            lea dx, msgs
            int 21h
            ;mostrar el mensaje1
            mov ah, 09h
            lea dx, ped1
            int 21h
            ;leer el primer numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num1, al
            ;mostrar el mensaje2
            mov ah, 09h
            lea dx, ped2
            int 21h
            ;leer el segundo numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num2, al
            suma num1 num2;se envian parametros a la macro
            ;mensaje de volver
            mov ah,09h
            lea dx, volver
            int 21h
            ;leer tecla para volver al menu
            mov ah, 01h
            int 21h
            sub al, 30h
            jmp main;salto al menu
            
            subs:
            ;mostrar mensaje de que es resta
            mov ah, 09h
            lea dx, msgr
            int 21h
            ;mostrar el mensaje1
            mov ah, 09h
            lea dx, ped1
            int 21h
            ;leer el primer numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num1, al
            ;mostrar el mensaje2
            mov ah, 09h
            lea dx, ped2
            int 21h
            ;leer el segundo numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num2, al
            resta num1 num2;se envian parametros a la macro
            ;mensaje de volver
            mov ah,09h
            lea dx, volver
            int 21h
            ;leer tecla para volver al menu
            mov ah, 01h
            int 21h
            sub al, 30h
            jmp main;salto al menu
            
            divi:
            ;mostrar mensaje de que es division
            mov ah, 09h
            lea dx, msgd
            int 21h
            ;mostrar el mensaje1
            mov ah, 09h
            lea dx, ped1
            int 21h
            ;leer el primer numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num1, al
            ;mostrar el mensaje2
            mov ah, 09h
            lea dx, ped2
            int 21h
            ;leer el segundo numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num2, al
            division num1 num2;se envian parametros a la macro
            ;mensaje de volver
            mov ah,09h
            lea dx, volver
            int 21h
            ;leer tecla para volver al menu
            mov ah, 01h
            int 21h
            sub al, 30h
            jmp main;salto al menu
            
            mu:
            ;mostrar mensaje de que es multiplicacion
            mov ah, 09h
            lea dx, msgm
            int 21h
            ;mostrar el mensaje1
            mov ah, 09h
            lea dx, ped1
            int 21h
            ;leer el primer numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num1, al
            ;mostrar el mensaje2
            mov ah, 09h
            lea dx, ped2
            int 21h
            ;leer el segundo numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num2, al
            multiplicacion num1 num2;se envian parametros a la macro
            ;mensaje de volver
            mov ah,09h
            lea dx, volver
            int 21h
            ;leer tecla para volver al menu
            mov ah, 01h
            int 21h
            sub al, 30h
            jmp main;salto al menu
            
            ;salir
            salir:
            mov ah, 09h
            lea dx, saliendo
            int 21h
            mov ax,4c00h
            int 21h
main        endp           
            end