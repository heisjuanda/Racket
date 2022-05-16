;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |ejercicios 2 estructura|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;defino la estructura punto
(define-struct punto(x y color))

;; definición
(define
(sustitución unpunto csustituir csustituto)
  (cond
    [(equal?(punto-color unpunto) csustituir)
     (make-punto (punto-x unpunto)
                  (punto-y unpunto)
                           csustituto)]
    [else unpunto]))
;; purebas
    (sustitución(make-punto 3 4 'rojo) 'rojo 'azul)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-struct notas(
                     Malo
                     deficiente
                     regular
                     bueno
                     excelente))
(define notas1( make-notas
                "0.0 a 0.2"
                "0.2 a 3.0"
                "3.0 a 3.8"
                "3.8 a 4.5"
                "4.5 a 5.0"))

(cond
(notas-Malo notas1)
(notas-deficiente notas1)
(notas-regular notas1)
(notas-bueno notas1)
(notas-excelente notas1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(define-struct rectangulo(esquina ancho alto))
;(define-struct triangulo( punto1 punto2 punto3))
;(define-struct circulo(centro radio))

(define(distancia x1 x2 y1 y2)
  (sqrt(- (sqr x2 x1)(sqr y2 y1))))

[(triangulo? miFigura)
(/ (* (distancia (triangulo-punto1 miFigura)
(triangulo-punto2 miFigura))
(distancia (triangulo-punto2 miFigura)
(triangulo-punto3 miFigura))) 2)])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   

