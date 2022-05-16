;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Estructuras 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(eqv? 'hola 'hola)

;;Estructuras en Racket
;;Dar información de los puntos
(make-posn 2 4)
(make-posn 1 4)
(make-posn 6 9)
;;Recuperando la información de X y Y
(posn-x (make-posn 2 4))
(posn-y (make-posn 3 6))
(posn-x (make-posn 234 54))
(posn-y (make-posn 22 445))
;;Datos en define más autonomía al llamar a X y Y
(define estudiante(make-posn 3 5))
(posn-x estudiante)
(posn-y estudiante)
;;Ejemplo función
;;Principal; donde punto2 es una variable
;;que recibe posn (make-posn x y)
(define (distancia punto2)
  (sqrt(+ (aux(posn-x punto2))
          (aux(posn-y punto2)))))

;;Función auxiliar que recibe un número
;;y lo pone al cuadrado
(define(aux numero)
  (sqr numero))
(distancia(make-posn 2 4))


;;principal
(define(hipotenusa punto3)
(sqrt(+(au(posn-x punto3))
       (au(posn-y punto3)))))
;;auxiliar
(define(au n)
 (* n n))
(hipotenusa (make-posn 2 3))

;;crear nuestra estrucctura
(define-struct estudiantes
  (nombre
   apellido
   direccion
   matricula
   puesto
   plan))
;;Se le da información a la estructura
(define estudiante1(make-estudiantes 'Juan
                  'Moreno
                  "Calle 35 24-40"
                   1000000
                   1
                   3743))
(define estudiante2(make-estudiantes 'Juan
                  'López
                  "Calle 5 30-20"
                  2
                  240000
                  3743))
;;datos para sacar
(estudiantes-nombre estudiante1)
(estudiantes-apellido estudiante2)


;;ejemplo2
(define-struct edificio
    (name
    direction
    estado
    año))
(define edificio1(make-edificio 'El_alto
                                "calle 34"
                                'bueno
                                 2011))
(edificio-direction edificio1)

    