;; stream-limit procedure
;=>
(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                                (sqrt-improve guess x))
                              guesses)))
  guesses)

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(define (stream-limit s tolerance)
  (let ((s_next (stream-cdr s)))
    (if (< (abs (- (stream-car s) (stream-car s_next)))
           tolerance)
        (stream-car s_next)
        (stream-limit s_next tolerance))))

(sqrt 4 0.00001)
; value: 2.000000000000002