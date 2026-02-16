sectiom .text
    global ft_strcpy

; char * strcpy( char * destination, const char * source )
; strcpy(rdi, rsi) -> copy rsi dans rdi
ft_strcpy:
    mov rax, [rdi]
    xor rdx, rdx ; set rdx to 0

loop:
    cmp [rsi + rdx], 0
    je end;

    mov [rdi + rdx], [rsi + rdx]    ;set rdi[rdx] = rsi[rdx]
    inc rdx ; rdx++
    jmp loop

end:
    mov [rdi + rdx], 0  ; rdi[rdx] = '\0'
    ret


