#include <stdio.h>

extern int  ft_strlen(char *str);
extern char *ft_strcpy(char *dest, char *src);

// int main() {
//     int a = ft_strlen("toto");
//     printf("result : %d\n", a);
//     return 0;
// }

int main() {
    char dest[256];
    char *src = "test";

    ft_strcpy(dest, src);
    printf("%s\n", dest);
}