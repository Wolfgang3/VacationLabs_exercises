// Lamberts formula
=>
// using the same procedure of exercise 1.37

(define (cont-frac n d k)
  (define (iter result count)
    (if (= count k)
      result
    (iter (/ d (+ n result)) (+ count 1))))
  (iter 1 0)
)

; as given in the book 
(define (tan-cf x k)
  (define (n k)
    (if 
      (= k 1)
      x
      (- (square x))))
  (define (d k)
    (- (* 2 k) 1))
  (cont-frac-iter n d k)
)

;first parameter must be i radiants (radiants=deg * pi/ 180)
ex: (tan-cf (* 30 (/ 3.14 180) ) 10)




