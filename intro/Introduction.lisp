(defparameter *comma-list-format-control-string*
  "~(~A~) = {~{~A~^, ~}};~%")

(defun comma-list-formatter (*standard-output* name list &rest tail)
  (princ (string-downcase name))
  (let ((separator " = {"))
    (dolist (item list)
      (princ separator)
      (setf separator ", ")
      (prin1 item)))
  (princ "};")
  (terpri)
  tail)

(defun print-comma-list (name list)
  (format t
          #+with-format-dsl *comma-list-format-control-string*
          #-with-format-dsl (function comma-list-formatter)
          name list))

(defun main ()
  (let* ((a (loop :for n :from 2 :to 100 :by 2
                 :collect n))
         (b (subseq a 5)))
    (print-comma-list 'a a)
    (print-comma-list 'b b)
    (values)))
