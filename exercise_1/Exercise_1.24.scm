// prime number range
=>

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
  (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

//------this is wrong
(define (search-for-primes n)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (iterate n counter)
    (if (< counter 3)
        (if (timed-prime-test n) 
            (iterate (+ n 2) (+ counter 1))
            (iterate (+ n 2) counter))))
  (if (even? n) 
      (iterate (+ n 1) 0)
      (iterate (+ n 2) 0))
)
