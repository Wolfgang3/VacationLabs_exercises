// 
=>
;(define (scheme-number->scheme-number n)n)
;(define (complex->complex z) z)
;(put-coercion 'scheme-number 'scheme-number
;              scheme-number->scheme-number )
;(put-coercion 'complex 'complex complex->complex)


;part a): 
; when two arguments of type complex is passed to the Louis coercion procedure, it will return the same object.
; the loop will not end

;part b):
; i think apply-generic must be change to validate two same inputs.

;part c):
;using the reference form pg no. 196
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
