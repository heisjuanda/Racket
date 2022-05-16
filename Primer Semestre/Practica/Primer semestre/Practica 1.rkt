;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;contrato
(define(fe a b c d e f g)
(+(sqrt(/(+(sqr a)(sqr g)(sqr b)(sqr c)(funcion a b c d e f g))
         (sqrt(+(expt a 3)(sqr b)(funcion a b c d e f g)))))(*(funcion a b c d e f g)(+(expt a 3)2))))  
 

    (define(funcion a b c d e f g)(/(+ a b c d e f g)(+(sqr g)e)))

    (fe 1 2 3 4 5 6 7)
    (funcion 1 2 3 4 5 6 7)
