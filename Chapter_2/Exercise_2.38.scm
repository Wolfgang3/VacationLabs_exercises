// fold-right and fold-left
=> 

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest)
      )
    )
  )
  (iter initial sequence)
)

;fold-right also know as accumulate procedure
(define (fold-right op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence))
    )
  )
)

;run
(fold-right / 1 (list 1 2 3))
;value= 3/2

(fold-left / 1 (list 1 2 3))
;value= 1/6

;nil was not working so 1 forum said to use () instead of nil
(fold-right list () (list 1 2 3))
;value= (1 (2 (3 ())))

(fold-left list () (list 1 2 3))
;value= (((() 1) 2) 3)

