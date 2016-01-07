//part b)convert the previous procedure into opposite
=>
// the prev procedure i did using recursive, now this is iterative.... using reference from previous exercise 1.30

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))        
  (iter a 1)
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
