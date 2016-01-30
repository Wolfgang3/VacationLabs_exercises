// set-to-wow! procedure
=>
(define x (list 'a 'b))
(define z1 (cons x x))

(define z2 (cons (list 'a 'b) (list 'a 'b)))
(define (set-to-wow! x)
  (set-car! (car x) 'wow)
x)

z1
;value: ((a b) a b)
z2
;value: ((a b) a b)

(set-to-wow! z1)
;value: ((wow b) wow b)

(set-to-wow! z2)
;value: ((wow b) a b)

;drawn on the notebook