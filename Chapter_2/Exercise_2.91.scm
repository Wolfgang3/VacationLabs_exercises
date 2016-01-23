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
          ;(adjoin-term (make-term))
        )))
    )
  )
)
