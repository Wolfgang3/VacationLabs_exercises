// iterative-improve of sqrt in session 1.1.7
=> 
; with reference from earlier sessions sqrt and fixed-point
(define tolerance 0.000001)

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
	guess
	(improve guess)))
)

(define (good-enough? v1 v2) 
   (< (/ (abs (- v1 v2)) v2)  tolerance)
) 

;sqrt with iterative-improve
(define (sqrt x) 
)

;fixed-point with iterative-improve
(define (fixed-point f guess) 
  ((iterative-improve f good-enough?) guess)
) 


