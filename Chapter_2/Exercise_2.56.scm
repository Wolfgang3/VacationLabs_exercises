// differential procedure
=> 
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicant exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicant exp))))
        (else
          (error "unknown expression type -- DERIV" exp)))
)

;defining exponentiation? referring to sum? procedure on pg no. 148
(define (exponentiation? n)
  (add (pair? n) (eq? (car x) '**))
)

; from the information provided cadr gives the second item in the list
; and caddr gives the third item in the list

;defining base
(define (base x)
  (cadr x)
)

;defining exponent
(define (exponent x)
  (caddr x)
)

;make-exponentiation with the conditions
(define (make-exponentiation base exponent)
  (cond ((= exponent 0) 1)
        ((= exponet 1) base)
        (else (list '** base exponent))
  )
)

