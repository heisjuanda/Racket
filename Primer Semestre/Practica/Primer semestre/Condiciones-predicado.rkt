;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Condiciones-predicado) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Predicados
(display"SI ES UN NÚMERO ") 
(number? 2)
(display"SI ES IMPAR ")
(odd? 3)
(display"SI ES PAR ")
(even? 10)

;;funciones
(define(es-menor? edad)
  (< edad 18))
(es-menor? 12)
(es-menor? 22)

;;(and(> num primero)(< num segundo))
(and( > 2 1)(< 2 6))


(define(entre? primero segundo num)
  (and(> num primero)(< num segundo)))
(entre? 1 6 2)
(entre? 1 2 2)

(define(impar? x)
  (odd? x))
(impar? 3)

(define(par? y)
  (even? y))
(par? 10)

(define(imparq? x y)
  (and(odd? y)
      (= 0 (remainder x y))))
(imparq? 9 3)

;;COND
(define(precio-unidad cantidad)
  (cond
    [(< cantidad 3)250000]
    [(and(>= cantidad 3)(< cantidad 10))220000]
    [(>= cantidad 10)200000]
     [else 200000]))
(precio-unidad 6)

(=(precio-unidad 2) 250000)
  