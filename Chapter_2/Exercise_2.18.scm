// reverse a list
=> 

;create reverse and store in list l2
(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))
  )
)

(define (reverse l)
  (if (null? l)
      l
      (append (cdr l) (car l) )
  )
)



;run
(reverse (list 1 4 9 16 25))
;value= (25 16 9 4 1)
