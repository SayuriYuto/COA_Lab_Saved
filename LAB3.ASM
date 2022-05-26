.model small

.data
m1 db 10,13, "Enter the 2 digit number : $"
arry db 5 dup(00)
sum db 0000h

.code
mov ax,@data
mov ds,ax

mov ah,09h
lea dx,m1
int 21h

mov ch,05h
lea si,arry
mov al,00

X3:
call accept
inc si
dec ch
JNZ X3

mov ah,4ch
int 21h

accept proc near

mov ah,01h
int 21h

mov bl,al
sub bl,30h
cmp bl,09h
JLE X1
sub bl,07h

X1:
mov cl,04h
SHL bl,cl

mov ah,01h
int 21h

mov bh,al
sub bh,30h

cmp bh,09h
JLE X2
sub bh,07h

X2:
add bl,bh

ret
endp
end
