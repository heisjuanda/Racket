;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Tarea2 fun2020|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;***********************************************************************************************
;*INTEGRANTE 1 
;*****Nombre:Juan Camilo Meneses Saldarriaga
;*****Código:202059944
;*****Plan:3743
;*INTEGRANTE 2
;*****Nombre:Juan David Moreno Alfonso  
;*****Código:202059997
;*****Plan:3743
;*
;*
;*Archivo:
;*****Nombre:Tarea2_2059944_202059997
;*****Fecha-creación: 10/07/2020
;*****Fecha-modificación:13/07/2020
;*************************************************************************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;CONTRATO:#1
;;puntajetotal-números-> números
;;
;;PROPÓSITO:
;;Clasificar el desempeño que tuvo cada estudiante
;;
;;DATOS ENTRADA:
;;parcial1 parcial2 laboratorio1 laboratorio2 numeroparticipaciones
;;
;;DATOS SALIDA:
;;puntajetotal
;;
;;EJEMPLOS:
;;parcial1=5 parcial2=5 laboratiorio1=5 laboratorio2=5 participaciones=3 participaciones2=5
;;Debe producir "excelente" 
;;
;;DEFINICION:
(define (puntajetotal parcial1 parcial2 laboratorio1 laboratorio2 participaciones1 participaciones2)
  (+
   (+(* 0.30 parcial1)(* 0.1 participaciones1))
   (+(* 0.35 parcial2)(* 0.1 participaciones2))
   (* 0.15 laboratorio1)
   (* 0.20 laboratorio2)))
(define (clasificacion puntajetotal)
  (cond
    [(and(>= puntajetotal  0) (< puntajetotal 2))'malo]
    [(and(>= puntajetotal 2) (< puntajetotal 3))'deficiente]
    [(and(>= puntajetotal 3) (< puntajetotal 3.8))'Regular]
    [(and(>= puntajetotal 3.8) (< puntajetotal 4.5))'Bueno]
    [(and(>= puntajetotal 4.5) (<= puntajetotal 5))'Excelente]
    [else "Excelente"]))
;;PRUEBA:
(display "Clasificacion Ejercicio 1: ")
(clasificacion (puntajetotal 3 4 4.2 4.5 4 3))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;CONTRATO:#2
;;clasificacion2: números-> números
;;
;;PROPÓSITO:
;;Conocer las notas de los estudiantes en las diferentes asignaturas presentadas
;;
;;DATOS ENTRADA:
;;examen1 examen2 tarea1 tarea2 numeroparticipaciones2
;;
;;DATOS SALIDA:
;;fundamentos ingles1 calculo1 deportes
;;
;;EJEMPLOS:
;;examen1=5 examen2=4 tarea1=3 tarea2=4.2 numeroparticipaciones2=55
;;Para fundamentos debe dar "excelente"
;;
;;examen1=5 examen2=4 tarea1=3 tarea2=4.2 numeroparticipaciones2=55
;;Para calculo1 debe dar "excelente"
;;
;;examen1=4 examen2=3 tarea1=2.9 tarea2=4.2 numeroparticipaciones2=10
;;Para ingles1 debe dar "Bueno"
;;
;;examen1=4 examen2=3 tarea1=2.9 tarea2=4.2 numeroparticipaciones2=10
;;Para deporte debe dar "Bueno"
;;
;;DEFINICION:
;***Fundamentos:
(define (fundamentos examen1 examen2 tarea1 tarea2 numeroparticipaciones2)
  (+
   (* 0.20 examen1)
   (* 0.40 examen2)
   (* 0.20 tarea1)
   (* 0.20 tarea2)
   (* 0.1 numeroparticipaciones2)))

(define (clasificacion2 fundamentos)
  (cond
    [(and(>= fundamentos 0)(< fundamentos 2))'Malo]
    [(and(>= fundamentos 2)(< fundamentos 3))'Deficiente]
    [(and(>= fundamentos 3)(< fundamentos 3.8))'Regular]
    [(and(>= fundamentos 3.8)(< fundamentos 4.5))'Bueno]
    [(and(>= fundamentos 4.5)(<= fundamentos 5))'Excelente]
    [else 'Exelente]))

;***Calculo 1:
(define (calculo1 examen1 examen2 tarea1 tarea2 numeroparticipaciones2)
  (+
   (* 0.20 examen1)
   (* 0.40 examen2)
   (* 0.20 tarea1)
   (* 0.20 tarea2)
   (* 0.1 numeroparticipaciones2)))
(define (clasificacioncalculo calculo1)
  (cond
    [(and(>= calculo1  0) (< calculo1 2))'Malo]
    [(and(>= calculo1 2) (< calculo1 3))'Deficiente]
    [(and(>= calculo1 3) (< calculo1 3.5))'Regular]
    [(and(>= calculo1 3.5) (< calculo1 4.5))'Bueno]
    [(and(>= calculo1 4.5) (<= calculo1 5))'Excelente]
    [else 'Exelente ]))

;***Ingles 1:
(define (ingles1 examen1 examen2 tarea1 tarea2 numeroparticipaciones2)
  (+
   (* 0.20 examen1)
   (* 0.40 examen2)
   (* 0.20 tarea1)
   (* 0.20 tarea2)
   (* 0.1 numeroparticipaciones2)))
(define (clasificacioningles ingles1)
  (cond
    [(and(>= ingles1 0) (< ingles1 3))'Deficiente]
    [(and(>= ingles1 3) (< ingles1 4))'Regular]
    [(and(>= ingles1 4) (< ingles1 4.5))'Bueno]
    [(and(>= ingles1 4.5) (<= ingles1 5))'Excelente]
    [else 'Exelente ]))

;***Deporte:
(define (deporte examen1 examen2 tarea1 tarea2 numeroparticipaciones2)
  (+
   (* 0.20 examen1)
   (* 0.40 examen2)
   (* 0.20 tarea1)
   (* 0.20 tarea2)
   (* 0.1 numeroparticipaciones2)))
(define (clasificaciondeporte deporte)
  (cond
    [(and(>= deporte 0) (< deporte 3))'Malo]
    [(and(>= deporte 3) (< deporte 4))'Regular]
    [(and(>= deporte 4) (<= deporte 5))'Excelente]
    [else 'Exelente ]))

;;PRUEBA:
(display "Fundamentos: ")

(clasificacion2 (fundamentos 5 4 3 4.2 55))
(display "Calculo 1: ")

(clasificacion2 (calculo1 5 4 3 4.2 55))
(display "Ingles 1: ")

(clasificacion2 (ingles1 4 3 2.9 4.2 10))
(display "Deporte: ")

(clasificacion2 (deporte 4 3 2.9 4.2 10))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;ANÁLISIS Y DEFINICIÓN DE DATOS:
;;(define-struct cargo (gerente secretario contador operario vigilante))
;;donde gerente, secretario, contador, operario y vigilante son cargos (símbolos)
;;y la estructura cargo define el tipo de cargo del operario 
;;
;;(define (salarioneto salario prestamo cargo)
;;salario y prestamo toman valores númericos mientras cargo sigue siendo símbolo
;;la función salario neto daria como resultado un número
;;
;;CONTRATO:#3
;;salarioneto: números->número
;;
;;PROPÓSITO: 
;;Cálcular el salario dependiendo del cargo del empleado
;;
;;EJEMPLOS:
;;salario=1000000 prestamo=200000 cargo=Contador
;Se espera que de un salario neto 706250
;;
;;Bosquejo:
;(define(puesto x)
;(cond
;  (equal?(gerente cargo)
;    (- salario(* (salario 0.05)
;                 (salario 0.04)
;                 (salario 0.03)))))
;;
;;DEFINICIÓN:
(define-struct cargo (gerente secretario contador operario vigilante))

(define (salarioneto salario prestamo cargo)
  (cond
    [(equal? 'gerente cargo)
     (- salario
      (* salario 0.05)
      (* salario 0.04)
      (* salario 0.03375)
      prestamo)]
    [(equal? 'secretario cargo)
     (- salario
      (* salario 0.03)
      (* salario 0.04)
      (* salario 0.03375)
      prestamo)]
    [(equal? 'contador cargo)
     (- salario
      (* salario 0.02)
      (* salario 0.04)
      (* salario 0.03375)
      prestamo)]
    [(equal? 'operario cargo)
     (- salario
      (* salario 0.015)
      (* salario 0.04)
      (* salario 0.03375)
      prestamo)]
    [(equal? 'vigilante cargo)
     (- salario
      (* salario 0.01)
      (* salario 0.04)
      (* salario 0.03375)
      prestamo)]
    [else "Cargo no disponible"]))

;;PRUEBA
(display "Salario neto: ")
(salarioneto 1000000 200000 'contador)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;ANÁLISIS Y DEFINICIÓN DE DATOS:
;;un Mundo es una estructura (define-struct Mundo (punto1 color1 punto2 color2 punto3 color3 punto4 color4 punto5 color5 punto6 color6))
;;punto1  punto2 punto3 punto4 punto5 punto6 son coordenadas y color1 color2 color3 color4 color5 color6 son colores
;;
;;CONTRATO:#4 
;;ObtenerColor: posn->simbolo
;;
;;PROPÓSITO:
;;Determinar en que color esta la coordenada seleccionada 
;;
;;EJEMPLO:
;;Coordenada 40 50
;;debe dar color rojo
;
;;RECUADRO
(start 340 240)
(draw-solid-rect(make-posn 20 20) 100 100 'black)
(draw-solid-rect(make-posn 120 20) 100 100 'red)
(draw-solid-rect(make-posn 220 20) 100 100 'yellow)
(draw-solid-rect(make-posn 20 120) 100 100 'gray)
(draw-solid-rect(make-posn 120 120) 100 100 'blue)
(draw-solid-rect(make-posn 220 120) 100 100 'green)
;;DEFINICION:
(define-struct Mundo (punto1 color1 punto2 color2 punto3 color3 punto4 color4 punto5 color5 punto6 color6))
(define ConsMundo(make-Mundo
                  (make-posn 20 20) 'black
                  (make-posn 120 20) 'red
                  (make-posn 220 20) 'yellow
                  (make-posn 20 120) 'gray
                  (make-posn 120 120) 'blue
                  (make-posn 220 120) 'green))

(define (ObtenerColor ubica ConsMundo)
  (cond
    [(and
      (and(>= (posn-x(wait-for-mouse-click))(posn-x(Mundo-punto1 ConsMundo)))
         (<= (posn-x(wait-for-mouse-click))(+(posn-x(Mundo-punto1 ConsMundo)) 100)))
      (and(>= (posn-y(wait-for-mouse-click))(posn-y(Mundo-punto1 ConsMundo)))
         (<= (posn-y(wait-for-mouse-click))(+(posn-y(Mundo-punto1 ConsMundo)) 100))))(Mundo-color1 ConsMundo)]
    [(and
      (and(>= (posn-x(wait-for-mouse-click))(+(posn-x(Mundo-punto2 ConsMundo)) 1))
         (<= (posn-x(wait-for-mouse-click))(+(posn-x(Mundo-punto2 ConsMundo)) 100)))
      (and(>= (posn-y(wait-for-mouse-click))(posn-y(Mundo-punto2 ConsMundo)))
         (<= (posn-y(wait-for-mouse-click))(+(posn-y(Mundo-punto2 ConsMundo)) 100))))(Mundo-color2 ConsMundo)]
    [(and
      (and(>= (posn-x(wait-for-mouse-click))(+(posn-x(Mundo-punto3 ConsMundo)) 1))
         (<= (posn-x(wait-for-mouse-click))(+(posn-x(Mundo-punto3 ConsMundo)) 100)))
      (and(>= (posn-y(wait-for-mouse-click))(posn-y(Mundo-punto3 ConsMundo)))
         (<= (posn-y(wait-for-mouse-click))(+(posn-y(Mundo-punto3 ConsMundo)) 100))))(Mundo-color3 ConsMundo)]
    [(and
      (and(>= (posn-x(wait-for-mouse-click))(posn-x(Mundo-punto4 ConsMundo)))
         (<= (posn-x(wait-for-mouse-click))(+(posn-x(Mundo-punto4 ConsMundo)) 100)))
      (and(>= (posn-y(wait-for-mouse-click))(+(posn-x(Mundo-punto4 ConsMundo)) 1))
         (<= (posn-y(wait-for-mouse-click))(+(posn-y(Mundo-punto4 ConsMundo)) 100))))(Mundo-color4 ConsMundo)]
    [(and
      (and(>= (posn-x(wait-for-mouse-click))(+(posn-x(Mundo-punto5 ConsMundo)) 1))
         (<= (posn-x(wait-for-mouse-click))(+(posn-x(Mundo-punto5 ConsMundo)) 100)))
      (and(>= (posn-y(wait-for-mouse-click))(+(posn-y(Mundo-punto5 ConsMundo)) 1))
         (<= (posn-y(wait-for-mouse-click))(+(posn-y(Mundo-punto5 ConsMundo)) 100))))(Mundo-color5 ConsMundo)]
    [(and
      (and(>= (posn-x(wait-for-mouse-click))(+(posn-x(Mundo-punto6 ConsMundo)) 1))
         (<= (posn-x(wait-for-mouse-click))(+(posn-x(Mundo-punto6 ConsMundo)) 100)))
      (and(>= (posn-y(wait-for-mouse-click))(+(posn-y(Mundo-punto6 ConsMundo)) 1))
         (<= (posn-y(wait-for-mouse-click))(+(posn-y(Mundo-punto6 ConsMundo)) 100))))(Mundo-color6 ConsMundo)]
    [else 'indefinido]))
(define ubica (wait-for-mouse-click))

;;PRUEBA:
(display "Color: ")
(ObtenerColor ubica ConsMundo)