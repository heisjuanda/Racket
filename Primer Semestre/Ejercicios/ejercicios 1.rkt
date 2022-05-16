;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |ejercicios 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Nombre: Juan David Moreno
;;Código: 202059997
;; Talle # 1
;;Contrato: área-círculo: r
;;Proposito: Cálcular área del círculo
;; Datos de entrada: Radio:r
;;datos de salida: área
;;Ejemplo:(área-círculo 5)= 78.5
;;definición: (define(área-círculo r)
               ;;(* pi(sqr r)))
;;Pruebas:
(define(área-círculo r)
(* pi(sqr r)))
(display "el resultado es")
(área-círculo 5)
(string-append "otro " "ejercicio")

;;contrato: área-cilindro h , r
;;proposito: encontrar el volumen del cilindro
;;Datos entrada: h , r
;;datos salida: volumen
;;ejemplo:(área-cilindro 5 , 4) 314.15
;;definición: (define(área-cilindro h r)
             ;;(* pi(sqr r)h))

;;pruebas:
(define(área-cilindro h r)
  (* pi(sqr r) h))
(display "el volumen es")
(área-cilindro 4 5)
(string-append"otro ""ejercicio")

;;contrato:CELCIUS C
;;proposito: cálcular cuantos grados C corresponden  F
;;datos entrada: C
;;dato salida: F
;;Ejemplo: (CELCIUS 30) 86
;;Definición: (define(CELCIUS C)
              ;;(+ 32(* C 1.8)))
;;prueba:

(define(CELCIUS C)
  (+ 32(* C 1.8)))
(display "la temperatura es")
(CELCIUS 30)
(string-append"otro ""ejercicio")

;;contrato: costo-galon 
;;proposito: saber cuanto dinero me cuesta recorrer tantos km
;;datos entrada: galon 
;;datos salida: costo-galon
;;ejemplo:
;;definicion:
;;pruebas:
(define(númerodegalones g)
  (* g 20000))
(display"el costo es")
(númerodegalones 6)
difine(







