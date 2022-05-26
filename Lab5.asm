.MODEL SMALL
.DATA
        PRINT MACRO MSG

        LEA DX,MSG

        MOV AH,09H

        INT 21H

        ENDM                                                                                             


MSG DB 10,13,"........MENU.......  "

    DB 10,13,"    1. ASCENDING ORDER "

    DB 10,13,"    2. DESCENDING ORDER "

    DB 10,13,"    3. EXIT    "

    DB 10,13,"ENTER YOUR CHOICE :  $"

MSG1 DB 10,13,"INVALID  CHOICE$"

MSG3 DB 10,13,"ENTER ANY 5 NUMBERS: $"

MSG4 DB 10,13,"ASCENDING ORDER IS : $"

MSG5 DB 10,13,"DESCENDING ORDER IS : $"

arr DB 2 dup(?)




.CODE
MOV AX,@DATA
MOV DS,AX
MAIN:
PRINT MSG
MOV AH,01H
INT 21H

CMP AL,31H
JZ ASC

CMP AL,32H
JZ DSC

CMP AL,33H
JZ EXIT

JMP INV

EXIT: MOV AH,4CH
      INT 21h

ASC:CALL ASCENDING
JMP RT1
DSC:CALL DESCENDING

INV:PRINT MSG1
RT1:JMP MAIN

;_____________________________________

ASCENDING PROC NEAR
mov cx,05h
mov bx,offset arr

PRINT MSG3

inputs:
mov ah,01h
int 21h
mov [bx],al
inc bx
Loop inputs

mov cx,05h
dec cx

outerloop:
mov bx,cx                      
mov si,0
                                       
comploop:                      
mov al,arr[si]                   
mov dl,arr[si+1]
cmp al,dl

js noswap

mov arr[si],dl
mov arr[si+1],al

noswap:
inc si
dec bx
jnz comploop

loop outerloop

PRINT MSG4
mov dl,10
mov ah,02h
int 21h

mov cx,05h
 mov bx,offset arr
 outputs:
 mov dl,[bx]
 mov ah,02h
 int 21h

 mov dl,32
 mov ah,02h
 int 21h

 inc bx
 loop outputs
ret
ASCENDING endp




;___________________________________________

DESCENDING PROC NEAR
mov cx,05h
mov bx,offset arr

PRINT MSG3

inputs1:
mov ah,01h
int 21h
mov [bx],al
inc bx
Loop inputs1

mov cx,05h
dec cx

outerloop1:
mov bx,cx                      
mov si,0
                                       
comploop1:                      
mov al,arr[si]                   
mov dl,arr[si+1]
cmp al,dl

jnc noswap1

mov arr[si],dl
mov arr[si+1],al

noswap1:
inc si
dec bx
jnz comploop1

loop outerloop1

PRINT MSG5
mov dl,10
mov ah,02h
int 21h

mov cx,05h
 mov bx,offset arr
 outputs1:
 mov dl,[bx]
 mov ah,02h
 int 21h

 mov dl,32
 mov ah,02h
 int 21h

 inc bx
 loop outputs1
 ret
DESCENDING  endp

END
