all:run
test:run
clean:
	- rm -rf Introduction.class Introduction.hi Introduction.o Introduction
	- rm -rf java.out haskell.out lisp.out
	- rm -rf \#*\# *~
run:java.out haskell.out lisp.out
	diff -s java.out haskell.out
	diff -s lisp.out haskell.out
java.out:Introduction.class
	java Introduction > java.out
haskell.out: Introduction
	./Introduction    > haskell.out
lisp.out:Introduction.lisp
	ccl --batch --no-init --load Introduction.lisp --eval '(main)' --eval '(ccl:quit)' > lisp.out
Introduction.class:Introduction.java
	javac Introduction.java
Introduction:Introduction.hs
	ghc Introduction.hs
