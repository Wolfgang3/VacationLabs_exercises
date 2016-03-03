;; 
;=> 
; 1,1+2,1+2+3,1+2+3+4
(define (partial-sums s)
  (cons-stream (stream-car s) 
               (add-streams (stream-cdr s) 
                             (partial-sums s))))

;output stream will be 1,3,6,10,15......