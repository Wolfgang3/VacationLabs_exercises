//part a)product of numbers,factorial and formula of pi
=>
// pi procedure is left 

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b)))
)

(define (inc x) (+ x 1))

(define (factorial n)
  (define (same_num x) x)
  (if (= n 0)
      1
      (product same_num 1 inc n))
) 


(define (pi_value n)
)






