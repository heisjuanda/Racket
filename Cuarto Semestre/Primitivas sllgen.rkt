#lang eopl
;<programa>  ::= <exp>
;                a-program (expt)
;<exp>       ::= <num>
;                lit-exp (datum)
;            ::= <id>
;                var-exp (id)
;            ::=<primitiva>({<exp>}*(,))
;
;<primitiva> ::= + | - | * | add 1 | sub 1

(define especificacion-lexica
  '(
  (espacio-blanco (whitespace)skip)
  (comentario("%"(arbno(not #\newline)))skip)
  (identificador (letter (arbno(or letter digit "?" "$")))symbol)
  (numero (digit(arbno digit))number)
  (numero("-" digit(arbno digit))number)
  (numero(digit(arbno digit)"." digit(arbno digit))number)
  (numero ("-" digit (arbno digit)"."digit(arbno digit))number)))

(define especificacion-gramatical
  '(
    (programa (exp) a-program)
    (exp (numero)lit-exp)
    (exp (identificador)var-exp)
    (exp (primitiva "("(separated-list exp ",")")")prim-exp)
    (primitiva ("+")sum-prim)
    (primitiva ("-")rest-prim)
    (primitiva ("*")mult-prim)
    (primitiva ("/")div-prim)
    (primitiva ("add 1")add-prim)
    (primitiva ("sub 1")sub-prim)
    ))

(sllgen:make-define-datatypes
 especificacion-lexica especificacion-gramatical)


;;ambiente
(define-datatype ambiente ambiente?
  (ambiente-vacio)
  (ambiente-extendido
   (identificador (list-of symbol?))
   (valores (list-of valor?))
   (ambiente-ex ambiente?)))

(define valor? (lambda (x)
                 #true))
(define apply-env (lambda (env sym)
                    (cases ambiente env
                      (ambiente-vacio () (eopl:error"no esta la variable " sym))
                      (ambiente-extendido (id val env-old)
                                          (letrec
                                              (
                                            (buscar-sym (lambda (id val sym)
                                               (cond
                                                 [(null? id)(apply-env env-old sym)]
                                                 [(equal? (car id)sym)(car val)]
                                                 [else (buscar-sym (cdr id)(cdr val)sym)])))
                                            )(buscar-sym id val sym)
                                            )
                                          ))))
;;ambiente inicial
(define ambiente-inicial
  (ambiente-extendido '(x y z) '(1 2 3)
                      (ambiente-extendido '(a b c) '(4 5 6)
                                          (ambiente-vacio))))


;;funcion principal
(define eval-prog (lambda (prog)
                    (cases programa prog
                      (a-program (exp) (evaluar-expresion exp ambiente-inicial)))))
;;funcion de trabajo
(define evaluar-expresion (lambda (expt amb)
                            (cases exp expt
                              (lit-exp (dato)dato)
                              (var-exp (id)(apply-env amb id))
                              (prim-exp (prim list-exp)
                                        (let
                                            (
                                             (lista-val (map (lambda (x)(evaluar-expresion x amb))list-exp))    
                                             ) 
                                           (evaluar-primitiva prim lista-val)
                                          )))))
;;menejo de primitivas
(define evaluar-primitiva (lambda (prim val)
                            (cases primitiva prim
                              (sum-prim ()(operacion-primitiva val + 0))
                              (rest-prim ()(operacion-primitiva val - 0))
                              (mult-prim ()(operacion-primitiva val * 1))
                              (div-prim ()(operacion-primitiva val / 1))
                              (add-prim () (+ (car val)1))
                              (sub-prim ()(- (car val)1)))))

(define operacion-primitiva (lambda (val op term)
                              (cond
                                [(null? val)term]
                                [else (op(car val)
                                         (operacion-primitiva (cdr val)op term))])))

;;interpretador
(define interpretador
  (sllgen:make-rep-loop "-->" eval-prog
  (sllgen:make-stream-parser
   especificacion-lexica especificacion-gramatical)))
(display (interpretador))

