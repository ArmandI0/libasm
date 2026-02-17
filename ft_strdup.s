extern ft_strlen

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
    je end

    push rdi    ; save char *s
    mov r9, rax
    push r9
    ; esle
    ;void   *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
    ;rax    mmap(rdi, rsi, rdx, r10, r8, r9)
    inc rax ; len + 1 = '\0'

    mov rdi, 0
    mov rsi, rax    ; set rsi to return value of ft_strlen
    mov rdx, PROT_READ | PROT_WRITE
    mov r10, MAP_PRIVATE | MAP_ANONYMOUS
    mov r8, -1
    mov r9, 0

    mov rax, 9
    syscall

    pop r9
    pop rdi     ; get char *s

loop:
    xor rcx, rcx ; counter -> set rcx = 0

    ; rax[rcx] = rdi[rcx] 
    mov dh, byte[rdi + rcx]
    mov byte[rax + rcx], dh

    inc rcx

    cmp rcx, r9 ; rcx == len s
    je end

    jmp loop

end:
    mov byte[rax + rcx], 0
    ret