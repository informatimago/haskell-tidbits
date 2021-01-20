
(defun main ()
  (let* ((a (loop :for n :from 2 :to 100 :by 2
                 :collect n))
         (b (subseq a 5)))
    (format t "~(~A~) = {~{~A~^, ~}};~%" 'a a)
    (format t "~(~A~) = {~{~A~^, ~}};~%" 'b b)
    (values)))
