#|~~~~Volumenes~~~~|#

#|~~~~Volumen cilindro~~~~|#
(defvar *volumencilindro* (lambda (radio altura)  (* pi (* radio radio) altura)))

(defun pedirDatos()
   (princ "Dame el Radio del Cilindro:")
   (setq radio (read))
   (princ "Dame la altura del Cilindro:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumencilindro* radio altura))
)

#|~~~~Volumen cilindro Hueco~~~~|#
(defvar *volumencilindrohueco* (lambda (radio-exterior radio-interior altura)   (* pi altura (- (expt radio-exterior 2) (expt radio-interior 2)))))

(defun pedirDatos()
   (princ "Dame el Radio Exterior:")
   (setq radio-exterior (read))
   (princ "Dame el Radio Interior:")
   (setq radio-interior (read))
   (princ "Dame la altura del cilindro hueco:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumencilindrohueco* radio-exterior radio-interior altura))
)

#|~~~~Volumen Cono~~~~|#
(defvar *volumencono* (lambda (radio altura)   (* (/ 1 3) pi (* (expt radio 2) altura))))

(defun pedirDatos()
   (princ "Dame el radio del Cono:")
   (setq radio (read))
   (princ "Dame la altura del Cono:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumencono*  radio altura))
)

#|~~~~Volumen Cono Truncado~~~~|#
(defvar *volumenconotruncado* (lambda (radio-base-grande radio-base-pequena altura)   (* (/ pi 3) altura (+ (expt radio-base-grande 2) (* radio-base-grande radio-base-pequena) (expt radio-base-pequena 2)))))


(defun pedirDatos()
   (princ "Dame la altura del Cono Truncado:")
   (setq altura (read))
   (princ "Dame el Radio de la base grande del Cono Truncado:")
   (setq radio-base-grande (read))
   (princ "Dame el Radio de la base pequena del Cono Truncado:")
   (setq radio-base-pequena (read))
   
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenconotruncado* radio-base-grande radio-base-pequena altura))
)

#|~~~~Volumen Cubo~~~~|#
(defvar *volumencubo* (lambda (lado) (* lado lado lado)))

(defun pedirDatos()
   (princ "Dame el lado del cuadrado:")
   (setq lado (read))
   (format t "El resultado es ~A unidades cubicas" (funcall *volumencubo* lado))
)

#|~~~~Volumen Esfera~~~~|#
(defvar *volumenesfera* (lambda (radio)   (* (/ 4 3) pi (expt radio 3))))

(defun pedirDatos()
   (princ "Dame el Radio de la Esfera:")
   (setq radio (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenesfera* radio))
)

#|~~~~Volumen Paralelepipedo~~~~|#
(defvar *volumenparalelepipedo* (lambda (area-base altura)   (* area-base altura)))

(defun pedirDatos()
   (princ "Dame el Area de la Base del Paralelepidedo:")
   (setq area-base (read))
   (princ "Dame la Altura del Paralelepipedo:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenparalelepipedo* area-base altura))
)

#|~~~~Volumen PiramideCuadrada~~~~|#
(defvar *volumenpiramidecuadrada* (lambda (lado-base altura)   (/ (* (expt lado-base 2) altura) 3)))

(defun pedirDatos()
   (princ "Dame el lado de la base de la Piramide Cuadrada:")
   (setq lado-base (read))
   (princ "Dame la altura de la Piramide Cuadrada:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenpiramidecuadrada* lado-base altura))
)

#|~~~~Volumen PrismaRectangular~~~~|#
(defvar *volumenprismarectangular* (lambda (area-base altura) (* area-base altura)))

(defun pedirDatos()
   (princ "Dame el area de la base del prisma cuadrangular:")
   (setq area-base (read))
   (princ "Dame la altura del prisma cuadrangular:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenprismarectangular* area-base altura))
)

#|~~~~Volumen Tetraedro~~~~|#
(defvar *volumentetraedro* (lambda (lado)   (/ (* (expt lado 3) (sqrt 2)) 12)))

(defun pedirDatos()
   (princ "Dame el Lado del Tetraedro:")
   (setq lado (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumentetraedro* lado))
)