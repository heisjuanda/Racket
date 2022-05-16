;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Practica2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Clase 5
(define (ejemplo x)
  (cond
[(symbol=? x 'GoodMorning) 'Hi]
[(symbol=? x 'HowAreYou?) 'Fine]
[(symbol=? x 'GoodAfternoon) 'INeedANap]
[(symbol=? x 'GoodEvening) 'BoyAmITired]))
;Prueba
(ejemplo 'HowAreYou?)

;;ejemplo 2
(define (check numero1 numero2)
  (cond
    ((= numero1 numero2) 'Perfect)
    ((< numero1 numero2) 'TooSmall)
    ((> numero1 numero2) 'TooLarge)))
(check 1 2)
(check 1 1)
(check 4 1)

;;ejemplo 3
;;AUXILIAR
(define(cuadrática x)
  (sqr x))
(cuadrática 3)

;;(define lo(make-posn 3 5))
;;  (posn-y lo)

(define(distancia d1 d2)
  (sqrt(+(cuadrática(-(posn-x d1)(posn-x d1)))
          (cuadrática(-(posn-y d2)(posn-y d2))))))

;;estructura crear
(define-struct edificio
  (nombre
   año estado))
(define edificio1(make-edificio 'el-alto
                                '2000
                                'melo))
(edificio-estado edificio1)
             