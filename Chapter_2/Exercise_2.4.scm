// 
=>

(define (cons x y)
  (lambda (m) (m x y)))
;

(define (car z)
  (z (lambda (p q) p)))


; similarly
;cdr has an input as a function(pair of numbers), which takes 2 arguments i.e. lambda (p q) and returns q.
(define (cdr z)
  (z (lambda (p q) q))
)

; to evaluate (car (cons x y))

(car (cons x y))
(car (lambda (m) (m x y)) )
( (lambda (m) (m x y)) (lambda (p q) p) )
( (lambda (p q) p) x y )

;therefore, value= x
