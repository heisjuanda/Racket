#lang eopl

(define f1 (lambda (lista)
             (cond
               [(null? lista)#T]
               [(and
                 (symbol? (car lista))
                 (f1 (cdr lista)))#T]
               [else #F])))

(display (f1 '()))
(display  "
")
(display (f1 '(2 3 4)))
(display  "
")
(display (f1 '(q w e)))
