// fringe procedure
=> 
;align all the tree nodes from left to right
;so again refering to the procedure on pg no. 109

(define x (list (list 1 2) (list 3 4)) )

(define (fringe x)
  (cond ((null? x) ())
        ((not (pair? (car x)))
          (append (list (car x)) (fringe (cdr x))) )
        (else (append (fringe (car x)) (fringe (cdr x)) ))
  )
)

;run
(fringe (list x x))

