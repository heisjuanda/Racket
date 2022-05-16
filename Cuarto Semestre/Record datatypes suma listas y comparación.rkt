#lang eopl
;<record>::=<empty>
;(empty-record)
;        ::=<key><value>
;(value-record (k v))
;        ::=<key><value><record>
;(value-non-empty (k v r))
;
;<value>::=<number>
;(value-num(num))
;       ::=<symbol>
;(value-sym(sym))
;
;
;<key>::=<symbol>
;     ::=<list-s>
;
;<list-s>::=<symbol>
;        ::=<symbol><list-s>
;
;datatypes
;sumar valores
;lista de símbolos
;comparar registros

;;datatypes
(define-datatype value value?
  (value-num (value number?))
  (value-sym (value symbol?)))

(define-datatype lista-s lista-s?
  (lista-s-sym (lista symbol?))
  (lista-symbol (lista lista-s?)))

(define lista-s->sym (lambda (lst)
                       (cases lista-s lst
                         (lista-s-sym (lst)(list lst))
                         (lista-symbol (lst)(lista-s->sym lst)))))

(define-datatype key key?
  (key-lista-s (key lista-s?))
  (key-sym (key symbol?)))


(define-datatype record record?
  (empty-record)
  (value-record (key key?)(value value?))
  (value-non-empty (key key?)
                   (value value?)
                   (record record?)))

;;Suma valores númericos
(define sumaMaster (lambda (rec)
                     (cases record rec
                       (empty-record ()0)
                       (value-record (key v)
                                     (cases value v
                                       (value-num (v) v)
                                       (value-sym (v)0)))       
                       (value-non-empty (key v r)
                                        (+(cases value v
                                            (value-num (v) v)
                                            (else 0))(sumaMaster r))))))

;;Lista de símbolos
(define listaSym (lambda (rec)
                   (cases record rec
                     (empty-record () '())
                     (value-record (k v)
                                   (append(cases key k                                     
                                            (key-lista-s (k) (lista-s->sym k))
                                            (key-sym (k) (list k))                                    
                                            )
                                          (cases value v
                                            (value-sym (v) (list v))
                                            (value-num (v) '())                                     
                                            )))
                     (value-non-empty (k v r)
                                      (append(cases value v                                              
                                               (value-sym (v) (list v))
                                               (value-num (v)'())
                                               ) 
                                             (cases key k
                                               (key-sym(k) (list k))
                                               (key-lista-s(k) (lista-s->sym k))
                                               )
                                             (listaSym r))))))
                                     
;;Comparar record               
(define volverL (lambda (rec)
                  (cases record rec
                    (empty-record () '())
                    (value-record (k v)
                                  (append(cases key k                                     
                                           (key-lista-s (k) (lista-s->sym k))
                                           (key-sym (k) (list k))                                    
                                           )
                                         (cases value v
                                           (value-sym (v) (list v))
                                           (value-num (v) (list v))                                     
                                           )))
                    (value-non-empty (k v r)
                                     (append(cases value v                                              
                                              (value-sym (v) (list v))
                                              (value-num (v) (list v))
                                              ) 
                                            (cases key k
                                              (key-sym(k) (list k))
                                              (key-lista-s(k) (lista-s->sym k))
                                              )
                                            (listaSym r))))))

(define comparar (lambda (rec1 rec2)
                   (if
                     (equal? (length rec1)(length rec2))
                     (cond
                       [(and(null? rec1)(null? rec2))]
                       [(equal? rec1 rec2)]
                       [(equal? (car rec1)(car rec2))(comparar (cdr rec1)(cdr rec2))])
                     #F)
                   ))


;;definir record

(define record1 (value-non-empty (key-sym 't)(value-num 2)(value-record (key-sym 'k)(value-sym 'g))))
(define record2 (value-non-empty (key-sym 't)(value-num 2)(value-record (key-sym 'k)(value-num 5))))
(define record3 (value-record (key-sym 'g)(value-sym 'y)))
(display(sumaMaster record1))
(display"
")
(display(sumaMaster record2))
(display"
")
(display(listaSym record1))
(display"
")
(display(listaSym record2))
(display"
")
(display(listaSym record3))
(display"
")
(display (comparar (volverL record1)(volverL record1)))
(display"
")
(display (comparar (volverL record2)(volverL record2)))
(display"
")
(display (comparar (volverL record3)(volverL record3)))
(display"
")
(display (comparar (volverL record1)(volverL record2)))