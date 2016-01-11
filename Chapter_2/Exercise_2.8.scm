// to create a substraction procedure for Alyssa's program 
=>

;defination of sub-interval
(define (sub-interval x y)
  (make-interval (-(lower-bound x) (lower-bound y))
                 (-(upper-bound x) (upper-bound y)))
)

; run

