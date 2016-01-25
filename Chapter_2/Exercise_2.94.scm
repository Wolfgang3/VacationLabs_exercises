// implement remainder-terms procedure
=>
;same variable (pg no. 148)
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;from the procedure of div-poly of exercise 2.91
(define (remainder-terms x y)
  (cdr (div-poly x y))
)

;using prev procedure
(define (gcd-terms a b)
  (if (empty-termlist? b)
    a
    (gcd-terms b (remainder-terms a b))
  )
)

;for the gcd-poly procedure(using ex 91) and refering to the div-terms procedure
(define (gcd-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
        (div-terms (term-list p1)
                   (term-list p2))
      )
    (error "variables are different")
  )
)

;run
(define p1 (make-polynomial 'x '((4 1) (3 -1) (2 -2) (1 2))))
(define p2 (make-polynomial 'x '((3 1) (1 -1))))
(gcd-poly p1 p2)
;variables are different
