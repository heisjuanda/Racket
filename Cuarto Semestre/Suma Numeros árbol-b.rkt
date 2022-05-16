#lang eopl

(define suma-arbol-b (lambda (arb)
                  (cond
                    [(null? arb)0]
                    [(number? arb)arb]
                    [(symbol? arb)0]
                    [(+ (suma-arbol-b (car arb))(suma-arbol-b (cadr arb))(suma-arbol-b (caddr arb)))] )))
                    ;;[(and (number? (car arb))(arbol-b(cadr arb)) (arbol-b(caddr arb)))]
                    ;;[(and (symbol? (car arb))(arbol-b(cadr arb)) (arbol-b(caddr arb)))])))

(display (suma-arbol-b '(1 (t 1 2) (4 2 1))))