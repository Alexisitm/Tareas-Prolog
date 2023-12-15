(format t "Ingrese un año: ")
(setq año (read))

(if (or (and (divisible-p año 4) (not (divisible-p año 100))) (divisible-p año 400))
    (format t "El año ~a es bisiesto.~%" año)
    (format t "El año ~a no es bisiesto.~%" año))

(defun divisible-p (num divisor)
  (= (mod num divisor) 0))