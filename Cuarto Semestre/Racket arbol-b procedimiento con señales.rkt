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
(define arbol-empty (lambda ()
                      (lambda (signal)
                        (cond
                          [(= signal 0) '()]
                          [else eopl:error"señal no válida"]))))

(define arbol-leaf (lambda (n)
                     (lambda (signal)
                       (cond
                         [(= signal 1)n]
                         [else eopl:error"señal no válida"]))))

(define arbol-int (lambda (key left right)
                    (lambda (signal)
                      (cond
                        [(= signal 2)key]
                        [(= signal 3)left]
                        [(= signal 4)right]
                        [else eopl:error"señal no válida"]))))
                    

(define arbol-symbol (lambda (key left right)
                    (lambda (signal)
                      (cond
                        [(= signal 2)key]
                        [(= signal 3)left]
                        [(= signal 4)right]
                        [else eopl:error"señal no válida"]))))

;;validadores
(define arbol-empty?
  (lambda(arb)
   (equal? (arb 0)'()))) 

(define arbol-leaf? (lambda (arb)
                      (cond
                        [(equal? (arb 1))#T]
                        [else #F])))

(define arbol-int? (lambda (arb)
                     (cond
                       [(equal? (car arb 2))]
                       [else #F])))

(define arbol-symbol? (lambda (arb)
                     (cond
                       [(equal? (symbol?(car arb 2)))#T]
                       [else #F])))

;;extractores
(define arbol->key (lambda (arb)
                         (arb 2)))

(define arbol->left (lambda (arb)
                         (arb 3)))

(define arbol->right (lambda (arb)
                         (arb 4)))

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