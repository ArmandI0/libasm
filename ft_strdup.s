extern ft_strlen
extern malloc
extern __errno_location

section .text
    global ft_strdup

; char *strdup(const char *s);
; rax  *strduo(rdi)
ft_strdup:
    call ft_strlen ;rdi already contain the *char

    ; if len == 0
    cmp rax, 0
    je error

    push rdi    ; save char *s
    mov r9, rax
    push r9     ; save len

    inc rax ; len + 1 = '\0' -> for alloc size
    mov rdi, rax
    call malloc wrt ..plt
    cmp rax, 0 ; if malloc return NULL
    je error

    pop r9
    pop rdi     ; get char *s

    xor rcx, rcx ; counter -> set rcx = 0

loop:

    ; rax[rcx] = rdi[rcx] 
    mov dl, byte[rdi + rcx]
    mov byte[rax + rcx], dl

    cmp rcx, r9 ; rcx == len s
    je end

    inc rcx

    jmp loop

end:
    mov byte[rax + rcx], 0
    ret

error:
    mov rax, 0
    ret

