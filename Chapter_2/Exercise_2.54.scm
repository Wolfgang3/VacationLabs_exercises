// defining equal procedure
=> 
;first we see if both the list are pair
(define (equal? l1 l2)
  (cond ( (and (pair? l1) (pair? l2)) 
          (and (equal? (car l1) (car l2))
               (equal? (cdr l1) (cdr l2)) 
          )
        )
        ( (or (pair? l1) (pair? l2)) #f)
        (else (eq? l1 l2))
  )
)


;run
(equal? '(this is a list) '(this is a list))
;value= #t

(equal? '(this is a list) '(this (is a) list))
;value= #f
