// Bens suggestion to modify mul-interval
=>
 
(define (make-center-width c w)
  (make-interval (- c w) (+ c w))
)

(define (center i)
  (/ (+ (lower-bound i) (uper-bound i)) 2 )
)

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2)
)
