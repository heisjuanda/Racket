#lang eopl


;; Especificación léxica
(define especificacion-lexica
  '(
    ;(espacio-blanco (whitespace) skip)
    (comentario (";" (arbno (not #\newline))) skip)
    (identificador (letter (arbno letter digit "?" "#" "¿")) symbol)
    (numero (digit (arbno digit)) number)
    (numero ("-" digit (arbno digit)) number)
    (numero (digit (arbno digit) "." digit (arbno digit)) number)
    (numero ("-" digit (arbno digit) "." digit (arbno digit)) number)
    (texto ("\"" (arbno letter digit) "\"") string)
    )
  )


;; Especificación gramatical
(define especificacion-gramatical
  '(
    (expresion (numero) exp-numero)
    (expresion (identificador) exp-literal)
    (expresion (texto) exp-texto)
    (expresion (booleano) exp-booleano)
    (expresion (primitiva "(" (separated-list expresion ",") ")") exp-primitiva)
    (booleano ("falso") false-bool)
    (booleano ("verdadero") verdadero-bool)
    (primitiva ("+") sum-prim)
    (primitiva ("-") minus-prim)
    (primitiva ("*") mult-prim)
    (primitiva ("/") div-prim)
    (primitiva ("%") modulo-prim)
    (primitiva (">=") mayor-igual-prim)
    (primitiva ("<=") menor-igual-prim)
    (primitiva (">") mayor-prim)
    (primitiva ("<") menor-prim)
    (primitiva ("y") y-prim)
    (primitiva ("o") o-prim)
    (primitiva ("o-exclusiva") oex-prim)
    (primitiva ("==>") implicacion-prim)
    (primitiva ("no") negacion-prim)
    )
  )


; Creación de Datatypes
(sllgen:make-define-datatypes especificacion-lexica especificacion-gramatical)

(define eval-program
  (lambda (exp)
    (cases expresion exp
      (exp-numero (numero) (list numero))
      (exp-literal (identificador) identificador)
      (exp-texto (texto) texto)
      (exp-booleano (booleano) booleano)
      (exp-primitiva (prim ls) (list prim ls))
      )
    )
  )

; Interpretador
(define interpretador
  (sllgen:make-rep-loop "-->" eval-program (sllgen:make-stream-parser especificacion-lexica especificacion-gramatical))
  )

;Prueba
(interpretador)