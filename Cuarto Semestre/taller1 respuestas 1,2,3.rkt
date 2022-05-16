#lang eopl

;;primera
(define countDown (lambda (x)
                    (cond
                      [(number? x)
                       (cond
                         [(> 0 x)'()]
                         [(= 0 x)0]
                         [(> x 0)
                          (append (list x)(countDown (- x 1)))])]
                      [else eopl:error"mal"])))
(display "
primera
")
(display (countDown 5))
(display "
")
(display (countDown 10))
(display "
")
(display (countDown -5))


;;segunda

(define insertL (lambda (a b lst)
                  (cond
                    [(null? lst)'()]
                    [(and (symbol? a)(symbol? b))
                     (cond
                       [(equal?(car lst)a)
                        (append (list b)(list (car lst))(insertL a b(cdr lst)))]
                       [(equal?(car lst)b)
                        (append (list (car lst))(insertL a b(cdr lst)))]
                       [else (append (list (car lst))(insertL a b(cdr lst)))])]
                    [else "xd"])))

(display "
segunda
")
(display (insertL  'x  'y  '( x z z x y x ) ))
(display "
")
(display (insertL 's 't '(s s s t t t s u)))


;;tercera
(define compareLists (lambda (lst1 lst2)
                       (cond
                         [(equal? (length lst1)(length lst2))
                          (cond
                            [(and (null? lst1)(null? lst2))#T]
                            [(and(equal? (car lst1) (car lst2))(compareLists (cdr lst1)(cdr lst2)))#T]
                            [else #F])]
                         [else #F])))

(display "
tercera
")
(display (compareLists '( x z z x y x ) '( x z z x y x ) ))
(display "
")
(display (compareLists  '( x z z x y x ) '( x z z x y)))
(display "
")
(display (compareLists  '() '()))
(display "
")
(display (compareLists  '(1 2 3 ) '(3 2 1)))
(display "
")
(display (compareLists '((a)b(c d)d) '((a)b(c d)d)))

;;cuarta

(define binaryToDecimal (lambda (x)
(cond
[(null? x)0]
[(or(equal? (car x)1)(equal? 0 (car x))) 
  (+(*(expt 2 (- (length x) 1))(car x))(binaryToDecimal (cdr x)))])))
 
 (display "
cuarta
 ")
 (display (binaryToDecimal '(1 1 1)))
 (display "
 ")
 (display (binaryToDecimal '(1 1 1 1 0)))

;;quinta

(define cartesianProduct (lambda (lst1 lst2)
                           ))

(display "
quinta
 ")
 (display (cartesianProduct '(1 1 1) '(2 2 2))) 
 (display "
 ")
 (display (cartesianProduct '(q w e)'(r r r)))