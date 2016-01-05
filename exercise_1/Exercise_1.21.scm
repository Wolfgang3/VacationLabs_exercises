// use smallest divisor procedure
=> using the same procedure on page no 50 session 1.2.6
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0)) 

operations:
(smallest-divisor 199) 
=> value: 199 

(smallest-divisor 1999) 
=> value: 1999 

(smallest-divisor 19999) 
=> value: 7 


