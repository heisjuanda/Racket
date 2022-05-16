#lang eopl
(define l (lambda (arb)
            (cond
              [(null? arb)#F]
              [(number? arb)#T]
              [(and
                (symbol? (car arb))(l (cadr arb))(l (caddr arb)))]
              [else #F])))

(display (l '(x (h 5 3) (t(s 10 11)12))))
(display "\n")
(display (l '(2 (h 5 3) (t(s 10 11)12))))

