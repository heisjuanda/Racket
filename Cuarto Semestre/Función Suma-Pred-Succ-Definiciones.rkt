#lang eopl

;;Función suma

(define zero? null?)
(define zero '())
(define base 16) 
(define succ (lambda (n)              
               (cond
                 [(zero? n) (list 1)]
                 [(= (car n) (- base 1)) (cons 0(succ(cdr n)))]
                 [else (cons (+ 1 (car n)) (cdr n))])))
(define pred (lambda (n)
               (cond
                 [(zero? n)(eopl:error"")]
                 [(= (car n) 0)(cons (- base 1)(pred(cdr n)))]
                 [(equal? (succ zero) n) '()]
                 [else (cons (- (car n)1)(cdr n))])))
(define plus (lambda (x y)
               (cond
                 [(zero? y)x]
                 [else (succ (plus x (pred y)))])))

(display (succ '(15)))

(display (pred '(15 15 15)))
(display (plus '(2)'(2)))
