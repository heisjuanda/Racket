#lang eopl
;<arbol-b> ::=(arbol-empty) <empty>
;      ::= (arbol-leaf)<int>
;      ::= (arbol-int key left right)<int> <arbol-b> <arbol-b>
;      ::= (arbol-symbol key left right)<symbol> <arbol-b><arbol>


;;creandio datatype
(define-datatype arbol-b arbol-b?
  (arbol-empty)
  (arbol-leaf (num number?))
  (arbol-int (key number?)
             (left arbol-b?)
             (reight arbol-b?))
  (arbol-symbol (key symbol?)
                (left arbol-b?)
                (right arbol-b?)))

;;función
(define comparar (lambda (arb arb1)
               (cases arbol-b arb
                 (arbol-empty () (cases arbol-b arb1
                                   (arbol-empty () (equal? arb arb1))
                                   (else #F)))
                 
                 (arbol-leaf (num) (cases arbol-b arb1
                                     (arbol-leaf (nu) (equal? arb arb1))
                                     (else #F)))
                 
                 (arbol-int (key left right) (cases arbol-b arb1
                                               (arbol-int (k l r)
                                               (and(eqv? key k)
                                                   (comparar left l)
                                                   (comparar right r)))
                                               (else #F)))
                 
                 (arbol-symbol (key left right) (cases arbol-b arb1
                                                (arbol-symbol (k l r)
                                                (and(eqv? key k)
                                                   (comparar left l)
                                                   (comparar right r))
                                               )(else #F))))))
;;Preorden (k l r)
(define preorden (lambda (arb)
                  (cases arbol-b arb
                  (arbol-empty () 0)
                  (arbol-leaf (num)num)
                  (arbol-int (key left right) (append (list key)(list (preorden left)(preorden right)))) 
                  (arbol-symbol (key left right) (append (list key)(list (preorden left)(preorden right)))))))
;;Postorden (l r k)
(define postorden (lambda (arb)
                  (cases arbol-b arb
                  (arbol-empty () 0)
                  (arbol-leaf (num)num)
                  (arbol-int (key left right) (append (list (postorden left)(postorden right)(list key)))) 
                  (arbol-symbol (key left right) (append (list (postorden left)(postorden right)(list key)))))))
;;inorden (l k r)
(define inorden (lambda (arb)
                  (cases arbol-b arb
                  (arbol-empty () 0)
                  (arbol-leaf (num)num)
                  (arbol-int (key left right) (append (list (inorden left))(list key)(list (inorden right)))) 
                  (arbol-symbol (key left right) (append (list (inorden left))(list key)(list (inorden right)))))))
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

;;pruebas
(display (comparar arbol2 arbol2))
(display "
")
(display (comparar arbol3 arbol3))
(display "
")
(display (comparar arbol4 arbol4))
(display "
")
(display (comparar arbol5 arbol5))
(display "
")
(display (comparar arbol2 arbol5))
(display "
postorden")
(display (postorden arbol5))
(display "
inorden")
(display (inorden arbol5))
(display "
preorden")
(display (preorden arbol5))