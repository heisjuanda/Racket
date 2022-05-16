#lang eopl
(display (/ (+ (expt 5 3) (expt 8 (/ 1 2)) (/ (+ 9 5) (+ (expt 2 2) 7)))(- (expt 8 5)(/ (+ 2 3)(+ 5 (expt (/ 7 9) 5)))(expt(/ 8 (expt 7 (/ 1 2))) (/ 1 3))) ))

(display "\n")

(define funcionMortal (lambda (x) 
 (if (> x 18)
    "usted es mayor de edad"
    "usted es menor de edad")
))
(display (funcionMortal 12))
(display "\n")

(define _funcionA
(lambda (n l) 
  (if (> n 0)
  (if (> l 0)"n y l son mayores que 0" "n es meyor que 0 y l no")
  (if (> l 0)"n es menor que 0 y l mayor" "n y l son menores que 0"))  
  ))
(display (_funcionA 2 -1))
(display "\n")

(define funcionSabatina 
(lambda (n) 
  (cond 
  [(= n 0)"n es cero"]
  [(> n 0)"n es mayor que 0"]
  [(> n 1)"n es mayor a 1"]
  [else "n es menor que 0"])))
(display (funcionSabatina -2))  
(display "\n")

(define funcionQueRecibeUnNumero
(lambda (x y)
(cond 
[(<= x 0)"error"]
[(>= x 0) 
 (cond 
  [(equal? y "m")"hombre"]
  [(equal? y "f")"mujer"]
  [else "error"])]
)
))
(display (funcionQueRecibeUnNumero 2 "m"))
(display "\n")
(display (funcionQueRecibeUnNumero 1 "f"))

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
