// make-center-percentage
=>
;ex: percentage tolerance is 3.5 +_ 0.15 i.e. same as [3.35,3.65]

(define (make-interval a b) (cons a b))

(define (selector_percent x) (/ x 100))  ; since its in % we div by 100

(define (make-center-percent center per_tolerance)    
    	(make-interval (- center (selector_percent per_tolerance)) (+ center (selector_percent per_tolerance)) )
)



