// subtration of polynomials
=>
;negate number
(define (negate-number n)
  (* -1 x)
)

;negate rational num
(define (negate-rational x)
  (make-rat (* -1 (numer x))
                  (denom x)
  )
)
;negate complex num
(define (negation-complex x)
  (make-complex (* -1 (real-part x))
                (* -1 (imag-part x))
  )
)

;now to form the negate package
(define (install-negate-package)
  (put 'negate '(number) negate-number)
  (put 'negate '(rational) negate-rational)
  (put 'negate '(complex) negate-complex)
)

(define (negate x) 
  (apply-generic 'negate x)
)

;subtract polynomial using the negate procedure created above
(define (sub-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
    (make-poly (variable p1)
               (add-terms (term-list p1)
                          (negate (term-list p2))
    )
    (error "polys not in same var-- SUB-POLY"
           (list p1 p2))
  )
)
