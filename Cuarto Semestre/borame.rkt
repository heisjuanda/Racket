#lang eopl


;;<arbol-b> ::= <empty>
;;          ::= <int>
;;          ::= <int> <arbol-b> <arbol-b>
;;          ::= <symbol> <arbol-b><arbol>

(define arbol-b (lambda (arb)
                  (cond
                    [(null? arb)#T]
                    [(number? arb)#T]
                    [(and (number? (car arb))(arbol-b(cadr arb)) (arbol-b(caddr arb)))#T]
                    [(and (symbol? (car arb))(arbol-b(cadr arb)) (arbol-b(caddr arb)))#T])))

(define suma-arbol-b (lambda (arb)
                  (cond
                    [(null? arb)0]
                    [(number? arb)arb]
                    [(symbol? arb)0]
                    [(+ (suma-arbol-b (car arb))(suma-arbol-b (cadr arb))(suma-arbol-b (caddr arb)))] )))
                    ;;[(and (number? (car arb))(arbol-b(cadr arb)) (arbol-b(caddr arb)))]
                    ;;[(and (symbol? (car arb))(arbol-b(cadr arb)) (arbol-b(caddr arb)))])))


(define arbol-empty (lambda ()
                     '()))

(define arbol-leaf (lambda (arb)
                     '(arbol-leaf)))

(define arbol-intR&L (lambda (arb)
                       (or ('arbol-intR) ('arbol-intL))))

;;(define arbol-intR (lambda (arb)
;;                       'arbol-intR))

(define arbol-symbolR&L (lambda (arb)
                       (or '(arbol-symbolR)'(arbol-symbolL))))

(define arbol-empty? (lambda (arb)
                       (cond
                         [(equal? (car arb) '())]
                         [else #F])))

(define arbol-leaf? (lambda (arb)
                       (cond
                         [(equal? (car arb) 'arbol-leaf)]
                         [else #F])))

(define arbol-intR&L? (lambda (arb)
                       (cond
                         [(equal? (car arb) (or ('arbol-intR) ('arbol-intL)))]
                         [else #F])))

(define arbol-symbolR&L? (lambda (arb)
                       (cond
                         [(equal? (car arb) (or ('arbol-symbolR) ('arbol-symbolL)))]
                         [else #F])))
