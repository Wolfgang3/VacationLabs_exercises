//compute phi by means of fixed-point procedure 
=>
// the golden ratio is phi=(1+sq_root(5))/2 ~ 1.6180 from section 1.2.2

// with reference to page 69 there is a procedure for the give problem

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

ex: (fixed-point (lambda (x) (/ (+ 1 (square_root 5)) 2)) 2 )

(fixed-point (lambda (x) (/ (+ 1 (square_root 5)) 2)

