;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Condicionales) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Condicionales:
(> 4 5)
(< 4 5)
(= 3 3)
(= 2 4)
(<= 3 5)

;;(and(> x 5)(< x 10))
(display "Función AND ")
  (and(> 4  5)(< 4 10))

;;(or(>= x 60)(< y 30))
(display "FUNCIÓN O ")
(or(>= 61 60)(< 20 30))

;;(and(>= x 60)(< y 50))
(display "Función AND ")
(and(>= 30 60)(< 20 50))

;;(or(>= x 60)(< y 50))
(display "FUNCIÓN O ")
(or(>= 4 60)(< 0 50))

;;(not(= x 3)
(display "Negación ")
(not(= 3 3))

