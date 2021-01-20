(defun print-comma-list (name list)
  (format t "~(~A~) = {~{~A~^, ~}};~%" name list))

(defun main ()
  (let* ((a (loop :for n :from 2 :to 100 :by 2
                 :collect n))
         (b (subseq a 5)))
    (print-comma-list 'a a)
    (print-comma-list 'b b)
    (values)))
