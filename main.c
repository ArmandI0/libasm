#include <stdio.h>

extern int ft_strlen(char *str);

int main() {
    int a = ft_strlen("toto");
    printf("result : %d\n", a);
    return 0;
}