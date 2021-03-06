// Eulers expansion 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8,.....
=>
(define (cont-frac n d k)
  (define (iter count result)
    (if (< count 1)
        result
        (iter (- count 1) (/ (n count) (+ (d count) result)))))
  (iter k 0.0)
)

(define (euler_expansion k)
  (define n (lambda (i) 1.0))
  (define d (lambda (i) 
     (let ((r (remainder i 3))
       (d (/ i 3)))
     (if (= r 2)
        (* 2 (+ d 1))
         1.0))))
  (+ 2 (cont-frac n d k))
)

; to run
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)


