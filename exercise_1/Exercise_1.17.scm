//multiplication procedure
=>
according to the prob new procedures hav to be created like double and half
(define (double num) (+ num num)) 
(define (halve num) (/ num 2)) 
  
(define (all_opr a n) 
  (cond ((= n 0) 0) 
        (else (double (* (halve n) a))) 
  )
) 


