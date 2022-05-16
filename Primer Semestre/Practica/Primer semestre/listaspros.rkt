;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname listaspros) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))

;determinar una función que encuentre le valor 'dell en una
;lista de símbolos
(define lista1(list 'msi 'asus 'janus 'dell 'alienware))

(define (encontrar-dell lista)
  (cond
    [(member 'dell lista)#t]
    [else #f]))
(display"primera")
(encontrar-dell lista1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;dada ua lista de símbolos encontrar muñeca
(define lista2(list 'do 'd 'muñeca 'doll 'lol))

(define(muñeca lista)
  (cond
    [(member 'muñeca lista)"Si esta muñeca"]
    [else "No esta muñeca"]))
(display"segunda")
(muñeca lista2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define lista3(list 5 846 4 6 546 46  8))

  (define(sumarlista lista)
    (apply + lista))
(display"tercera")
  (sumarlista lista3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define lista4(list 'd 'f 'g 'h 'y 'r 'ew '2w 'gg))
(define(cuantos-simbolos lista)
  (length lista))
(display"cuarta y quinta")
(cuantos-simbolos lista4)
(cuantos-simbolos lista3)
(cuantos-simbolos lista2)
(cuantos-simbolos lista1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define listat(list 34 12 55 33))

(define(rangotemp lista)
    (and(<= 5 (car lista))(<= (car lista) 95)))

(define(elrango lista)
(map rangotemp lista))
(display"Sexta")
(rangotemp listat)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define(formula lista)
  (*(- lista 32)(/ 5 9)))

(define (convertirtemp lista)
  (map formula lista))

(display"septima")
  (convertirtemp listat)
