// generalize apply-generic to handle coercion in the general case of multiple arguments
=>
;the previous procedure 
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
        (if (= (length args) 2)
          (let ((type1 (car type-tags))
                (type2 (cadr type-tags))
                (a1 (car args))
                (a2 (cadr args)))
            (if (equal? type1 type2)
                    (error "equal types" 
                           (list op type-tags))
                (let ((t1->t2 (get-coercion type1 type2))
                      (t2->t1 (get-coercion type2 type1)))
                  (cond (t1->t2
                          (apply-generic op (t1->t2 a1) a2))
                        (t2->t1
                          (apply-generic op a1 (t2->t1 a2)))
                        (else
                          (error "no method for these types"
                                (list op type-tags)))))
                )
            )
        (error "no method for these types"
        (list op type-tags))
        )
      )
    )
  )
)

;now if we want to generalize it we can do a recursive call to convert all the arguments to coercion
;so we can define a procedure coercion_all given below to be included in the apply-generic procedure
(define (coercion_all args)
  (if (pair? args)
    (and (get-coercian (car args) (cadr args)) 
         (check-if-coercian-true (append (car args) (cddr args)) )
    )
  true)
)

