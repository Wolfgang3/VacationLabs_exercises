// same-parity procedure
=> 
;folowing the defination in the exercise
;
;display the numbers with same parity ,take the 1st number and subrtack it from the next number in the list, if the result is even then append the number to the new list result.
(define (same-parity i . li)
  (define (iter lst result)
    (cond ((null? lst) result)
          ( (even? (- i (car lst)) )
            (iter (cdr lst) (append result (list (car lst))) )
          )
          (else (iter (cdr lst) result))
          )
    )
    (iter li (list i))
  )
)

;run
(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)



