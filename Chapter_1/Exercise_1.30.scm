//complete the missing expression
=>
// referring to examples on pg no. 58

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (+ a 1) (+ result term a ) )))
 (iter a 0 ))
