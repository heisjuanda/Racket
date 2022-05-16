;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname lololololo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct punto ( x y color))
(define punto1(make-punto '2
                          '3
                          'verde))
(punto-color punto1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;estructura
(define-struct estudiante(
  nombre))
(define estudiante1(make-estudiante 'sofía))
(define estudiante2(make-estudiante 'Miguel))
(define estudiante3(make-estudiante 'Juan))
(define estudiante4(make-estudiante 'Camilo))
(define estudiante5(make-estudiante 'López))
(estudiante-nombre estudiante1)

;;Unicalzado
(define-struct empleado(
Gerente
Secretario
Contador
Operario
Vigilantes))

(define(puestos elpuesto)
(cond
  (gerente? elpuesto
     (+ gerente 0.05)       



  (+ gerente 0.05)
(+ secretario 0.03)
(+ contador 0.02)
(+ operario 0.015)
(+ vifilante 0.01)
