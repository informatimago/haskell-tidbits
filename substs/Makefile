PGMS=substs

HASKELL=ghc
LINE=// ---------------------------------------------------------------------
all:$(PGMS)
test:run
run:all
	@for pgm in $(PGMS) ; do echo $(LINE) ; ./$$pgm ; done ; echo $(LINE)
clean:
	-rm -f $(PGMS) *.o *.hi
substs:substs.hs
	$(HASKELL) $^
