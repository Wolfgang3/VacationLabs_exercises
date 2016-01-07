// simpsons rule
=>
// for this problem i hav to take 4 parameters with reference from the code on pg no. 60 
// given the value of h=(b-a)/n and Yk=f(a+kh)
// using recursion for procedure

(define (cube x) (* x x x))

(define (incr x)(+ x 1) )

(define (sum term a next b n)
  (if(> a n)
   0
   (+ (term a) 
   (sum term (next a) next b n))
  )
)

(define (simpsons_rule f a b n k) 	
	
(define h (/ (- b a) n))
	
(define (yk k) (f (+ a (* k h))))
  
(define (coeff k)
    (* (cond ((or (= k 0) (= k n)) 1)
       ((even? k) 2)
       (else 4))
       (yk k))) 
  (* (/ h 3) (sum coeff 0 incr k n))
)

ex: (simpsons_rule cube 0 1 100 0)




