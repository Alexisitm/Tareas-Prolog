(format t "Ingrese el nombre del solicitante: ")
(setq nombre (read))
(format t "Ingrese la historia crediticia ('b' buena o 'm' mala): ")
(setq historia-crediticia (read))
(format t "Ingrese la cantidad pedida: ")
(setq cantidad-pedida (read))
(format t "Ingrese el salario anual: ")
(setq salario-anual (read))
(format t "Ingrese el valor de otras propiedades: ")
(setq valor-propiedades (read))


(cond
  ((and (equal historia-crediticia 'b) (> (calcular-puntos salario-anual cantidad-pedida valor-propiedades) 6))
   (format t "El solicitante ~a es elegible para el préstamo.~%" nombre))
  (t (format t "El solicitante ~a no es elegible para el préstamo.~%" nombre)))



(defun calcular-puntos (salario cantidad-propiedades valor-propiedades)
  (+
   (cond
     ((>= salario (* 0.5 cantidad-propiedades)) 5)
     ((and (>= salario (* 0.25 cantidad-propiedades)) (< salario (* 0.5 cantidad-propiedades))) 3)
     ((and (>= salario (* 0.1 cantidad-propiedades)) (< salario (* 0.25 cantidad-propiedades))) 1)
     (t 0))
   (cond
     ((>= valor-propiedades (* 2 cantidad-propiedades)) 5)
     ((and (= valor-propiedades (* 2 cantidad-propiedades)) (< valor-propiedades (* 2 cantidad-propiedades))) 3)
     (t 0))))