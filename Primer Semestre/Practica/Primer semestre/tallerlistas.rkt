;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tallerlistas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
(define lista1(list 'dell 'asus 'rog 'msi 'hp))

(define(encontrar lista1 simbolo)
  (cond
    [(empty? lista1)empty]
    [(eqv? simbolo 'dell)(first lista1)]
    [(eqv? simbolo 'asus)(second lista1)]
    [(eqv? simbolo 'rog)(rest(rest(rest lista1)))]
    [(eqv? simbolo 'msi)(rest(rest(rest(rest lista1))))]
    [(eqv? simbolo 'hp)(rest(rest(rest(rest lista1))))]
    [else "no se encotró"]))
(display "ejercicio1")
(encontrar lista1 'asus)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define lista2('q 'w 'muñeca 'r 't 'y))
(define (esta? lista2 elemento)
  (cond
    [(empty? lista2)"esta vacío"]
    [(eqv? elemento(first lista2)"verdadero")]
    [else(rest lista2)"verdadero")]
    

    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (fibonacci n)
  (cond
    [(= n 0)0]
    [(= n 1)1]
    [else (+ (fibonacci(- n 1))(fibonacci (- n 2)))]))
(display "ejercicio2")
(fibonacci 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define(cantidadsimbol lista cont)
  (cond
    [(empty? lista)cont]
    [else (cantidadsimbol (rest lista)(+ cont 1))]))
(display "ejercicio0")
(cantidadsimbol(list 12 3 1) 0)