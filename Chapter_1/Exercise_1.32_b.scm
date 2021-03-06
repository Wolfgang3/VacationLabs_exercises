//part b) accumulate procedure  
=>
// the previous procedure was done using recursive approach

// using the same procedure done in the prev case but with iterative approach

(define (accumulate combiner null-value term a next b) 
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value)
)

(define (id x) x)

(define (incr n) (+ n 1))

(define (sum id a incr b) (accumulate + 0 id a incr b))
   
(define (sum_of_terms a b)
      (sum id a incr b)
)


ex: (sum_of_terms 1 5)
	=> value: 15
