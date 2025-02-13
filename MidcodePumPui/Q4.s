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
    
    sub ebx, ecx
    jmp endloop
plus:
    add ebx, ecx
endloop:
    loop sumXLoop

endProgramQ3:
    add ebx, 2
    mov dword[Sum], ebx

    mov rax,60 ;exit
    mov rdi,0
    syscall