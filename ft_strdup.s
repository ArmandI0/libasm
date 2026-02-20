extern ft_strlen
extern malloc
extern __errno_location

section .text
    global ft_strdup

; char *strdup(const char *s);
; rax  *strdup(rdi)
ft_strdup:
    call ft_strlen

    ; if len == 0
    cmp rax, 0
    je error

    push rdi                ; save char *s
    mov r9, rax
    push r9                 ; save len

    inc rax                 ; len + 1 = '\0' -> for alloc size
    mov rdi, rax

    mov r12, rsp            ; Save the stack pointer
    and rsp, -16            ; Align rsp before call libc
    call malloc wrt ..plt
    mov rsp, r12            ; Restore rsp after call

    cmp rax, 0              ; if malloc return NULL
    je error


    pop r9                  ; get len
    pop rdi                 ; get char *s

    xor rcx, rcx            ; counter -> set rcx = 0

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

