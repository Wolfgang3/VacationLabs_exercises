// to modify Alyssa program (implementation of the interval abstraction)
=>

; for addition
(define (add-interval x y)
  (make-interval (+(lower-bound x) (lower-bound y))
                 (+(upper-bound x) (upper-bound y)))
)


;run
(define (make-interval a b) (cons a b) )


