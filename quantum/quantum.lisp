(deftype quantum () `(member yes no both))

(defmacro generate-quantum-convert-functions ()
  `(progn
     ,@(loop
          :for i :below 8
          :for name := (intern (format nil "CONVERT~A" i))
          :collect `(defun ,name (quantum)
                      (ecase quantum
                        ,@(loop :for bit :from 0
                             :for q :in '(yes no both)
                             :collect (list q (plusp (logand i (ash 1 bit))))))))))

(generate-quantum-convert-functions)




(defun combine (&rest args)
  "
RETURN:  (elt args 0) x (elt args 1) x ... x (elt args (1- (length args)))
         = the set of tuples built taking one item in order from each list
           in args.
EXAMPLE: (COMBINE '(WWW FTP) '(EXA) '(COM ORG)))
           --> ((WWW EXA COM) (WWW EXA ORG) (FTP EXA COM) (FTP EXA ORG))
"
  (cond
    ((null args)        '(()))

    ;; Don't consider empty set for one of the arguments since the combination
    ;; should produce the empty set:
    ;; {} x {1,2} = {}
    ;; Instead, let it fall to the default case, considering it as the symbol NIL.
    ;; ((null  (car args)) (apply (function combine) (cdr args)))

    ((consp (car args)) (mapcan (lambda (item)
                                  (apply (function combine) item (cdr args)))
                                (car args)))
    (t                  (mapcan (lambda (rest) (list (cons (car args) rest)))
                                (apply (function combine) (cdr args))))))

(defun max-column-width (table)
  (apply (function mapcar)
         (lambda (&rest row)
           (reduce (function max) row
                   :key (function length)
                   :initial-value 0))
         table))




(defun truth-table (values actions)
  (let* ((v-titles    (mapcar (function first)  values))
         (v-values    (mapcar (function second) values))
         (a-titles    (mapcar (function first)  actions))
         (a-functions (mapcar (function second) actions))
         (rows        (apply (function combine) v-values))
         (table       (cons (append v-titles a-titles)
                            (mapcar (lambda (row)
                                      (append (mapcar (function prin1-to-string)
                                                      row)
                                              (mapcar (lambda (fun) (prin1-to-string (apply fun row)))
                                                      a-functions)))
                                    rows)))
         (widths      (max-column-width table))
         (formatted   (mapcar (lambda (row)
                                (format nil "|~{ ~A ~^|~}|"
                                        (mapcar (lambda (width column)
                                                  (format nil "~VA" width column))
                                                widths row)))
                              table))
         (underlined  (list* (first formatted)
                             (format nil "|~{~A~^|~}|"
                                     (mapcar (lambda (width) (make-string (+ 2 width) :initial-element #\-)) widths))
                             (rest formatted))))
    underlined))


(defun main () 
  (mapc (function write-line)
        (truth-table '(("A" (t nil)))
                     (list (list "identity" (function identity)))))
  (terpri)
  (mapc (function write-line)
        (truth-table '(("A" (t nil)) ("B" (t nil)))
                     (list (list "¬A"  (lambda (a b) (declare (ignore b)) (not a)))
                           (list "A∨B" (lambda (a b) (or a b)))
                           (list "A∧B" (lambda (a b) (and a b))))))
  (terpri)
  (mapc (function write-line)
        (truth-table '(("Quantum" (Yes No Both)))
                     (mapcar (lambda (fun) (list (symbol-name fun) (symbol-function fun)))
                             '(convert0 convert1 convert2 convert3
                               convert4 convert5 convert6 convert7))))
  (terpri)
  (values))

#|
cl-user> (main)
| A   | identity |
|-----|----------|
| t   | t        |
| nil | nil      |

| A   | B   | ¬A  | A∨B | A∧B |
|-----|-----|-----|-----|-----|
| t   | t   | nil | t   | t   |
| t   | nil | nil | t   | nil |
| nil | t   | t   | t   | nil |
| nil | nil | t   | nil | nil |

| Quantum | CONVERT0 | CONVERT1 | CONVERT2 | CONVERT3 | CONVERT4 | CONVERT5 | CONVERT6 | CONVERT7 |
|---------|----------|----------|----------|----------|----------|----------|----------|----------|
| yes     | nil      | t        | nil      | t        | nil      | t        | nil      | t        |
| no      | nil      | nil      | t        | t        | nil      | nil      | t        | t        |
| both    | nil      | nil      | nil      | nil      | t        | t        | t        | t        |

|#
