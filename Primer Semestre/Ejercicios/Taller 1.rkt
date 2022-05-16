;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Taller 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;NOMBRE: Juan Camilo Meneses y Juan David Moreno
;;CÓDIGO: 202059944 y 202059997
;;TALLER: No1 Taller
;----------------------------------------------------------------------------
;;punto 1
;;CONTRATO: altura: Número - Número
;;PROPÓSITO: Cálcular la altura del cohete
;;DATOS DE ENTRADA: aceleracion:g tiempo:t
;;DATOS DE SALIDA: altura
;;EJEMPLO: (altura 5 2) Se espera que de la altura sea
;;10
;;DEFINICIÓN
(display "La altura es ")
(define (altura g t)
  (* (/ 1 2) (* g t) t))
;;PRUEBA
(altura 5 2)
   


;;punto 2
;;CONTRATO:  cop-euro: Número - Número
;;PROPÓSITO: Cálcular el número de euros
;;DATOS DE ENTRADA: Cop:c
;;DATOS DE SALIDA: Euros
;;EJEMPLO:
;;(cop-euro 2000) 
;;Se espera que sean o.48 euros
;;DEFINICIÓN:
(define(cop-euro c )
  (* 0.00024 c))
(display"Es esta cantidad de euros ")
;;Prueba:
(cop-euro 5000)


;;punto 3
;;CONTRATO: area-triangulo Número:número
;;PROPÓSITO: Determinar el área de un triángulo 
;;DATOS DE ENTRADA: Base:b y Altura:h
;;DATOS DE SALIDA: Área
;;EJEMPLO: 
;;(area-triangulo 8 4)
;;Se espera que el área sea 16
;;DEFINICIÓN:
(define(area-triangulo b h)
  (* b h(/ 2)))
(display"El área del triángulo es de ")
;;Prueba:
(area-triangulo 8 4)

;;punto 4
;;CONTRATO: Converter3 Número:número
;;PROPÓSITO: Cálcular  
;;DATOS DE ENTRADA: Variables:x,z,y
;;DATOS DE SALIDA: converter3
;;EJEMPLO: 
;;(converter3 4 5 6)
;;Se espera que el resultado sea 654
;;DEFINICIÓN:
(define (converter3 a b c)
  (+ (* a 1) (* b 10)(* c 100)))
;;prueba:
(display "El resultado de la converción es ")
(converter3 4 5 6)

;;punto 5
;;A
(define(variable n)
  (+ 10(sqr n)))
(display"El resultado es ")
(variable 2)
;;B
(define(Numero x)
  (+ 20(* 0.5(sqr x))))
(display"El resultado es ")
(Numero 3)
;;C
(define(num n)
  (- 2 (/ 1 n)))
(display "El resultado es ")
(num 2)

;;punto 6
;;CONTRATO: horas Número:número
;;PROPÓSITO: Cálcular el sueldo dependiendo de la cantidad
;; de horas trabajadas a la semana
;;DATOS DE ENTRADA: horas:h
;;DATOS DE SALIDA: sueldo
;;EJEMPLO: 
;;(horas 30)
;;Se espera que el resultado sea 150000
;;DEFINICIÓN:
(define(horas h)
  (* 5000 h))
;;prueba:
(display"El sueldo es de $")
(horas 30)

;;punto 7
;;CONTRATO: suma_monedas Número:número
;;PROPÓSITO: Cálcular el valor de la bolsa de monedas
;;DATOS DE ENTRADA: suma_monedas:a,b,c,d 
;;DATOS DE SALIDA: Valor bolsa de monedas
;;EJEMPLO: 
;;(suma_monedas 2 5 6 8)
;;Se espera que el resultado sea 8652
;;DEFINICIÓN:
(define (suma_monedas a b c d)
  (+ (* d 1000)(* c 100)(* b 10)(* a 1)))
;;prueba:
(display"El resultado es de ")
(suma_monedas 2 5 6 8)

;;punto 8
;;CONTRATO: total_ganancia Número:número
;;PROPÓSITO: Determinar el total de las ganancias 
;;DATOS DE ENTRADA: total_ganancias:c
;;DATOS DE SALIDA: Ganacias
;;EJEMPLO: 
;;(total_ganancia 50)
;;Se espera que el área sea 395
;;DEFINICIÓN:
(define (total_ganancia c)
  (- (* 10 c)(+ 30 (* 0.05 30 c))))
(display"El total de las ganancias es ")
(total_ganancia 50)





