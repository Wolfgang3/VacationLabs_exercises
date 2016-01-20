// 
=>
(define (deriv exp var)
  (cond ((number? exp) 0)
  ((variable? exp) (if (same-variable? exp var) 1 0))
  (else ((get 'deriv (operator exp)) (operands exp) var))
  )
)

(define (operator exp)
  (car exp)
)

(define (operands exp)
  (cdr exp)
)

;part a): 

;part b): procedure for derivatives of sums and product
;procedures of make-sum and make-product on page no: 149, 150

(define (addend s)
  (cadr s)
)

(define (augend s)
)

(define (multiplier p)
  (cadr p)
)

(define (multiplicand p)
  (caddr p)
)


(define (=number? exp num)
  (and (number? exp) (= exp num))
)

(define (make-sum a1 a2)
  (cond ((number? a1 0) a2)
        ((number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))
  )
)

(define (make-product)
  (cond ((or (= number? m1 0) (= number? m2 0)) 0)
        ((= number? m1 1) m2)
        ((= number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))
  )
)

;using the deriv procedure from exercise 2.58
(define (sum-deriv operands var)
  (make-sum (deriv (addend exp) var)
            (deriv (augend exp) var))
  )
)


(define (product-deriv exp var) 
  (make-sum (make-product (multiplier exp)
                          (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var)
                          (multiplicand exp))
  )
)


