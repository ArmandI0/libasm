extern ft_strlen
extern __errno_location

%define PROT_READ      0x1
%define PROT_WRITE     0x2
%define MAP_PRIVATE    0x02
%define MAP_ANONYMOUS  0x20

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
    push r9

    ;void   *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
    ;rax    mmap(rdi, rsi, rdx, r10, r8, r9)

    inc rax ; len + 1 = '\0' -> for alloc size
    mov rdi, 0
    mov rsi, rax    ; set rsi to return value of ft_strlen
    mov rdx, PROT_READ | PROT_WRITE
    mov r10, MAP_PRIVATE | MAP_ANONYMOUS
    mov r8, -1
    mov r9, 0

    mov rax, 9
    syscall

    cmp rax, 0
    jl alloc_error

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

alloc_error:
    neg rax

    ; save rax in rdx and push to save it before call
    mov rdx, rax
    push rdx
    call __errno_location wrt ..plt   ; return pointer to errno in rax ; wrt ..plt specify a dynamic linkage to call _errno
    pop rdx
    
    mov [rax], rdx  ; set errno to err value
    mov rax, -1
    ret