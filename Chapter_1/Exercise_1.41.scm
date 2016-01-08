// double procedure 
=>

(define (double doub)
  (lambda (x) (doub (doub x) ))
)

(define (inc x) (+ x 1) )

; (((double (double double)) inc) 5)
; value= 21   
 
;(each times a procedure double is called it returns another procedure)

; when we run (((double (double double)) inc) 0) as argument as 0
; we get value= 16 so we can come to now that 0 is incremented 16 times










