;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica últamaclase 1 examen|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Estructuras:
(define-struct computador
  (marca
   modelo
   precio
   color))
(define computadorA(make-computador
                    'msi
                    'x205
                    2000000
                    'rojo))
(define computadorB(make-computador
                    'alienware
                    'aurora
                    15000000
                    'blanco))
(define computadorC(make-computador
                    'asus
                    'blade395x
                    4000000
                    'negro))
;;Función:
(define(descuento compu)
  (cond
    [(eqv? 'rojo (computador-color compu))
     (-(computador-precio compu)(*(computador-precio compu)0.5))]
    [(eqv? 'blanco(computador-color compu))
     (-(computador-precio compu)(*(computador-precio compu)0.3))]
    [(eqv? 'negro(computador-color compu))
     (-(computador-precio compu)(*(computador-precio compu)0.15))]
    [else "no está disponible"]))

(descuento computadorA)
(descuento computadorB)
(descuento computadorC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define lista1(list 8 4 583 39 2 34))
(apply + lista1)

;(define(suma lista)
;  (cond
;    [(empty? lista)empty]
;  [else (+(first lista)(suma(rest lista)))]))
;(suma lista1)

(define-struct persona(
                       cedula
                       nombrecompleto
                       edad
                       genero))

(define-struct nombrecompleto(
                      nombres
                      apellidos))
                      
(define persona1(make-persona 193893
                               (make-nombrecompleto"juanda""moreno")
                               12
                               'hombre))

(define persona2(make-persona 144154
                              (make-nombrecompleto "valeria""estrepoposada")
                              12
                              'mujer))

(define persona3(make-persona 144154
                              (make-nombrecompleto "laura""estrepoardila")
                              14
                              'mujer))

(nombrecompleto-apellidos(persona-nombrecompleto persona1))


(define listapersona(list persona1 persona2 persona3))

(define(personas listapersona nombre)
  (cond
    [(empty? listapersona)empty]
    [(eqv? nombre(nombrecompleto-nombres(persona-nombrecompleto
                                         (first listapersona))))(persona-cedula(first listapersona))]
    [else(personas(rest listapersona)nombre)]))

(personas listapersona "juanda")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define lista12(list 12 45 132 674 12321 624))

(define(pares. lista)
  (cond
    [(empty? lista)empty]
    [(ormap pares lista)(filter pares lista)]
    [else"nada"]))
   
(define(pares x)
(cond
  [(even? x)#t]
  [else #f]))

(pares. lista12)
;otra forma:
(define(par lista)
  (cond
    [(empty? lista)empty]
    [(even?(car lista))(cons(car lista)
                          (par(cdr lista)))]
    [else(par(cdr lista))]))

(par lista12)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (rango_temp listaTemps)
  (cond
    [(empty? listaTemps)#T]
    [(or(and(> (first listaTemps)-273)
         (< (first listaTemps)5))
        (and(> (first listaTemps)95)
         (< (first listaTemps)100)))
     #F
     ]
                                  
    [else (rango_temp (rest listaTemps))]
    )
  )






