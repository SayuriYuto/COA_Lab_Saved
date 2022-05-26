.model small

.data
m1 db 10,13, "Enter any five numbers: $"
m2 db 10,13, "Total number of positive no. are: $"
m3 db 10,13, "Total number of negative no. are: $"
cntp db 00h
cntn db 00h

.code
mov ax, @data
mov ds, ax

mov ah, 09h
lea dx, m1
int 21h

mov ch,05h
X3:
call accept
AND bl,80h      ;AND logic between Operand 1 and Operand 2

JNS X4          ;Jump if not sign
inc cntn
dec ch

JNZ X3
cmp ch,00h
je X5           ;Jump if equal

X4:
inc cntp
dec ch
JNZ X3

X5:
mov ah,09h
lea dx,m2
int 21h

mov dl, cntp
add dl,30h
mov ah, 02h
int 21h

mov ah,09h
lea dx,m3
int 21h

mov dl, cntn
add dl, 30h
mov ah, 02h
int 21h

mov ah, 4ch
int 21h

accept proc near

mov ah, 01h         ;MOV Destn, Src
int 21h

mov bl, al
sub bl, 30h
cmp bl, 09h
JLE X1              ;Jump if less than equal to
sub bl, 07h

X1:
mov cl, 04h
SHL bl, cl          ;Shift Left

mov ah, 01h
int 21h

mov bh,al
sub bh, 30h

cmp bh, 09h
JLE X2

sub bh, 07h
X2:
add bl, bh

ret
endp
end
