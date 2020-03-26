;Hola mundo
            .MODEL small
            .STACK
            .DATA
mensaje     DB "Hola, mundo!$" ;el signo $ indica hasta donde es el fin del mensaje, si no se coloca imprime algo muy raro
            .CODE
inicio      proc            ;iniciar proceso con proc
            .STARTUP
            mov     bx, 0001H
            lea     dx, mensaje
            mov     ah, 09H  ;llama a imprimir
            int     21H
            .EXIT
inicio      endp
            end