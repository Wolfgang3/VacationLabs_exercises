// Louis Reasoner
=> 
;looking at the procedure 
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
  (iter items ())
)
;run
(square-list (list 1 2 3 4))
;observed ans was (16 9 4 1)

;as observed the answer provided by the above procedure is in reverse order
; i think this happens bcuz the answer is printed after executing cons
