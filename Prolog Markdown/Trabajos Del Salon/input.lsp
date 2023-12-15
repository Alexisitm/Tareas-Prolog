(format t "Ingrese una letra minúscula: ")
(setq letra (read))

(case letra
  ((#\a #\e #\i #\o #\u) (format t "La letra ~c es una vocal.~%" letra))
  (#\y (format t "La letra ~c es una semivocal.~%" letra))
  (t (format t "La letra ~c es una consonante.~%" letra)))
