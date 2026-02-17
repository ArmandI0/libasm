section .text
    global ft_strcpy

; char * strcpy( char * destination, const char * source )
; strcpy(rdi, rsi) -> copy rsi to rdi
ft_strcpy:
    xor rdx, rdx            ; set rdx to 0

loop:
    cmp byte[rsi + rdx], 0
    je end                  ; if rdi[rdx] == 0 -> goto end

    mov al, byte[rsi + rdx] ; in x86 intel mov mem to mem are not allowed ex : (mov [rdi + rdx], [rsi + rdx])
    mov [rdi + rdx], al
    inc rdx                 ; rdx++
    jmp loop

end:
    mov byte[rdi + rdx], 0  ; rdi[rdx] = '\0'
    mov rax, [rdi]          ; To return destination
    ret


