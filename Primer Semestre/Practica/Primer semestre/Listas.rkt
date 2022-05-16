;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Listas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;;creación de Listas:

;(define-struct muñeca(altura proxiamuñeca))
;(make-muñeca 10
;             (make-muñeca 9
;              (make-muñeca 8 'fin)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cons 1 empty)
(cons 1(cons 2(cons 3 empty)))
;Crear listas con LIST:
(list 8)
(list 6 7 4 2)
(list 'a 'a 'a 'a 'a 'a)
(list 1 2 3 'juan "hola carck" 1 2 3)
(cons 10 (cons 20 (cons 3 (cons 0 (cons 5 empty)))))
(cons 'viviana(cons 'marcos(cons 'sandra(cons 'manuel empty))))
(list 'viviana 'marcos 'sandra 'manuel)
(cons 10(cons 20 (cons 3(cons 0(cons 15 empty)))))
(list 12 20 3 0 15)
;;firs y rest
(first(list 1 2 3 4))
(rest(list 1 2 3 4))
(first(cons 1(cons 2(cons 3 empty))))
(rest(cons 1 (cons 2(cons 3 empty))))

(list 10 20 5)
(first(rest(list 10 20 5)))
(rest(rest(list 10 20 5)))
(first(rest(rest(list 10 20 5))))
(rest(rest(rest(list 10 20 5))))
(second(list 20 10 5))
(third(list 20 2 1 2))
(list empty)
(cons '() empty)
;;?????determina si corresponde a lo preguntado
(list? 1)
(list? empty)
(list?(cons 1 empty))
(cons? empty)
(empty? 0)
(empty?(cons 0 empty))
(empty? empty)
