PGMS=quantum-haskell quantum-lisp

HASKELL=ghc
LINE=------------------------------------------------------------------------
all::$(PGMS)
	@for pgm in $(PGMS) ; do echo $(LINE) ; ./$$pgm ; done ; echo $(LINE)

clean::
	-rm -f $(PGMS) *.o *.hi *.[dl]x{32,64}fsl

quantum-haskell:quantum.hs
	$(HASKELL) $^

quantum-lisp:quantum.lisp
	@ccl --no-init \
		--eval '(load "'$^'")' \
		--eval '(defun argv () ccl:*command-line-argument-list*)' \
		--eval '(defun make-toplevel-function () (let ((form `(lambda () (flet ((flush () (mapc (function finish-output) (list *standard-output* *trace-output* *error-output* )))) (handler-case (apply (function main) (argv)) (error (err) (flush) (format *error-output* "~%~A~%" err) (flush) (ccl:quit 1))) (flush) (ccl:quit 0))))) (coerce form (quote function))))' \
		--eval '(ccl::save-application "'$@'" :toplevel-function (make-toplevel-function) :init-file nil :mode #o755 :prepend-kernel t :error-handler t)'
