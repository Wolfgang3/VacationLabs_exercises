// modify differential program to pring the expression in a infix form rather than a postfix form 
=> 
;part a) assuming the given expression is fully parenthesized
;referring to previous exercise 2.57
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;changing make-sum and make-product
(define (make-sum a1 a2)
  (cond 
    ((=number? a1 0) a2)
    ((=number? a2 0) a1)
    ((and (number? a1) (number? a2)) (+ a1 a2))
    (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond 
    ((or (=number? m1 0) (=number? m2 0)) 0)
    ((=number? m1 1) m2)
    ((=number? m2 1) m1)
    ((and (number? m1) (number? m2)) (* m1 m2))
    (else (list m1 '* m2))))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))


(define (addend s) (car s))

(define (augend s)
  (caddr s)
)

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) 
  (car p))

(define (multiplicand p)
  (caddr p))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

;;;;;
;;;
(define (base exp)
  (car exp))

(define (exponent exp)
  (caddr exp))

(define (exponentiation? exp)
  (and (pair? exp) (eq? (cadr exp) '**)))

(define (make-exponentiation base exponent)
  (cond 
    ((= exponent 0) 1)
    ((= exponent 1) base)
    (else (list base '** exponent))))

;deriv procedure
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
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        (else
          (error "unknown expression type -- DERIV" exp)))
)

;run (pass the expression of the prev exercise in infix form)
(deriv '(x + (3 * (x + (y + 2)))) 'x)
;value= ??

;;;;;;;;;;;;;;;;;;;;


