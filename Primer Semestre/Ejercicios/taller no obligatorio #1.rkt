;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |taller no obligatorio #1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; 1. Defina el valor de verdad
(> 4 3)   ;;verdadero 
(> 2 3)   ;;falso
(> 7/2 3) ;;verdadero

;; 2. residuo 
> (remainder 2 2)  ;;0
> (remainder 4 3)  ;;1
> (remainder 3 4)  ;;3
;;> (remainder 2.4 4) ;;error
> (remainder 5 -2)  ;;1
> (remainder -6 -4)  ;;-2


;; 3. Defina el valor de verdad
(and (> 4 3) (> 3 3))      ;;falso
(and (> 4 2) (> 2 3))      ;;falso
(and (> 4 7/2) (> 7/2 3))  ;;true

;; 4. Defina el valor de verdad
(= (* 4 4) 4)       ;;false
(= (* 2 2) 2)       ;;false
(= (* 7/2 7/2) 7/2) ;;false

;;5. Crear una función rango, tenga como entrada un valor y decir 
;;si está dentro del intervalo 5 y 6.
(define(entre?  x )
  (and(< 5 x)(< x 6)))
(display"La valor de la variable es ")
(entre? 5.5)

;;6. Con la función auxiliar rango, crear una función entreMayor que tenga como entrada un valor
;;y si está dentro del rango según la siguiente figura.
(define(rango v)
  (cond
     [(or(and (< 5 v)(< v 6))(>= v 10))  #T ]
     [else #F]
    ))
(display"es ")
(rango 5.5)

;;7. Translate the following five intervals on the real line into Scheme functions that accept a number
;;and return true if the number is in the interval and false if it is outside: 

(define(variabless a b c)
  (+(*(* (+ a b)c))(/ b(+ c a))))
(variabless 5 10 3)


     
(define(calculadora operador n m)
  (cond
    [(eqv? operador +)(+ n m)]
    [(eqv? operador -)(- n m)]
    [(eqv? operador /)(/ n m)]
    [(eqv? operador *)(* n m)]
    [else #F]))
(calculadora - 2 3)
