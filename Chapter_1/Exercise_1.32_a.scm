// part a) accumulate procedure 
=>
(define (accumulate combiner null-value term a next b) 
    (if (> a b) null-value 
      (combiner (term a) 
        (accumulate combiner null-value term (next a) next b))))

(define (id x) x)

(define (incr n) (+ n 1))

(define (sum id a incr b) (accumulate + 0 id a incr b))
   
(define (sum_of_terms a b)
      (sum id a incr b)
)
