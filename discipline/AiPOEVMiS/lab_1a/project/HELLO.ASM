.MODEL small

.STACK

.DATA
CR  equ 0Dh
LF  equ 0Ah
EOS equ '$'

Message db 'Hello, world!', CR, LF, EOS

.CODE
begin:
    mov ax, @data
    mov ds, ax
    mov ah, 9
    mov dx, offset Message
    int 21h
    mov ah, 4ch
    int 21h
end begin
