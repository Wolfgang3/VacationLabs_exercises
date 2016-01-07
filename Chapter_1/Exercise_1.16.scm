// procedure for itterative exponential process
=>

(define (fast_expt b n) 
   (define (iterate a b n) 
     (cond ((= n 0) a) 
           (else (iterate (* a b) b (- n 1))))) 
   (iterate 1 b n)) 

// the above procedure takes two parameters for fast_expt function 
eg: (fast-expt 2 10) 
	=> the result will be 1024 i.e. 2^10



