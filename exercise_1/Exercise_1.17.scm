//multiplication procedure
=>
according to the prob new procedures hav to be created procedures like double and half
(define (double num) (+ num num)) 
(define (half num) (/ num 2)) 
  
(define (all_opr a n) 
  (cond ((= n 0) 0) 
        (else (double (* (half n) a))) 
  )
) 


