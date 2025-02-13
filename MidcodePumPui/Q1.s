global _start

section .data
    m dw 3
    y dw 0
    mPow2 dw 0
    mPow3 dw 0

section .text
_start:
    mov ax, word[m]
    mul al
    mov word[mPow2], ax
    mov cx, word[m]
    mul cl 
    mov word[mPow3], ax
    
    mov bx, word[mPow2] ; m**2
    shl bx, 1 ;*2

    mov dx, word[m]
    shl dx, 2 ;m*4

    add ax, bx
    sub ax, dx
    inc ax ;+1

    mov word[y], ax ;ans

    mov rax, 60 ;exit
    mov rdi, 0
    syscall