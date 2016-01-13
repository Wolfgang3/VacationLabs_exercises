// what is the output of the following
=> 
(define x (list 1 2 3))

(define y (list 4 5 6))

;result of 
(append x y)
;(1 2 3 4 5 6)

(cons x y)
;((1 2 3) 4 5 6)

(list x y)
;((1 2 3) (3 4 5))

