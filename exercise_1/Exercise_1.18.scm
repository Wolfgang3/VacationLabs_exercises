//procedure to generate all operation in a iterative manner
=> 
just like the prev exercise we hav to be created procedures like double and half
(define (double num) (+ num num)) 
(define (half num) (/ num 2))  
  
(define (all_opr data n) 
   (define (iterate a data n) 
     (cond ((= n 0) a) 
           ((< n 0) (iterate a (double data) (half n))) 
           (else (iterate (+ a data) data (- n 1))))) 
   (iterate 0 data n)
)  


