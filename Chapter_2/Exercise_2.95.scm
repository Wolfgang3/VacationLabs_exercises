//
=>
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

;from the questions
;p1= x^2 -2x +1
(define p1 (make-polynomial 'x ((2 1) (1 -2) (0 1))))
;p2= 11x^2 +7
(define p1 (make-polynomial 'x ((2 11) (0 7))))
;p3= 13x +5
(define p1 (make-polynomial 'x ((1 13) (0 5))))

;define Q1 as the product of p1 and p2
(define Q1 (mul-poly p1 p2))
;define Q2 as the product of p1 and p3
(define Q2 (mul-poly p1 p3))
