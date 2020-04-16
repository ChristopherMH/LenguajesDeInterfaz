;Hola mundo
            .model small ;establecer el tamanio del programa
            .stack
            .data       
mensaje     db "Hola, mundo!$" ;el signo $ indica hasta donde es el fin del mensaje, si no se coloca imprime algo muy raro
            .code
hola        proc            ;iniciar proceso con proc
            .startup
            mov     ah, 09h ;impresion de cadena
            lea     dx, mensaje ;el mensaje se manda al registro dx (de datos) para mostrar el mensaje en la pantalla
            int     21h;interrupci?n
            .exit
hola        endp
            end