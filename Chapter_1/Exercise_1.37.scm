// infinite continued fraction
=>
; for the part a) i solved using recursive process
(define (cont-frac n d k)
	(if (= k 0)
		(/ n d)
	(/ n (+ d (cont-frac n d (- k 1)))))
)
 
ex: (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)

; iterative process for part b 
(define (cont-frac n d k)
  (define (iter result count)
    (if (= count k)
      result
    (iter (/ d (+ n result)) (+ count 1))))
  (iter 1 0)
)

