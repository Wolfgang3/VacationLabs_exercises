// =zero? procedure for polynomials in generic arithmetic package
=>

;previous procedures
(define (the-empty-termlist)
  '()
)

(define (first-term term-lister)
  (car term-list)
)
(define (rest-terms term-list)
  (cdr term-list)
)
(define (empty-termlist? term-list)
  (null? term-list)
)

; =zero? procedure
(define (=zero? n)
  (define (iter termlist) 
    (or (empty-termlist? termlist) 
        (and (=zero? (first-term termlist)) 
             (iter (rest-terms termlist))
        )
    )
  )
  (iter (term-list n))
)

;now to put the procedure in the arithmetic package
(define (install-arithmetic-package)
  (put '=zero? '(polynomial) =zero?)
)
