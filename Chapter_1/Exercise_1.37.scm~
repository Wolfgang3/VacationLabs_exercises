// infinite continued fraction
=>
; for the part a) i solved using recursive process
(define (cont-frac n d k)
  (if 
    (= k 1)
    (/ (n k) (d k))
    (/ (n k) (+ (d k) (cont-frac n d (- k 1)))))
)
 

; iterative process for part b 
(define (cont-frac n d k)
  (define (iter result count)
    (if (= count k)
      result
    (iter (/ d (+ n result)) (+ count 1))))
  (iter 1 0)
)

ex: (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 10)

