.model small
        
.data
a db 10,13, "Enter first no:$"
b db 10,13, "Enter second no:$"
c db 10,13, "Addition:$"
        
.code
mov ax, @data
mov ds, ax              ;ds = data_segment

mov ah,09H              ;09H = print until "$"
lea dx,a                ;LEA (Load effective address) = load dx with offset memory location
int 21H                 ;call interrupt 21H
        
mov ah, 01H             ;01H = Take input from user
int 21H
        
mov bl, al              ;char ASCII in bl
sub bl,30H              ;convert from ascii to hex
cmp bl,09H              

JLE X1                  ;Jump if less than or equal to, bl<=09H
sub bl,07H              ; if bl is greater than 09H then subtract 07H

;now bl has the first number

X1:
;print "Enter second no:$"
mov ah,09H
lea dx,b
int 21H
        
mov ah,01H              ;01H = function to wait for input
int 21H
        
mov bh,al               ;move inputted charater in bh
sub bh,30H              ;convert from ascii to hex

;print "Addition:$" 
mov ah,09H              
lea dx,c
int 21H

add bh,bl               ;perform addition
add bh,30H              ;convert hex to ascii
mov dl,bh               
cmp dl,39H              ;compare dl

JLE X2                  ;jump if less than equal to 39h
add dl,07H              ;if greater than 39, add 07h
        
X2:

mov ah,02H              ;02H = function to output a character, character in dl
int 21H

mov ah,4CH              ;exit-terminate with return code
int 21H
end