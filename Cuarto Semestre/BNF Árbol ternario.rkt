#lang eopl

#|
<arbol-t> ::= <simbolo>
                 ::= <numero>
                 ::= <simbolo> <arbol-t>
                       <arbol-t> <arbol-t>
                 ::= <numero> <arbol-t>
                       <arbol-t> <arbol-t>
|#

(define arbol-t? (lambda (arb)
                    (cond
                      [(number? arb)#T]
                      [(symbol? arb)#T]
                      [(null? arb)#F]
                      [(and
                        (symbol? (car arb))
                        (arbol-t? (cadr arb))
                        (arbol-t? (caddr arb))
                        (arbol-t? (cadddr arb)))#T]
                      [(and
                        (number? (car arb))
                        (arbol-t? (cadr arb))
                        (arbol-t? (caddr arb))
                        (arbol-t? (cadddr arb)))#T]
                      [else #F])))

(display (arbol-t? 'x))
(display " ")
(display (arbol-t? 5))
(display " ")
(display (arbol-t? '(x 2 3 y)))
(display " ")
(display (arbol-t? '(5 (4 5 a p)(5 (4 5 6 7) 2 3)9)))
