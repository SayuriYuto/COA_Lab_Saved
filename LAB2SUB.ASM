        
        .model small
        
        .data
        a db 10,13, "Enter first no:$"
        b db 10,13, "Enter second no:$"                                                                                                                                                                                                                                                                  
        c db 10,13, "Subtraction:$"
        
        .code
        mov ax, @data
        mov ds, ax
        
        mov ah,09H
        lea dx,a
        int 21H
        
        mov ah, 01H
        int 21H
        
        mov bl, al
        sub bl,30H
        cmp bl,09H
        
        JLE X1
        sub bl,07H
        
        X1: mov ah,09H
        lea dx,b
        int 21H
        
        mov ah,01H
        int 21H
        
        mov bh,al
        sub bh,30H
        
        mov ah,09H
        lea dx,c
        int 21H
        
        sub bh,bl
        add bh,30H
        mov dl,bh
        cmp dl,39H
        JLE X2                                                                                                                                                                                                                                                                                                                                                                                                                          
        add dl,07H
        
        X2:
        mov ah,02H
        int 21H
        mov ah,4CH
        int 21H
        end
