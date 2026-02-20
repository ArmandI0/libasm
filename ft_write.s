extern __errno_location

section .text
    global ft_write

; ft_write(int fd, const void *buf, size_t count);
; ft_write(rdi, rsi, rdx)

ft_write:
    mov rax, 1
    syscall

    ; if rax < 0 go to error
    cmp rax, 0
    jl error    ; jl : jump if less

    ; else
    ret

error:
    neg rax

    ; save rax in rdx and push to save it before call
    mov rdx, rax
    push rdx

    push r12                ; Preserve S12
    mov r12, rsp            ; Save the stack pointer
    and rsp, -16            ; Align rsp before call libc

    call __errno_location wrt ..plt   ; return pointer to errno in rax ; wrt ..plt specify a dynamic linkage to call _errno
    
    mov rsp, r12            ; Restore rsp after call
    pop r12

    pop rdx
    
    mov dword [rax], edx  ; set errno to err value
    mov rax, -1
    ret

    


