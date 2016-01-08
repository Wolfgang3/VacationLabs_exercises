// composition of function f after g
=>
; given a function as x |-> f(g(x)) 
(define (compose f g)
  (lambda (x) (f (g x) ))
)
 
(define (inc x) (+ x 1) )

(define (square x) (* x x) )

; to run: ((compose square inc) 6)
; value= 49    (6 is incremented and then squared, so 7 is squared to get 49)






