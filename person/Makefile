NAME=person
all:$(NAME)
test:run
run:all
	./$(NAME)
$(NAME):$(NAME).hs
	ghc $(NAME).hs
clean:
	- rm -rf *.hi *.o $(NAME)
