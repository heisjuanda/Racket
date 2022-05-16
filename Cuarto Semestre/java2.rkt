#lang eopl
#|
Para la especificación léxica

    Los comentarios inician con punto y coma ";" y son de una linea
    Se tienen números positivos y negativos enteros y en punto flotante
    Todo texto inicia con comillas y termina en comillas
    Los identificadores inician con una letra seguido de cualquier numero de carácteres alfanumericos y simbolos especiales como ? ¿ #
<programa> ::= <expresion>
                (a-program (exp))
<expresion> ::= <identificador>
                             exp-literal(id)
                         ::= <numero>
                             exp-numero(dato)
                         ::=<texto>
                             exp-texto(dato)
                         ::= <booleano>
                            exp-booleano(dato)
                         ::= <primitiva>   "(" <expresion>*(,) ")"
                            exp-primitiva(op,expresiones)

<booleano> ::= "falso" | "verdadero"
                            (false-bool) | (verdadero-bool)

<primitiva> ::= "+"
                           sum-prim
                       ::= "-"
                           resta-prim
                       ::= "*"
                           mult-prim
                       ::= "/"
                           div-prim
                       ::= "%"
                           modulo-prim                      
                       ::= "<="
                           mayor-igual-prim
                        ::= ">="
                            menor-igual-prim
                        ::= ">"
                            mayor-prim
                         ::= "<"
                            menor-prim
                         ::= "y"
                            y-prim
                         ::= "o"
                            o-prim
                         ::= "o-exclusiva"
                            oex-prim
                         ::= "==>"
                            implicacion-prim
                         ::= "no"
                            negacion-prim
|#
(define lexica
  '(
    (comentario (";" (arbno (not #\newline))) skip)
    (espacio-blanco (whitespace) skip)
    (numero (digit (arbno digit)) number)
    (numero ("-" digit (arbno digit)) number)
    (numero (digit (arbno digit) "." digit (arbno digit)) number)
    (numero ("-" digit (arbno digit) "." digit (arbno digit)) number)
    (texto ("\"" (or letter digit) (arbno (or letter whitespace digit "?" "¿")) "\"") string)
    (identificador (letter (arbno (or digit "?" letter "#" "¿" ))) symbol)
    ))

(define gramatical
  '(
    (programa (expresion) un-programa)
    (expresion (identificador) exp-literal)
    (expresion (numero) exp-numero)
    (expresion (booleano) exp-booleano)
    (expresion (texto) exp-texto)
    (expresion (primitiva "(" (separated-list expresion ",") ")") exp-primitiva)
    
    (expresion ("si" expresion "entonces" expresion "sino" expresion)exp-si)
    
    (expresion ("local" (arbno identificador "=" expresion) "en" expresion)exp-let)
    (expresion ("local-recursivo" (arbno identificador "(" (separated-list identificador ",") ")" "=" expresion) "en" expresion) letrec-exp)

     ;;Asignación
    (expresion ("inicio" expresion (arbno ";" expresion) "final") begin-exp)
    (expresion ("cambiar" identificador "=" expresion) set-exp)

    
    (expresion ("funcion" "(" (separated-list identificador ",") ")" expresion)exp-proc)
    (expresion ("(" expresion (arbno expresion) ")" )exp-app)

    (expresion("arreglo" "["(separated-list expresion ",")"]")exp-arreglo)
    (expresion("acceso" primitiva "." expresion)exp-pos)

    (primitiva("cuarto")cadddr-prim)
    (primitiva("tercero")caddr-prim)
    (primitiva("segundo")cadr-prim)
    (primitiva("primero")car-prim)
    (primitiva ("lista")lista-prim)
    (primitiva ("añadir1") add-prim)
    (primitiva ("quitar1") less-prim)
    (primitiva ("+") sum-prim)
    (primitiva ("-") minus-prim)
    (primitiva ("*") mult-prim)
    (primitiva ("/") div-prim)
    (primitiva ("%") mod-prim)
    (primitiva ("==") igual-prim)
    (primitiva (">=") mayor-igual-prim)
    (primitiva ("<=") menor-igual-prim)
    (primitiva (">") mayor-prim)
    (primitiva ("<") menor-prim)
    (primitiva ("Y") y-prim)
    (primitiva ("O") o-prim)
    (primitiva ("O-ex") oex-prim)
    (primitiva ("==>") implicacion-prim)
    (primitiva ("No") no-prim)
    (primitiva ("logaritmo")log-prim)
    (primitiva ("potencia")potencia-prim)
    (booleano ("verdadero") verdadero-bool)
    (booleano ("falso") falso-bool)
    (primitiva("uno")1-prim)
    (primitiva("dos")2-prim)
    (primitiva("tres")3-prim)))




;;Construir los datatypes

(sllgen:make-define-datatypes lexica gramatical)

(define mostrar-tipoDeDatos
  (lambda () (sllgen:list-define-datatypes lexica gramatical)))

(define escanear
    (sllgen:make-string-scanner lexica gramatical))

(define parser
  (sllgen:make-string-parser lexica gramatical))

(define interpretador
  (sllgen:make-rep-loop "¡LANGLIBERTAD! "
    (lambda (pgm) (evaluar-programa pgm))
    (sllgen:make-stream-parser 
      lexica
      gramatical)))


;;Evaluar programa
(define evaluar-programa
  (lambda (p)
    (cases programa p
      (un-programa (e) (evaluar-expresion e ambiente-inicial)))))

;;ambientes

(define-datatype ambiente ambiente?
  (ambiente-vacio)
  (ambiente-extendido-ref
   (lids (list-of symbol?))
   (lvalue vector?)
   (old-env ambiente?)))

(define ambiente-extendido
  (lambda (lids lvalue old-env)
    (ambiente-extendido-ref lids (list->vector lvalue) old-env)))

(define aplicar-ambiente
  (lambda (env var)
    (deref (apply-env-ref env var))))

;;Implementación ambiente extendido recursivo

(define ambiente-extendido-recursivo
  (lambda (procnames lidss cuerpos old-env)
    (let
        (
         (vec-clausuras (make-vector (length procnames)))
         )
      (letrec
          (
           (amb (ambiente-extendido-ref procnames vec-clausuras old-env))
           (obtener-clausuras
            (lambda (lidss cuerpos pos)
              (cond
                [(null? lidss) amb]
                [else
                 (begin
                   (vector-set! vec-clausuras pos
                                (closure (car lidss) (car cuerpos) amb))
                   (obtener-clausuras (cdr lidss) (cdr cuerpos) (+ pos 1)))]
                )
              )
            )
           )
        (obtener-clausuras lidss cuerpos 0)
        )
      )
    )
  )


(define apply-env
  (lambda (env var)
    (deref (apply-env-ref env var))))


(define apply-env-ref
  (lambda (env var)
    (cases ambiente env
      (ambiente-vacio () (eopl:error "No se encuentra la variable " var))
      (ambiente-extendido-ref (lid vec old-env)
                          (letrec
                              (
                               (buscar-variable (lambda (lid vec pos)
                                                  (cond
                                                    [(null? lid) (apply-env-ref old-env var)]
                                                    [(equal? (car lid) var) (a-ref pos vec)]
                                                    [else
                                                     (buscar-variable (cdr lid) vec (+ pos 1)  )]
                                                    )
                                                  )
                                                )
                               )
                            (buscar-variable lid vec 0)
                            )
                          
                          )
      
      )
    )
  )

(define ambiente-inicial
  (ambiente-extendido '(x y z) '(4 2 5)
                      (ambiente-extendido '(f b c) '(4 5 6)
                                          (ambiente-vacio))))

;;Evaluar expresion
(define evaluar-expresion
  (lambda (exp amb)
    (cases expresion exp
      (exp-literal (id) (aplicar-ambiente amb id))
      (exp-numero (dato) dato)
      (exp-texto (dato) dato)
      ;;Booleanos
      (exp-booleano (dato) (evaluar-booleano dato))
      ;;Fin booleanos
      (exp-primitiva (prim args)
                (let
                    (
                     (lista-numeros (map (lambda (x) (evaluar-expresion x amb)) args))
                     )
                  (aplicar-primitiva prim lista-numeros)
                  )
                )
      ;;Condicionales
      (exp-si (condicion hace-verdadero hace-falso)
              (if
               (evaluar-expresion condicion amb) ;;Evaluamos la condición
               (evaluar-expresion hace-verdadero amb) ;;En caso de que sea verdadero
               (evaluar-expresion hace-falso amb) ;;En caso de que sea falso
               )
              )
      ;;Ligaduras locales
      (exp-let (ids rands body)
               (let
                   (
                    (lvalues (map (lambda (x) (evaluar-expresion x amb)) rands))
                    )
                 (evaluar-expresion body (ambiente-extendido ids lvalues amb))
                 )
               )
      ;;procedimientos
      (exp-proc (ids body)
                (closure ids body amb))
      (exp-app (rator rands)
               (let
                   (
                    (lrands (map (lambda (x) (evaluar-expresion x amb)) rands))
                    (procV (evaluar-expresion rator amb))
                    )
                 (if
                  (procval? procV)
                  (cases procval procV
                    (closure (lid body old-env)
                             (if (= (length lid) (length lrands))
                                 (evaluar-expresion body
                                                (ambiente-extendido lid lrands old-env))
                                 (eopl:error "El número de argumentos no es correcto, debe enviar" (length lid)  " y usted ha enviado" (length lrands))
                                 )
                             ))
                  (eopl:error "No puede evaluarse algo que no sea un procedimiento" procV) 
                  )
                 )
               )

      
      ;;letrec
      (letrec-exp (procnames idss cuerpos cuerpo-letrec)
                  (evaluar-expresion cuerpo-letrec
                                     (ambiente-extendido-recursivo procnames idss cuerpos amb)))

      ;;Asignación
      ;;begin
      (begin-exp (exp lexp)
                 (if
                  (null? lexp)
                  (evaluar-expresion exp amb)
                  (begin
                    (evaluar-expresion exp amb)
                    (letrec
                        (
                         (evaluar-begin (lambda (lexp)
                                          (cond
                                            [(null? (cdr lexp)) (evaluar-expresion (car lexp) amb)]
                                            [else
                                             (begin
                                               (evaluar-expresion (car lexp) amb)
                                               (evaluar-begin (cdr lexp))
                                               )
                                             ]
                                            )
                                          )
                                        )
                         )
                      (evaluar-begin lexp)
                      )
                    )
                  )
                 )
      ;;set
      (set-exp (id exp)
               (begin
                 (setref!
                  (apply-env-ref amb id)
                  (evaluar-expresion exp amb))
                 1)
               )

      (exp-arreglo(args)
                  (let
                    (
                     (lista-numeros (map (lambda (x) (evaluar-expresion x amb)) args))
                     )
                  (aplicar-primitiva (lista-prim) lista-numeros)
                  ))
      (exp-pos(id exp)
              (aplicar-primitiva id exp))
      )
    

    )
  )
(define aplicarL(lambda(x)
                  (cond
                    [(list? x)(cond
                                [(null? x)'()]
                                [else (list (car x))(list (aplicarL (cdr x)))])]
                    [else eopl:error"mal"])))

(define aplicar-primitiva
  (lambda (prim lista)
    (cases primitiva prim
      (1-prim()(list-ref lista 0))
      (2-prim()(list-ref lista 1))
      (3-prim()(list-ref lista 2))
      (car-prim()(car lista))
      (cadr-prim()(cadr lista))
      (caddr-prim()(caddr lista))
      (cadddr-prim()(cadddr lista))
      (lista-prim() (append lista))
      (add-prim () (+ (car lista) 1))
      (less-prim ()(- (car lista) 1))
      (sum-prim () (operacion lista + 0))
      (minus-prim () (operacion lista - 0))
      (mult-prim () (operacion lista * 1))
      (div-prim () (operacion lista / 1))
      (mod-prim () (operacion (car lista) (cadr lista)))
      (igual-prim () (equal? (car lista)(cadr lista)))
      (mayor-igual-prim () (>= (car lista) (cadr lista)))
      (mayor-prim () (> (car lista) (cadr lista)))
      (menor-igual-prim () (<= (car lista) (cadr lista)))
      (menor-prim () (< (car lista) (cadr lista)))
      (y-prim () (operar lista (lambda (x y) (and x y)) #T))
      (o-prim () (operar lista (lambda (x y) (or x y)) #F))
      (oex-prim () (if (eqv? (car lista) (cadr lista)) #F #T))
      (implicacion-prim () (or (not (car lista)) (cadr lista)))
      (no-prim () (not (car lista)))
      (log-prim ()(log (cadr lista)(car lista)))
      (potencia-prim ()(expt (car lista)(cadr lista)))
      (else 0))))

(define operacion (lambda (lista simbolo af)
                    (cond
                      [(null? lista)af]
                      [else (simbolo (car lista)(operacion (cdr lista)simbolo af))])))

(define op (lambda (lista s af)
             (cond
               [(null? lista)0]
               [(equal? - s)(-(car lista)(op (cdr lista)s af))]
               [(equal? + s)(+(car lista)(op (cdr lista)s af))]
               [(equal? / s)(/(car lista)(op (cdr lista)s af))]
               [(equal? * s)(*(car lista)(op (cdr lista)s af))])))

(define operar
  (lambda (lista sym acc [res acc])
    (cond
      [(null? lista) res]
      [else
       (operar (cdr lista) sym acc (sym res (car lista)))])))

(define evaluar-booleano
  (lambda (bool)
    (cases booleano bool
      (falso-bool () #F)
      (verdadero-bool () #T))))


(define operacion-prim
  (lambda (lval op term)
    (cond
      [(null? lval) term]
      [else
       (op
        (car lval)
        (operacion-prim (cdr lval) op term))
       ]
      )
    )
  )

;;Definiciones para los procedimientos
(define-datatype procval procval?
  (closure (lid (list-of symbol?))
           (body expresion?)
           (amb-creation ambiente?)))

;;Referencias

(define-datatype referencia referencia?
  (a-ref (pos number?)
         (vec vector?)))

;;Extractor de referencias
(define deref
  (lambda (ref)
    (primitiva-deref ref)))

(define primitiva-deref
  (lambda (ref)
    (cases referencia ref
      (a-ref (pos vec)
             (vector-ref vec pos)))))

;;Asignación/cambio referencias
(define setref!
  (lambda (ref val)
    (primitiva-setref! ref val)))

(define primitiva-setref!
  (lambda (ref val)
    (cases referencia ref
      (a-ref (pos vec)
             (vector-set! vec pos val)))))


(interpretador)