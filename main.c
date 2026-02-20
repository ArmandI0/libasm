#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>


extern int  ft_strlen(char *str);
extern char *ft_strcpy(char *dest, char *src);
int         ft_strcmp(const char *s1, const char *s2);
size_t      ft_write(int fd, const void *buf, size_t count);
size_t      ft_read(int fd, void *buf, size_t count);
char        *ft_strdup(const char *s);


int main() {
    /*  FT_STRLEN   */
    printf("\n**********    TEST FT_STRLEN   **********\n\n");

    char *test_str = "123456789";
    printf("size ft_strlen = %d\n", ft_strlen(test_str));

    printf("\n****************************************\n\n");

    /*  FT_STRCPY   */
    printf("\n**********    TEST FT_STRCPY   **********\n\n");

    char    dest[256];
    char    ft_dest[256];
    char    *src = "test";

    ft_strcpy(ft_dest, src);
    printf("%s\n", ft_dest);

    strcpy(dest, src);
    printf("%s\n", dest);
    printf("\n****************************************\n\n");




    /*  FT_STRCMP   */
    printf("\n**********    TEST FT_STRCMP   **********\n\n");

    char    *s1 = "tatat";
    char    *s2 = "tata";

    printf("cmp : s1 = %s, s2 = %s\n", s1, s2);
    printf("strcmp = %d\n", strcmp(s1, s2));
    printf("ft_strcmp = %d\n", ft_strcmp(s1, s2));
    printf("\n****************************************\n\n");


    /*  FT_WRITE    */
    printf("\n**********    TEST FT_WRITE   **********\n\n");

    int     fd_write = 1;
    char    *buffer_write = "La chaine à envoyer\n";
    size_t  count_write = 21;

    printf("\nret ft_write : %ld\n", ft_write(fd_write, buffer_write, count_write));
    perror("ft_write ");
    printf("\nret write    : %ld\n", write(fd_write, buffer_write, count_write));
    perror("write : ");
    printf("\n****************************************\n\n");


    /*  FT_READ     */
    printf("\n**********    TEST FT_READ    **********\n\n");

    int     fd_read = 0;
    char    buffer_read[256];
    size_t  count_read = 10;

    printf("\nret ft_read : %ld\n", ft_read(fd_read, buffer_read, count_read));
    perror("ft_read ");
    printf("\nret read    : %ld\n", read(fd_read, buffer_read, count_read));
    perror("read : ");
    printf("\n****************************************\n\n");


    /*  FT_STRDUP   */
    printf("\n*********    TEST FT_STRDUP    *********\n\n");
    char *test = "TEST FT_STRDUP\n";
    char *test2 = "";
    char *result = ft_strdup(test);
    printf("ft_strdup %s", result);

    char *result_original = strdup(test);
    printf("strdup %s", result_original);

    free(result);
    free(result_original);

    printf("\n****************************************\n\n");

}
