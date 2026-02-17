#include <stdio.h>
#include <string.h>
#include <unistd.h>


extern int  ft_strlen(char *str);
extern char *ft_strcpy(char *dest, char *src);
int         ft_strcmp(const char *s1, const char *s2);
size_t      ft_write(int fd, const void *buf, size_t count);

int main() {
    /*  FT_STRLEN   */

    /*  FT_STRCPY   */
    char    dest[256];
    char    ft_dest[256];
    char    *src = "test";

    ft_strcpy(ft_dest, src);
    printf("%s\n", ft_dest);

    strcpy(dest, src);
    printf("%s\n", dest);

    /*  FT_STRCMP   */
    char    *s1 = "tatat";
    char    *s2 = "tata";

    printf("cmp : s1 = %s, s2 = %s\n", s1, s2);
    printf("strcmp = %d\n", strcmp(s1, s2));
    printf("ft_strcmp = %d\n", ft_strcmp(s1, s2));

    /*  FT_WRITE    */
    ft_write(1, "", 4);
    
}