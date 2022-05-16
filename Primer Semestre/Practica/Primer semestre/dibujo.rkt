;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname dibujo) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;;dibujar
(start 400 800)
;(start/cartesian-plane 30 30)
;(stop)
(draw-circle (make-posn 0 40) 30 'red)
(draw-solid-disk (make-posn 210 492) 20 'green)
(draw-solid-rect(make-posn 300 300) 50 35 'blue)