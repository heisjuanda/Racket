;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |mi forma de listas|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
(define lista0(list 'dell 'msi))

(define(encontrar-dell lista0)
  (cond
    [(eqv? 'dell(car lista0))'dell]
    [(eqv? 'dell(cdr lista0))'dell]))
(display"primera ")
(encontrar-dell lista0)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define lista1(list 'del 'muñeca 'doll 'do 'perro ' bomber))
(define(encontrar-muñeca lista1)
  (cond
    [(empty? lista1)empty]
    [else(boolean?(member 'muñeca lista1))]))
(display"segunda ")
(encontrar-muñeca lista1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define(fibonacci n)
(+(- n 1)(- n 2)))

(display"tercera ")
(fibonacci 5)
(display"tercera ")
(fibonacci 7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (suma-lista lista2)
  (apply + lista2))
(define lista2(list 1 2 3 4 5  3 53 2 24))

(display"Cuarta ")
(suma-lista lista2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define(cantidad-simbolos lista3)
  (length lista3))
(define lista3(list 'lo 'op 'you 'me 'hi 'u 't 'e 'q 'e 'f))

(display"quinta ")
(cantidad-simbolos lista3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define(cantidad-numeros lista4)
  (length lista4))
(define lista4(list 1 2 3 4 5 6 7 8 9 9 9 9 9 9 9 9 9 9 9))

(display"sexta ")
(cantidad-numeros lista4)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define(rango-temperatura t)
        (cond
          [(empty? lista5)empty]
         [(and(>= t 5)(<= t 95))#t]
         [else #f]))

(define lista5(list 5 6 6 7 65 6 33 57 95))
(display"septima ")
  (andmap rango-temperatura lista5)
(display"estos valores cumplen ")  
  (filter rango-temperatura lista5)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define(celcius c)       
  (*(- c 32)(/ 5 9)))
        
(define lista6(list 55 66 32))
(display"las temperaturas en celcius son ")
  (map celcius lista6)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define(mostrar-imagen simbolo nombre-juguete inventario)
  (

