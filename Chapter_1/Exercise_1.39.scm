// Lamberts formula
=>
// using the same procedure of exercise 1.37

; as given in the book 
(define (tan-cf x count)
  (define (n count)
    (if (= count 1)
      x
      (- (square x))))
  (define (d count)
    (- (* 2 count) 1))
  (cont-frac n d count)
)

(define (cont-frac n d count)
  (define (iter count result)
    (if (= count 0)
      result
      (iter (- count 1) (/ (n count) (+ result (d count))))))
  (iter count 0.0)
)

;first parameter must be in radiants (radiants=deg * pi/ 180)
ex: (tan-cf (* 30 (/ 3.14 180) ) 10)






