// smallest-divisor procedure 
=>
// with reference to code of smallest-divisor on page no.50 and prime number procedure on page no. 54
// i hav combines the two code to check the efficiency 

(define (smallest-divisor n) 
   (find-divisor n 2)) 
  
(define (find-divisor n test-divisor) 
  (define (next n) 
    (if (= n 2) 3 (+ n 2))) 
  (cond ((> (* test-divisor test-divisor) n) n) 
        ((divides? test-divisor n) test-divisor) 
        (else (find-divisor n (next test-divisor))))) 
  
(define (divides? a b) 
  (= (remainder b a) 0)) 
  
(define (prime? n) 
  (= n (smallest-divisor n))) 
  
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

ex: (timed-prime-test 1013)
   will the the output: 1013 *** 0.




