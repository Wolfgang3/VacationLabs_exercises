// modify the apply-generic procedure 
=>
;using the earlier procedure 
(define (raise x)
  (apply-generic 'raise x)
)

;first we hav to get the 
(define (level_num x)
  (cond ((eq? (type-tag x) 'real) 3)
        ((eq? (type-tag x) 'rational) 2) 
        ((eq? (type-tag x) 'exact-integer) 1)
  )
)

(define (raise level x)
  (if (= level (level_num x))
    x
    (raise level (raise-level-x x))
  )
)

;apply-generic procedure
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
        (if (= (length args) 2)
            (let ((a1 (car args))
                  (a2 (cdr args)))
            (l1 (level_num a1))
            (l2 (level_num a2))
            (cond ((< l1 l2) (apply-generic op (raise l1 a1) a2))
                  ((< l2 l1) (apply-generic op a1 (raise l2 a2)))
                  (else (error "No method for these types"
                (list op type-tags)))))
                    (error "No method for these types"
                (list op type-tags)))
      )
    )
  )
)

(define (apply-generic op . args)
  (let ((type-tags (ma type-tags args)))
    (let proc (get op type-tags))
)
