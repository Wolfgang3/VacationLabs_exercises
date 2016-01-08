// fix square root by naively fixed-point by average damping
=> 
;with reference to fixed point in section 1.3.3 and refering to previous exercises and for average-damp on pg 72,fast-expt from pg 45

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess)
)

(define (compose f g)
  (lambda (x) (f (g x)) )
)

(define (repeated f count)
  (if (= count 0)
    (lambda (x) x)
    (compose f (repeated f (repeated f (- count 1)) 
               )
  )
)

(define (average-damp f)
  (lambda (x) (average x (f x)))
)

(define (average a b)
  (/ (+ a b) 2.0)
)

(define (iter b n a)
  (cond 
    ((= n 0) a)
    ((even? n) (iter (square b) (/ n 2) a))
    (else (iter b (- n 1) (* a b) )))
)

(define (nth_root x)
)




