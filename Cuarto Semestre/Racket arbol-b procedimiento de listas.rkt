#lang eopl
#|

<arbol-b> ::= <empty>
          ::= <int>
          ::= <int> <arbol-b> <arbol-b>
          ::= <symbol> <arbol-b><arbol>

Las producciones se llaman así en el orden de presentación

(arbol-empty)
(arbol-leaf key)
(arbol-int key left right)
(arbol-symbol key left right)
Realizar la consturctores y observadores en listas y procedimientos.


Así mismo realizar la función (sumar-numeros) que retorna la suma de los números dentro del arbol.

|#

;;constructores
(define arbol-empty '())

(define arbol-leaf (lambda (n)
                     n))
(define arbol-int (lambda (key left right)
                    (list key left right)))

(define arbol-symbol (lambda (key left right)
                    (list key left right)))

;;validadores
(define arbol-empty? (lambda(arb)
  (cond
    [(equal? '() arb)#T]
    [else #F])))

(define arbol-leaf? (lambda (arb)
                      (cond
                        [(number? arb)#T]
                        [else #F])))

(define arbol-int? (lambda (arb)
                     (cond
                       [(number? (car arb))]
                       [else #F])))

(define arbol-symbol? (lambda (arb)
                     (cond
                       [(symbol? (car arb))#T]
                       [else #F])))

;;extractores
(define arbol->key (lambda (arb)
                         (car arb)))

(define arbol->left (lambda (arb)
                         (cadr arb)))

(define arbol->right (lambda (arb)
                         (caddr arb)))

;;procedimientos
(define sumador (lambda (arb)
                  (cond
                    [(arbol-empty? arb)0]
                    [(arbol-leaf? arb)arb]
                    [(arbol-int? arb)(+ (arbol->key arb) (sumador(arbol->left arb)) (sumador(arbol->right arb)))]
                    [(arbol-symbol? arb)(+ (sumador(arbol->left arb)) (sumador (arbol->right arb)))])))

;;area del programador
(define arbol1 arbol-empty)
(define arbol2 (arbol-leaf 5))
(define arbol3 (arbol-int 1 (arbol-leaf 2) (arbol-leaf 3)))
(define arbol4 (arbol-int 1 (arbol-int 2 (arbol-leaf 5) (arbol-symbol 'x arbol-empty arbol-empty ) ) (arbol-leaf 3)))

(display (sumador arbol1))
(display "
")
(display (sumador arbol2))
(display "
")
(display (sumador arbol3))
(display "
")
(display (sumador arbol4))
