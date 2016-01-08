// iterative-improve of sqrt in session 1.1.7
=> 
; with reference from earlier sessions sqrt and fixed-point
(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
	guess
	(improve guess))
  )
)

(define tolerance 0.00001)

(define (good-enough? guess x) 
   (< (/ (abs (- square guess)) x)  tolerance)
) 

;sqrt with iterative-improve by refering to sqrt procedure on pg 75
(define (sqrt x) 
   ((iterative-improve   
     (lambda (y) 
       (/ (+ (/ x y) y) 2)) 
     close-enough?) 1.0)
)

;fixed-point with iterative-improve
(define (fixed-point f guess) 
  ((iterative-improve f good-enough?) guess)
) 


