;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Parcial 1 Juan Alfonso 202059997|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
#|
Nombre y Apellido: Juan David Moreno Alfonso
Código: 202059997
|#
(define (fibonacci n)
  (cond
    [(= n 0)0]
    [(= n 1)1]
    [else (+ (fibonacci(- n 1))(fibonacci (- n 2)))]))

(display"El valor1 es ")
(fibonacci 8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#|
Contrato: multiplo-menor -> números -> números

Proposito: Hacer un progrma el cual ayude a encontrar si un número
es multiplo de otro

Datos de entrada:  x, y, z:Números    

Datos de salida: multiplo-menor Números

Ejemplo:
(define(multiplo-menor x y z)
  (cond
    [(and(<= x y)(>= z y))(remainder z x)]
    [(and(<= x y)(>= y z))(remainder y x) ]
    [(and(<= y x )(>= x z ))(remainder x y)]
    [(and(<= z x )(>= x y ))(remainder x z)]
    [else"No hay valor Númerico "]))

(multiplo-menor 5 6 1)
debe de dar 1, lo que significa que la división no es exacta, por lo que no es multiplo
|#
;definición:
(define(multiplo-menor x y z)
  (cond
    [(and(<= x y)(>= z y))(remainder z x)]
    [(and(<= x y)(>= y z))(remainder y x)]
    [(and(<= y x )(>= x z ))(remainder x y)]
    [(and(<= z x )(>= x y ))(remainder x z)]
    [else"No hay valor Númerico válido "]))



(display "El valor esultante es ")
;prueba
(multiplo-menor 5 6 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Analisis y definición de datos
(define-struct liviana
  (edad
   estatura
   ))

(define-struct normal
  (edad
   estatura
   ))

(define-struct pesada
  (edad
   estatura
   peso))

(define-struct obesa
  (edad
   estatura
   peso))
Donde (pesada-estatura pesada1), (pesada-peso pesada1), (pesada-edad pesada1)
SON VALORES NÚMERICOS

Contrato: cantidad-harina: número->número

Proposito:
Hallar la cantidad de harinas que debe consumir cada fenotipo de persona

Ejemplos:
(define(cantidad-harina peso kg edad estatura)
  (cond
    [(eqv? 'liviana peso)(+(*(liviana-estatura liviana1) estatura)(* (liviana-edad liviana1) edad)(* kg 1))]
    [(eqv? 'normal peso)(+(* (normal-estatura normal1) estatura)(*(normal-edad normal1) edad)(* kg -0.1))]
    [(eqv? 'pesada peso)(+(* (pesada-estatura pesada1) estatura)(* (pesada-edad pesada1) edad)(* (pesada-peso pesada1) peso))]
    [(eqv? 'obesa peso)(+(* estatura (obesa-estatura obesa1))(* edad (obesa-edad obesa1))(* peso (obesa-peso obesa1)))]
    [else "Los valores fueron incorrectos o no se halló"]))


(cantidad-harina 'liviana 30 45 120)
se espera que de 54

Bosquejo:

(define(cantidad-harina peso kg edad estatura)
  (cond
    [(eqv? a peso)(+(*(liviana-estatura liviana1) numero)(* (liviana-edad liviana1) numero)(* kg numero))]
    [(eqv? b peso)(+(* (normal-estatura normal1) numero)(*(normal-edad normal1) numero)(* kg numero))]
    [(eqv? c peso)(+(* (pesada-estatura pesada1) numero)(* (pesada-edad pesada1) numero)(* (pesada-peso pesada1) numero))]
    [(eqv? d peso)(+(* estatura (obesa-estatura numero))(* numero (obesa-edad obesa1))(* numero (obesa-peso obesa1)))]
    [else "Los valores fueron incorrectos o no se halló"]))

|#
;Definición de estructuras:
(define-struct liviana
  (edad
   estatura
   ))

(define-struct normal
  (edad
   estatura
   ))

(define-struct pesada
  (edad
   estatura
   peso))

(define-struct obesa
  (edad
   estatura
   peso))


(define liviana1(make-liviana
                 0.4
                 0.05))

(define normal1(make-normal
                 0.3
                 0.03))

(define obesa1(make-obesa
                 0.15
                 0.015
                 -0.15))

(define pesada1(make-pesada
                 0.15
                 0.02
                 -0.1))
;Definición:
(define(cantidad-harina peso kg edad estatura)
  (cond
    [(eqv? 'liviana peso)(+(*(liviana-estatura liviana1) estatura)(* (liviana-edad liviana1) edad)(* kg 1))]
    [(eqv? 'normal peso)(+(* (normal-estatura normal1) estatura)(*(normal-edad normal1) edad)(* kg -0.1))]
    [(eqv? 'pesada peso)(+(* (pesada-estatura pesada1) estatura)(* (pesada-edad pesada1) edad)(* (pesada-peso pesada1) peso))]
    [(eqv? 'obesa peso)(+(* estatura (obesa-estatura obesa1))(* edad (obesa-edad obesa1))(* peso (obesa-peso obesa1)))]
    [else "Los valores fueron incorrectos o no se halló"]))

(display"La cantidad de harina que debe consumir es de ")
;Prueba:  
(cantidad-harina 'liviana 30 45 120)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
#|
Contrato: Pago: Número -> Símbolo

Porposito: Determinar cuanto debo de cobrar a los clientes segun
su medio de pago

Datos de entrada: valor:número forma:símbolos

Datos de salida: pago:Número

Ejemplo:
(define(pago valor forma)
  (cond
    [(eqv? forma 'efectivo)(- valor(* valor 0.05))]
    [(eqv? forma 'tarjeta)(+ valor(* valor 0.03))]
    [else "Introdujo un metódo de pago o valor invalido "]))

(pago 300000 'efectivo)
debe de producir 285.000
|#   
;Definición:
(define(pago valor forma)
  (cond
    [(eqv? forma 'efectivo)(- valor(* valor 0.05))]
    [(eqv? forma 'tarjeta)(+ valor(* valor 0.03))]
    [else "Introdujo un metódo de pago o valor invalido "]))


(display"Su pago es de $")
;Prueba:
(pago 300000 'efectivo)
  
                  
