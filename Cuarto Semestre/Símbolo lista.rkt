#lang eopl

(define f1 (lambda (lista1)
(cond
[(list? lista1) (cond
                  [(null? lista1) #T]
                  [(and 
                  (symbol? (f2 (car lista1))) 
                  (f1 (cdr lista1))
                  ) #T]
                  [else #F])]
[else #F])))

(define f2 (lambda (x)
(cond
[(number? x)#F]
[(symbol? x)#T]
[else #F])))


;;(define f2 (lambda (lista2)
;;(cond 
;;[()])))
(display "lista a ")
(define listaA '(1 2 3))
(display (f1 listaA))
(define listaB '( "q" w r t))
(display "\n")
(display (f1 listaB))
(define listaC '())
(display "\n")
(display (f1 listaC))