// Lem demonstration
=>
;from procedures define in exercise 2.13

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


(define (make-interval a b) (cons a b))

(define (make-center-percent c p)
  (make-interval (* c (- 1 (/ p 100))) 
                 (* c (+ 1 (/ p 100)))
  )
)

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2))
)

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))
  )
)

(define r1 (make-center-percent 50 2)
)

(define r2 (make-center-percent 100 4)
)

(par1 r1 r2)
(par2 r1 r2)

;value= (30.348387096774193 . 30.348387096774193)
