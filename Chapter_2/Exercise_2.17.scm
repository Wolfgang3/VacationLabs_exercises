// last-pair
=> 
;last pair is like go to the list till the cdr of the last node in the list is nil
(define (last-pair l)
  (if (null? (cdr l))  
      (car l)
      (last-pair (cdr l))
  )
)

;run
(last-pair (list 23 72 149 34))
;value= (34)

