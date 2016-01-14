// complete the procedure
=> 
;from previous exercise 2.38
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

(define (fold-right op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence))
    )
  )
)

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x)) ) () sequence))

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x) ) () sequence))


;run
(reverse (list 1 2 3 4))
;value= (4 3 2 1)
