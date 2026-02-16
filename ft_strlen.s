
section .text
    global ft_strlen

;_ ft_strlen(char * -> rdi)
ft_strlen:
    xor rax, rax ;compare each byte of register and set to 0

loop:
    cmp BYTE [rdi + rax], 0 ;compare one BYTE adress *rdi + rax with 0
    je end                  ;if equal to 0, like char str[2] == '\0 (jump if equal) jump to end label

    inc rax                 ;rax++
    jmp loop                ;jump to the loop label

end:
    ret                     ;return



    

