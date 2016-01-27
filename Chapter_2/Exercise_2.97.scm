// reduce-terms for polynomial
=>

;part b)
(define (reduce-integers n d)
  (let ((g (gcd n d)))
    (list (/ n g) (/ d g))
  )
)

;reduce-terms
(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (and (< n 0) (< d 0))
      (cons (/ (* n -1) g) (/ (* d -1) g))
      (cons (/ n g) (/ d g))
    )
  )
)

(define (reduce-terms n d)
)


;write reduce-poly, add-poly


;run
(define p1 (make-polynomial 'x '((1 1) (0 1))))
(define p2 (make-polynomial 'x '((3 1) (0 -1))))
(define p3 (make-polynomial 'x '((1 1))))
(define p4 (make-polynomial 'x '((2 1) (0 -1))))

(define rf1 (make-polynomial p1 p2))
(define rf2 (make-polynomial p3 p4))

(add rf1 rf2)
