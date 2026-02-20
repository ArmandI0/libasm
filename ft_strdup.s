extern ft_strlen
extern malloc
extern __errno_location

section .text
    global ft_strdup

; char *strdup(const char *s);
; rax  *strdup(rdi)
ft_strdup:
    call ft_strlen

    ; SAVE AND ALIGN MEMORY
    push rdi                ; save char *s
    mov r9, rax
    push r9                 ; save len

    push r12                ; Preserve S12
    mov r12, rsp            ; Save the stack pointer
    and rsp, -16            ; Align rsp before call libc

    ; PREPARE AND CALL MALLOC
    inc rax                 ; len + 1 = '\0' -> for alloc size
    mov rdi, rax
    call malloc wrt ..plt

    ; RESTORE MEMORY
    mov rsp, r12            ; Restore rsp after call
    pop r12

    pop r9                  ; get len
    pop rdi                 ; get char *s

    ; HANDLE RETURN
    cmp rax, 0              ; if malloc return NULL
    je .error
    xor rcx, rcx            ; counter -> set rcx = 0

.loop:

    ; rax[rcx] = rdi[rcx] 
    mov dl, byte[rdi + rcx]
    mov byte[rax + rcx], dl

    cmp rcx, r9 ; rcx == len s
    je .end

    inc rcx
    jmp .loop

.end:
    ret

.error:
    mov rax, 0
    ret
