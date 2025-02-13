;653040130-4_Q2.s
section .data
    i       dw 0        
    j       dw 100      
    EvenSum dw 0        

section .text
    global _start

_start:
    mov     ax, [i]     ; ax = i
    mov     bx, [j]     ; bx = j

    xor     cx, cx      ; cx = 0

    ; test value of ax is even or odd
    test    ax, 1       
    jz      check_loop  ; if ax is even go to check_loop
    inc     ax          ; if ax is odd add 1 to ax

check_loop:
    ; check if ax is greater than or equal to bx
    cmp     ax, bx
    jg      done

sum_even_loop:
    add     cx, ax
    add     ax, 2

    ; check if ax is greater than or equal to bx
    cmp     ax, bx
    jle     sum_even_loop

done:
    ; store the sum of even numbers in EvenSum
    mov     [EvenSum], cx

    ; exit the program
    mov     rax, 60     
    xor     rdi, rdi    
    syscall