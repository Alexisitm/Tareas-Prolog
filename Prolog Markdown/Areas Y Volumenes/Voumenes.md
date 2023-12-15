# Tarea sobre Volumenes 

Lisp, un lenguaje de programación funcional, se extiende más allá del cálculo de áreas y se revela como una herramienta poderosa para el manejo de volúmenes en figuras geométricas tridimensionales. En el ámbito de la geometría espacial, Lisp ofrece una solución eficiente gracias a su enfoque en la manipulación simbólica y la representación clara de datos.

## ¿Por qué Lisp?

Lisp es especialmente adecuado para abordar problemas matemáticos tridimensionales, como el cálculo de volúmenes. Su capacidad para manejar expresiones simbólicas y estructuras de datos complejas lo convierte en una elección idónea para enfrentar desafíos geométricos más avanzados.

# Volumen cilindro
```lisp
(defvar *volumencilindro* (lambda (radio altura)  (* pi (* radio radio) altura)))
```

```lisp
(defun pedirDatos()
   (princ "Dame el Radio del Cilindro:")
   (setq radio (read))
   (princ "Dame la altura del Cilindro:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumencilindro* radio altura))
)
```
# Volumen cilindro Hueco
```lisp
(defvar *volumencilindrohueco* (lambda (radio-exterior radio-interior altura)   (* pi altura (- (expt radio-exterior 2) (expt radio-interior 2)))))
```
```lisp
(defun pedirDatos()
   (princ "Dame el Radio Exterior:")
   (setq radio-exterior (read))
   (princ "Dame el Radio Interior:")
   (setq radio-interior (read))
   (princ "Dame la altura del cilindro hueco:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumencilindrohueco* radio-exterior radio-interior altura))
)
```
# Volumen Cono
```lisp
(defvar *volumencono* (lambda (radio altura)   (* (/ 1 3) pi (* (expt radio 2) altura))))
```

```lisp
(defun pedirDatos()
   (princ "Dame el radio del Cono:")
   (setq radio (read))
   (princ "Dame la altura del Cono:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumencono*  radio altura))
)
```

# Volumen Cono Truncado
```lisp
(defvar *volumenconotruncado* (lambda (radio-base-grande radio-base-pequena altura)   (* (/ pi 3) altura (+ (expt radio-base-grande 2) (* radio-base-grande radio-base-pequena) (expt radio-base-pequena 2)))))
```
```lisp
(defun pedirDatos()
   (princ "Dame la altura del Cono Truncado:")
   (setq altura (read))
   (princ "Dame el Radio de la base grande del Cono Truncado:")
   (setq radio-base-grande (read))
   (princ "Dame el Radio de la base pequena del Cono Truncado:")
   (setq radio-base-pequena (read))
   
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenconotruncado* radio-base-grande radio-base-pequena altura))
)
```

# Volumen Cubo
```lisp
(defvar *volumencubo* (lambda (lado) (* lado lado lado)))
```

```lisp
(defun pedirDatos()
   (princ "Dame el lado del cuadrado:")
   (setq lado (read))
   (format t "El resultado es ~A unidades cubicas" (funcall *volumencubo* lado))
)
```

# Volumen Esfera
```lisp
(defvar *volumenesfera* (lambda (radio)   (* (/ 4 3) pi (expt radio 3))))
```
```lisp
(defun pedirDatos()
   (princ "Dame el Radio de la Esfera:")
   (setq radio (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenesfera* radio))
)
```

# Volumen Paralelepipedo
```lisp
(defvar *volumenparalelepipedo* (lambda (area-base altura)   (* area-base altura)))
```

```lisp
(defun pedirDatos()
   (princ "Dame el Area de la Base del Paralelepidedo:")
   (setq area-base (read))
   (princ "Dame la Altura del Paralelepipedo:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenparalelepipedo* area-base altura))
)
```

# Volumen Piramide Cuadrada
```lisp
(defvar *volumenpiramidecuadrada* (lambda (lado-base altura)   (/ (* (expt lado-base 2) altura) 3)))
```
```lisp
(defun pedirDatos()
   (princ "Dame el lado de la base de la Piramide Cuadrada:")
   (setq lado-base (read))
   (princ "Dame la altura de la Piramide Cuadrada:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenpiramidecuadrada* lado-base altura))
)
```

# Volumen Prisma Rectangular
```lisp
(defvar *volumenprismarectangular* (lambda (area-base altura) (* area-base altura)))
```
```lisp
(defun pedirDatos()
   (princ "Dame el area de la base del prisma cuadrangular:")
   (setq area-base (read))
   (princ "Dame la altura del prisma cuadrangular:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenprismarectangular* area-base altura))
)
```
# Volumen Tetraedro
```lisp
(defvar *volumentetraedro* (lambda (lado)   (/ (* (expt lado 3) (sqrt 2)) 12)))
```
```lisp
(defun pedirDatos()
   (princ "Dame el Lado del Tetraedro:")
   (setq lado (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumentetraedro* lado))
)
```