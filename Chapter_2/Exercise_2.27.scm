// deep-reverse procedure 
=> 
(define x (list (list 1 2) (list 3 4) ))

;modifing the reverse procedure by reffering to a procedure on pg no. 109, for pair condition we go inside the list and call reverse
(define (deep-reverse x)
  (cond ((null? x) x)
        ((not (pair? (car x)) )
          (append (deep-reverse (cdr x)) (list (car x)) ))
        (else (append (deep-reverse (cdr x)) (list (deep-reverse (car x))) ))
  )
)

;run
(deep-reverse x)
; value= ((4 3) (2 1))

