;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname listas+) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
(define(producto x)
  (cond
    [(= 1 x)1]
    [else(* x(- x 1))]))

(producto 1)
(producto 2)
(producto 4)

(define(potencia c y)
  (cond
    [(= y 1)c]
    [else(expt c y)]))

(potencia 3 5)
(potencia 4 1)
(potencia 4 5)

(define(potencias b e)
  (cond
    [(= e 1)b]
    [else(* b(potencias b(- e 1)))]))
(potencia 2 3)
(potencia 4 5)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LISTAS
;contar números de la lista
(define(contar listasuma)
  (cond
    [(empty? listasuma)empty]
    [else(+(first listasuma)
           (contar(rest listasuma)))]))

(display"aqui ")
;(contar(list 1 2 3))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                       
;lista con listas

(define(salario horas)
  (* 3000 horas))

(define(lista-salario listah)
  (cond
    [(empty? listah)empty]
    [else(cons(salario (first listah))
              (lista-salario(rest listah)))]))

(lista-salario(list 1 2))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;lista estructura
(define-struct registro(nombre precio))

(define(valortotal inventario)
  (cond
    [(empty? inventario)empty]
    [else(+(registro-precio(first inventario))
           (valortotal (rest inventario)))]))

(valortotal(list (make-registro 'robot 22.05)
                 (make-registro 'doll 17.95)))

