PGMS=quantum

HASKELL=ghc
all::$(PGMS)
clean::
	-rm -f $(PGMS) *.o *.hi *.[dl]x{32,64}fsl

quantum:quantum.hs
	$(HASKELL) $^
