; Definir la función para calcular el precio total en función del número de pantalones
(defun calcular-precio (num-pantalones)
  (cond
    ((< num-pantalones 5) (* num-pantalones precio-normal)) ; Precio normal si se compran menos de 5 pantalones
    ((and (>= num-pantalones 5) (< num-pantalones 12)) (* num-pantalones (- 1.0 descuento-15%))) ; Descuento del 15% si se compran 5 o más pero menos de 12 pantalones
    ((>= num-pantalones 12) (* num-pantalones (- 1.0 descuento-30%)))) ; Descuento del 30% si se compran 12 o más pantalones

; Definir precios y descuentos
(defvar precio-normal 100)
(defvar descuento-15% 0.85)
(defvar descuento-30% 0.7)

; Solicitar el número de pantalones al usuario y calcular el total a pagar
(format t "Ingrese el número de pantalones a comprar: ")
(setq num-pantalones (read))
(setq total-a-pagar (calcular-precio num-pantalones))
(format t "Total a pagar: ~a~%" total-a-pagar)