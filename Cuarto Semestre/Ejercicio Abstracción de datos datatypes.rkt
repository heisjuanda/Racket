#lang eopl

;<arbol-b> ::=(arbol-empty) <empty>
;      ::= (arbol-leaf)<int>
;      ::= (arbol-int key left right)<int> <arbol-b> <arbol-b>
;      ::= (arbol-symbol key left right)<symbol> <arbol-b><arbol>

;;Realizar la función (sumar-numeros) que retorna la suma de los números dentro del arbol.


;;Creando el datatype
(define-datatype arbol-b arbol-b?
  (arbol-empty)
  (arbol-leaf (num number?))
  (arbol-int (key number?)
             (left arbol-b?)
             (reight arbol-b?))
  (arbol-symbol (key symbol?)
                (left arbol-b?)
                (right arbol-b?)))

(define suma (lambda (arb)
               (cases arbol-b arb
                 (arbol-empty () 0)
                 (arbol-leaf (num)num)
                 (arbol-int (key left right) (+ key (suma left)(suma right)))
                 (arbol-symbol (key left right) (+ (suma left)(suma right))))))

;;crear árboles
(define arbol1 (arbol-empty))
(define arbol2 (arbol-leaf 5))
(define arbol3 (arbol-int 4 (arbol-leaf 5)(arbol-leaf 6)))
(define arbol4 (arbol-symbol 'k (arbol-leaf 5)(arbol-leaf 6)))
(define arbol5 (arbol-symbol 'p (arbol-int 6(arbol-leaf 5)(arbol-leaf 6)) (arbol-symbol 'j (arbol-leaf 4)(arbol-leaf 10))))

(define arbol1C '(arbol-empty))
(define arbol2C '(arbol-leaf 5))
(define arbol3C '(arbol-int 4 (arbol-leaf 5)(arbol-leaf 6)))
(define arbol4C '(arbol-symbol k (arbol-leaf 5)(arbol-leaf 6)))
(define arbol5C '(arbol-symbol p (arbol-int 6(arbol-leaf 5)(arbol-leaf 6)) (arbol-symbol j (arbol-leaf 4)(arbol-leaf 10))))

;;Parseando al niño
(define parse (lambda(_x)
                (cond
                  [(equal? (car _x) 'arbol-empty) arbol-empty]
                  [(equal? 'arbol-leaf (car _x))
                   (arbol-leaf(cadr _x))]
                  [(equal? (car _x) 'arbol-int)
                   (arbol-int (cadr _x)
                              (parse(caddr _x))
                              (parse(cadddr _x)))]
                  [(equal? (car _x) 'arbol-symbol)
                   (arbol-symbol (cadr _x)
                              (parse(caddr _x))
                              (parse(cadddr _x)))]
                  [else eopl:error"XD"])))

;;Unparsing
(define unparse (lambda (_y)
                  (cases arbol-b _y
                    (arbol-leaf (num) (list 'arbol-leaf))
                    (arbol-int (key left right) (list 'arbol-int key (unparse left) (unparse right)))
                    (arbol-symbol (key left right) (list 'arbol-symbol key (unparse left) (unparse right)))
                    (arbol-empty  (list 'arbol-empty)))))


;;Pruebas
(display "Suma números del árbol-b:
")
(display (suma arbol1))
(display "
")
(display (suma arbol2))
(display "
")
(display (suma arbol3))
(display "
")
(display (suma arbol4))
(display "
")
(display (suma arbol5))
(display "

parseando y unparseando al bb:
")
;;parcing
(display "
+++parsing
")
(display (parse arbol1C))
(display "
")
(display (parse arbol2C))
(display "
")
(display (parse arbol3C))
(display "
")
(display (parse arbol4C))
(display "
")
(display (parse arbol5C))

;;unparsing
(display "
+++unparsing
")
(display (unparse arbol1))
(display "
")
(display (unparse arbol2))
(display "
")
(display (unparse arbol3))
(display "
")
(display (unparse arbol4))
(display "
")
(display (unparse arbol5))

