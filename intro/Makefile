all:run
clean:
	- rm -rf Introduction.class Introduction.hi Introduction.o Introduction
	- rm -rf java.out haskell.out
run:Introduction.class Introduction
	java Introduction > java.out
	./Introduction    > haskell.out
	diff -s java.out haskell.out
Introduction.class:Introduction.java
	javac Introduction.java
Introduction:Introduction.hs
	ghc Introduction.hs
