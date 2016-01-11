// to modify Alyssa program (implementation of the interval abstraction)
=>

(define (make-interval a b) (cons a b) )

;for lower-bound 
(define (lower-bound n)
  (car n)
)

;for upper-bound
(define (upper-bound n)
  (cdr n)
)

; for addition
(define (add-interval x y)
  (make-interval (+(lower-bound x) (lower-bound y))
                 (+(upper-bound x) (upper-bound y)))
)

; run



