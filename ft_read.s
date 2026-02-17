extern __errno_location

section .text
    global ft_read

ft_read:
    mov rax, 0
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
    call __errno_location wrt ..plt   ; return pointer to errno in rax ; wrt ..plt specify a dynamic linkage to call _errno
    pop rdx
    
    mov [rax], rdx
    mov rax, -1
    ret
