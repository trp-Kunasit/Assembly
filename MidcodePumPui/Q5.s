global _start
section .data
    n db 5
    Sum dw 0

section .text

_start:
    mov cl, byte[n]
sumXLoop:
    mov al, cl
    shl al, 7
    cmp al, 0
    je plus
    ; sub if n mod 2 != 0
    sub ebx, ecx
    loop sumXLoop
plus:
    add ebx, ecx
    loop sumXLoop

endProgramQ3:
    add ebx, 2 ; for n = 1 because n = 1 output = -1 // 1 mod 2 = 1
    mov dword[Sum], ebx

    mov rax, 60 ;exit
    mov rdi, 0
    syscall