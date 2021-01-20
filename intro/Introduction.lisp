(defun printCommaList (name list)
  (format t "~(~A~) = {~{~A~^, ~}};~%" name list))

(defun main ()
  (let* ((a (loop :for n :from 2 :to 100 :by 2
                 :collect n))
         (b (subseq a 5)))
    (printCommaList 'a a)
    (printCommaList 'b b)
    (values)))
