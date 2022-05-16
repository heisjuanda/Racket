 #lang eopl

;;constructores
(define register-int (lambda (s n)
                       (list 'register-int s n)))

(define register-sym (lambda (s s1)
                       (list 'register-sym s s1)))

(define register-l-int (lambda (s n reg)
                         (list 'register-l-int s n reg)))

(define register-l-sym (lambda (s s1 reg)
                         (list 'register-l-sym s s1 reg)))
;;OBSERVADORES
;;predicados
(define register-int? (lambda (reg)
                        (cond
                          [(equal? 'register-int (car reg))]
                          [else #F]))) 

(define register-sym? (lambda (reg)
                        (cond
                          [(equal? 'register-sym (car reg))]
                          [else #F])))

(define register-l-sym? (lambda (reg)
                         (cond
                           [(equal? 'register-l-sym (car reg))]
                           [else #F])))

(define register-l-int? (lambda (reg)
                         (cond
                           [(equal? 'register-l-int (car reg))]
                           [else #F])))

;;extractores
(define register-int->sym (lambda (reg)
                            (cadr reg)))

(define register-int->int (lambda (reg)
                            (caddr reg)))
;; register-int
(define register-sym->sym (lambda (reg)
                            (cadr reg)))

(define register-sym->sym2 (lambda (reg)
                            (caddr reg)))
;;register-sym
(define register-l-int->sym (lambda (reg)
                            (cadr reg)))

(define register-l-int->int (lambda (reg)
                             (caddr reg)))

(define register-l-int->reg (lambda (reg)
                             (cadddr reg)))
;;register-l-int
(define register-l-sym->sym (lambda (reg)
                            (cadr reg)))

(define register-l-sym->sym1 (lambda (reg)
                             (caddr reg)))

(define register-l-sym->reg (lambda (reg)
                             (cadddr reg)))
;;register-l-sym

;;área del programador

;;LISTA DE SÍMBOLOS
(define symbol-list (lambda (reg) 
                      (cond
                        [(register-int? reg)(list(register-int->sym reg))]
                        [(register-sym? reg) (list (register-sym->sym reg) (register-sym->sym2 reg))]
                        [(register-l-int? reg)
                         (append (list(register-l-int->sym reg))(symbol-list(register-l-int->reg reg)))]
                        [(register-l-sym? reg)
                         (append (list(register-l-sym->sym reg)) (list(register-l-sym->sym1 reg))
                                 (symbol-list(register-l-sym->reg reg)))]
                        [else '()]
                        )))

;;LISTA NÚMEROS
(define number-list (lambda (reg) 
                      (cond
                        [(register-int? reg)(list(register-int->int reg))]
                        [(register-sym? reg) '()]
                        [(register-l-int? reg) (append (list(register-l-int->int reg))(number-list(register-l-int->reg reg)))]
                        [(register-l-sym? reg)
                         (append 
                                 (number-list(register-l-sym->reg reg)))]
                        [else '()]
                        )))

;;SUMAR NÚMEROS
(define plus (lambda (reg) 
                      (cond
                        [(register-int? reg) (register-int->int reg)]
                        [(register-sym? reg) 0]
                        [(register-l-int? reg) (+ (register-l-int->int reg)(plus(register-l-int->reg reg)))]
                        [(register-l-sym? reg)
                         (+ 
                                 (plus(register-l-sym->reg reg)))]
                        [else '()]
                        )))

;;DEVOLVER DATOS PARES

(define devolver (lambda (reg s) 
                      (cond
                        [(register-int? reg) (cond
                                               [(equal?(register-int->sym reg)s) (list(register-int->sym reg)(register-int->int reg))]
                                               [else "no encontrado"])]
                        [(register-sym? reg) (cond
                                               [(equal?(register-sym->sym reg)s) (list(register-sym->sym reg)(register-sym->sym2 reg))]
                                               [else "no encontrado"])]
                        [(register-l-int? reg)(cond
                                                [(equal? (register-l-int->sym reg)s) (append (list (register-l-int->sym reg))(list(register-l-int->int reg)))]
                                                [(append (list(devolver(register-l-sym->reg reg)s)))]
                                                [else "no encontrado"])]
                        [(register-l-sym? reg)(cond
                                                [(equal? (register-l-sym->sym reg)s) (append (list (register-l-sym->sym reg))(list(register-l-sym->sym1 reg)))]
                                                [(append (list(devolver(register-l-sym->reg reg) s)))]
                                                [else "no encontrado"])]
                        [else '()]
                        )))

;;EJEMPLOS
(define registro1(register-int 'x 4))
(define registro2(register-sym 'x 'y))
(define registro3(register-l-int 'x 4 (register-l-int 'y 4 (register-sym 'x 'x))))
(define registro4(register-l-sym 'p 'x (register-sym 'x 'x)))



(display (symbol-list(register-int 'x 4)))
(display "
") 
(display (symbol-list(register-sym 'x 'y)))
(display "
")
(display (symbol-list(register-l-int 'x 4 (register-l-int 'y 4 (register-sym 'x 'x)))))
(display "
")
(display (symbol-list(register-l-sym 'p 'x (register-sym 'x 'x))))

(display "
lista números
")
(display (number-list(register-int 'x 4)))
(display "
") 
(display (number-list(register-sym 'x 'y)))
(display "
")
(display (number-list(register-l-int 'x 4 (register-l-int 'y 4 (register-sym 'x 'x)))))
(display "
")
(display (number-list(register-l-sym 'p 'x (register-sym 'x 'x))))

(display "
suma números
")
(display (plus(register-int 'x 4)))
(display "
") 
(display (plus(register-sym 'x 'y)))
(display "
")
(display (plus(register-l-int 'x 4 (register-l-int 'y 4 (register-sym 'x 'x)))))
(display "
")
(display (plus(register-l-sym 'p 'x (register-sym 'x 'x))))

(display "
devolver parejas
")
(display (devolver registro1 'x))
(display "
") 
(display (devolver registro2 'x ))
(display "
")
(display (devolver registro3 'y))
(display "
")
(display (devolver registro4 'x))