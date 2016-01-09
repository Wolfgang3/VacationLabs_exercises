// arithmetic operations using cons, car and cdr
=>
;2^a * 3^b
(define (cons a b)
  (* (expt 2 a) (expt 3 b))
)

(define (div num d)
  (define (iter num result)
    (if (= (remainder num d) 0)
        (iter (/ num d) (+ result 1))
        result)
    )
  (iter num 0)
)

(define (car n)
  (div n 2))

(define (cdr n)
  (div n 3)
)

;run
(cons 2 3)
;value= 108

(car (cons 2 3))
;value= 2

