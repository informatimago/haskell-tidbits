all:run
clean:
	- rm -rf Introduction.class Introduction.hi Introduction.o Introduction
run:Introduction.class Introduction
	java Introduction
	./Introduction
Introduction.class:Introduction.java

Introduction:Introduction.hs
	ghc Introduction.hs
