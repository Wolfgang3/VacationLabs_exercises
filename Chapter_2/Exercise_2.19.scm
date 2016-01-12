// change counting program
=> 
;consider the section 1.2.2, using the procedure on page no. 41

(define (first-denomination coin-values)
  (if (no-more? coin-values)
    0
    (car coin-values))
)

(define (except-first-denomination coin-values)
  (cdr coin-values)
)

(define (no-more? coin-values)
  (if (null? coin-values)
      true
      false)
)


;given procedure
(define (cc amount coin-values)
  (cond 
    ((= amount 0) 1)
    ((or (< amount 0) (no-more? coin-values)) 0)
    (else 
      (+ (cc amount
             (except-first-denomination coin-values))
        (cc (- amount 
               (first-denomination coin-values))
          coin-values))))
)


(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))


;run
(cc 100 us-coins)
;value= 292

