;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname listae) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
(define(lista a)
  (list 'muñeca 'doll))

(define(aux x)
  (cond
    [(= 0 x)(first(list 'muñeca 'doll))]
    [(= 1 x)(second(list 'muñeca 'doll))]
    [else "no se encuentra "]))
(display "el resultado es ")
(aux 1)
(aux 2)
(aux 0)

(define(lis v)
  (cond
    [(equal? v 'muñeca)"si esta"]
    [(equal? v 'doll)"si esta"]
    [else "no se encontro el objeto en la lista "]))
(display "a ver ")
(lis 'muñeca)
(lis 'doll)
(lis 'lo)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+
(define (fibonacci n)
  (cond
    [(= n 0)0]
    [(= n 1)1]
    [else (+ (fibonacci(- n 1))(fibonacci (- n 2)))]))

(fibonacci 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define(cantidadsimbol lista cont)
  (cond
    [(empty? lista)cont]
    [else (cantidadsimbol(rest lista)(+ cont 1))]))

(display"here")
(cantidadsimbol(list 12 3 1) 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define(verificartemp lista0)
  (cond
    [(empty? list)empty]
    [(and(>=(first lista0)5)(<=(first lista0)95))(verificartemp(rest lista0))]
    [else #F]))

(display "es")
(define lista0(list 90 230 23 45))






