// division of polynomials
=>
;complete the given procedure
(define (div-terms l1 l2)
  (if (empty-termlist) (the-empty-termlist))
  (let ((t1 (first-term l1))
        (t2 (first-term l2)))
    (if (> (order t2) (order t1))
        (list (the-empty-termlist) l1)
        (let ((new-c (div (coef t1) (coeff t2)))
             ((new-o (- (order t1) (order t2))))
          (let ((rest-of-result 
                  (div-terms (sub-terms L1 
                                        (mul-terms (make-term new-o new-c) L2)
                             )
                             L2)
            ))
          ;<form complet result>
          (cons (adjoin-term (make-term new-o new-c) (car rest-of-result))
                (cdr rest-of-result))
        )))
    )
  )
)

;for div-poly procedure 
(define (div-poly poly1 poly2)
  (if (same-variable? (variable poly1) (variable poly2))
      (make-poly (variable poly1)
        (div-terms (term-list poly1)
                 (term-list poly2))
      )
    (error "variables are different")
  )
)