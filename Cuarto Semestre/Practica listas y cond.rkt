#lang eopl

;;restar elementos de una lista

(define resta (lambda (lista)
                (cond
                  [(null? lista)0]
                  [else (- (car lista)(resta (cdr lista)))])))

(define listaA '(2 3 4 5))
(display (resta listaA))
(display "\n")

;;aplicar +,-,/ en la lista
(define operacion (lambda (lista simbolo)
                    (cond
                      [(null? lista)(cond
                                      [(equal? simbolo '+)0]
                                      [(equal? simbolo '-)0]
                                      [(equal? simbolo '/)1])]
                      [(equal? simbolo '+)(+ (car lista)(operacion (cdr lista)'+))]
                      [(equal? simbolo '-)(- (car lista)(operacion (cdr lista)'-))]
                      [(equal? simbolo '/)(cond
                                            ;;[(= (car lista)0)(operacion (cdr lista)'/)]
                                            [else (/ (car lista)(operacion (cdr lista)'/))])]
                      [else "no se reconoce esa operación"])))

(display (operacion listaA '+))
(display "\n")
(display (operacion listaA '-))
(display "\n")
(display (operacion listaA '/))
(display "\n")