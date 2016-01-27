// accumulator procedure
=>
(define (make-accumulator total)
	(lambda (amt)
    (begin (set! total (+ total amt)) total)
  
  )
)

;run
(define A (make-accumulator 5))
(A 10)
;Value: 15
(A 10)
;Value: 25
1 ]=> (A 10)
