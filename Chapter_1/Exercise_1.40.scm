// procedure for cube method for newtons-method
=>
// with reference to procedures on page no. 73,74,75 and first-point from page no. 69

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess)
)

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx))
)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x) )))
)

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess)
)

(define (cube n) (* n n n ))

;now to define the given cubix expression
(define (cubic a b c) 
	(lambda (x) (+ (cube x) 
		    (* a (square x)) 
                    (* b x) 
		    c )
        )
)


;// (newtons-method (cubic 3 4 5) 0)







