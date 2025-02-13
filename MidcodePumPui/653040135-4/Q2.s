global _start

section .data
    f db 40
    C db 0
    remC dw 0

section .text
_start:
    mov al, byte[f]
    sub al, 32
    mov bl, 9
    mul bl

    cwd ;ax to dx:ax
    mov bx, 5
    idiv bx ;save for under zero

    mov byte[C], al
    mov word[remC], dx ;rem for C

    mov rax,60 ;exit
    mov rdi,0
    syscall