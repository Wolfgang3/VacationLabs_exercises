// drop procedure 
=>

;create a generic project

;project for real(real can be droped to integer)
(define (real-to-integer n)
  (cond ((number? n) (round n))
        (else (error "droped to the lowest" n)) )
)

;project for rational

;project for complex(complex can be droped to real if imaginery part is 0)
(define (complex-to-real n)
  (cond ((= (imag-part n) 0) (push (attach-tag (real-part n) ))
        (else (error "droped to the lowest" n)) )
)

;now we can construct a package that will hav all the above procedures
(define (install-project-package)
  (put 'project '(real-change) real-to-integer)
  (put 'project '(complex-change) complex-to-real)
)

;project generic
(define (project x)
  (apply-generic 'project x)
)


;drop procedure
(define (drop x)
  (cond ((= (type-tag x) 'real) (project (cons 'real-chaneg (contents x))))
        ((= (type-tag x) 'complex) (project (cons 'complex-change (contents x))))
        (else (error "invalid"))
  )
)

;using the prev procedure apply-generic
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
            (cond ((< l1 l2) (apply-generic op a1 (drop a2) ))
                  ((< l2 l1) (apply-generic op (drop a1) a2 ))
                  (else (error "No method for these types"
                (list op type-tags)))))
                    (error "No method for these types"
                (list op type-tags)))
      )
    )
  )
)

