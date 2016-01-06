// test on given carmichael numbers
=> (incomplete )
// modification was done in fermat-test procedure
(define (square x) (* x x)) 
  
(define (expmod base exp m) 
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (square (expmod base (/ exp 2) m)) 
                    m)) 
        (else 
         (remainder (* base (expmod base (- exp 1) m)) 
                    m)))) 

(define (fermat-test_iter? n) 
  (define (iterate a n) 
    (if (= a n) true 
        (if (= (expmod a n n) a) (iterate (+ a 1) n) false))) 
  (iterate 1 n)) 



