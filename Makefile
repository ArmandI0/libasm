NAME        = test
LIB_NAME	= libasm.a
SRC         = ft_strlen.s
OBJ         = $(SRC:.s=.o)

NASM        = nasm
NASM_FLAGS  = -felf64
AR          = ar rcs 

all: $(NAME)

$(OBJ): $(SRC)
	$(NASM) $(NASM_FLAGS) $(SRC) -o $(OBJ)

$(NAME): $(OBJ)
	$(AR) $(LIB_NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

