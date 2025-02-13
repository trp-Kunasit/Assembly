global _start

section .data
    n db 100
    Sum dw 0

section .text
_start:
    mov eax, 1  ;check 1 first
    mov bl,  byte[n]
    cmp byte[n], 1    
    je endProgramQ3

    dec bl ; becasue have onetimecheck
    mov cl, bl ;count loop
    ;mov esi, 1  ;count
    inc esi
    mov edi, 0

sumXLoop:
    inc esi
    cmp edi, 0
    je plus
    cmp edi, 1
    je subtrack
plus:
    add eax, esi
    inc edi
    jmp continueLoop
subtrack:
    sub eax, esi
    dec edi
continueLoop:
    loop sumXLoop

endProgramQ3:
    mov dword[Sum], eax

    mov rax, 60 ;exit
    mov rdi, 0
    syscall