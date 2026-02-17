section .text
    global ft_strcmp

; ft_strcmp(const char * first, const char * second)
; ft_strcmp(rdi, rsi)
ft_strcmp:
    xor rdx, rdx
    xor rax, rax

loop:
    mov r8b, [rdi + rdx]
    mov r9b, [rsi + rdx]
    ; if rdi[i] != 0 && rsi[i] != 0
    cmp r8b, 0
    je end
    cmp r9b, 0
    je end

    ; else
    cmp r8b, r9b
    jne end
    inc rdx
    jmp loop

end:
    ;movzx -> mov and "Zero extend"
    movzx rax, r8b
    movzx rcx, r9b
    sub rax, rcx
    ret