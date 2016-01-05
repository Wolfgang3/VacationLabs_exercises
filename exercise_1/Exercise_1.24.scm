// modifying the timmed-prime-test of exrcise 1.22 to use fast-prime?
=>
// using the procedure on page no. 51,52 with remaining procedure on pg no 54
(define (square x) (* x x)) 
  
(define (expmod base exp m) 
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (square (expmod base (/ exp 2) m)) 
                    m)) 
        (else 
         (remainder (* base (expmod base (- exp 1) m)) 
                    m))))         
  
(define (fermat-test n) 
  (define (try-it a) 
    (= (expmod a n n) a)) 
  (try-it (+ 1 (random (- n 1))))) 
  
(define (fast-prime? n times) 
  (cond ((= times 0) true) 
        ((fermat-test n) (fast-prime? n (- times 1))) 
        (else false))) 
  
(define (prime? n) 
   (fast-prime? n 100)) 
  
(define (timed-prime-test n) 
  (newline) 
  (display n) 
  (start-prime-test n (runtime))) 
  
(define (start-prime-test n start-time) 
  (if (prime? n) 
      (report-prime n (- (runtime) start-time)))) 
  
(define (report-prime n elapsed-time) 
  (display " *** ") 
  (display elapsed-time)
) 
 
ex.(timed-prime-test 1009)

