// complete the square-list procedure
=> 
; with reference map procedure on page no. 105 

(define (square-list items)
  (if (null? items)
    nil
    (cons (square (car items)) (square-list (cdr items)) )
  )
)

(define (square-list items)
  (map square items)
)
