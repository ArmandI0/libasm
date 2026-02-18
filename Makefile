NAME        = libasm.a
SRC         = ft_strcpy.s	\
              ft_strlen.s	\
			  ft_strcmp.s	\
			  ft_write.s	\
			  ft_read.s		\
			  ft_strdup.s		\

OBJ         = $(SRC:.s=.o)

NASM        = nasm
NASM_FLAGS  = -felf64 -g
AR          = ar rcs 

all: $(NAME)

%.o: %.s
	$(NASM) $(NASM_FLAGS) $< -o $@

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re