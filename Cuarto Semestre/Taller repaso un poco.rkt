#lang eopl
;;SUMAR UNA LISTA
(define sumar (lambda (lista)
                (cond
                  [(null? lista)0]
                  [else (+ (car lista) (sumar (cdr lista)))])))

(define listaA'(2 3 4 1))
(display (sumar listaA))
;;CÁLCULAR LA MULTIPLICACIÓN ENTRE UNA MATRIZ Y UN VECTOR

(define multi

  (lambda (mat vec)

    (cond

      [(null? mat) '()]

      [else (cons(* (car mat) (car vec)) (multi (cdr mat)(cdr vec)))])))



(define prod-scalar-matriz

  (lambda (mat vec)

    (cond

      [(null? mat) '()]

      [else (append(list(multi (car mat) vec)) (prod-scalar-matriz (cdr mat) vec))])))

;;CAMBIAR EL VALOR DE UN NÚMERO DE UNA LISTA

(define list-set

  (lambda (lista n x)

    (cond

      [(null? lista) '()]

      [(= n 0) (append (list x)

                        (cdr lista))]

      [else (append (list (car lista))

                    (list-set (cdr lista) (- n 1) x))]

      )

    ))

;;ENCUENTRA PREDICADO EN UNA LISTA

(define exists?
  (lambda (pred lst)
    (cond
      [(null? lst) #f]
      [(pred (car lst)) #t]
      [else (exists? pred (cdr lst))]
    )))

;;RECORRIDO DE UN ÁRBOL
(define get-elements-in-order-arbol
  (lambda(arbol)
    (cond
      [(null? arbol)'()]
      [else(append(get-elements-in-order-arbol(cadr arbol)) ; nodo izquierdo
                  (list(car arbol)) ;raiz
                  (get-elements-in-order-arbol(caddr arbol)))]))) ;nodo derecho

 
(define l '(14 (7 () (12 () ()))
(26 (20 (17 () ())
())
(31 () ()))))
(get-elements-in-order-arbol l)  

(define up

  (lambda (lista)

        (lista-aux lista 1)

      ))



(define lista-aux
  (lambda (lista n)
       (cond
        [(null? lista) '()]
        [(= n 0) (if (list? lista) lista (list lista))]
        [(list? lista) (append (lista-aux (car lista) 0) (lista-aux (cdr lista) 1))]     
        )))
