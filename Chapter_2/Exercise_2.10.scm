// ben bitdiddle modification on alyssa's code
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

;mul-interval
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
  (make-interval (min p1 p2 p3 p4)
                 (min p1 p2 p3 p4)))
)

;modified div-interval
(define (div-interval x y)
  (if (and 
      (<= (lower-bound y) 0)
      (>= (upper-bound y) 0)
      ) 
    (display "STOPED=> cant divide by zero")

    (mul-interval x
      (make-interval (/ 1.0 (upper-bound y))
		     (/ 1.0 (lower-bound y)) ))
  )
)

 
;run
(div-interval (make-interval 1 5) (make-interval -6 12))  
;=>STOPED=> cant divide by zero

(div-interval (make-interval 1 5) (make-interval 6 12))  
;Value= (.08333333333333333 . .08333333333333333)  

