#lang eopl

;;Lista de números pares
(define in-s1?
  (lambda (l)
  (cond
    [(null? l)#T]
    [(and
      (in-s1? (cdr l))
      (in-s2? (car l))
      )#T]
    [else #F])
    ))

;;Número pares
(define in-s2?
  (lambda (x)
    (cond
      [(= x 2)#T]
      [(> x 2) (in-s2? (- x 2))]
      [else #F])))

(define listaA '(2 4 2 10))
(define listaB '(3 4 5 70))

(display (in-s2? listaA))