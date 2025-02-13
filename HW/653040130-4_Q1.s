;653040130-4_Q1.s
section .data
    m   dw 1         
    n   dw 100       
    Sum dw 0         

section .text
    global _start

_start:
    mov ax, [m]      ; ax = m
    mov bx, [n]      ; bx = n

    xor cx, cx       ; cx = 0

loop_start:
    add cx, ax       ; cx = cx + ax
    inc ax           ; ax = ax + 1
    cmp ax, bx       ; compare ax, n
    jle loop_start   ; if ax <= n get loop

    mov [Sum], cx

    ; exit the program
    mov rax, 60      
    xor rdi, rdi     
    syscall