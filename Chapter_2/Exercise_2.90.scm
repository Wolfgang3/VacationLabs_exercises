// term-list procedure in terms of dense polynomials 
=>
;=> for sparse
(define (sparse-first-term term-list)
  (car term-list)
)

(define (sparse-rest-terms term-list)
  (cdr term-list)
)
(define (sparse-empty-termlist? term-list)
  (null? term-list)
)
(define (sparse-order term)
  (car term)
)
(define (sparse-coeff term)
  (cadr term)
)

; to create sparse polynomial package
(define (install-sparse-polynomial-package)
  (put 'sparse '(first-term) sparse-first-term)
  (put 'sparse '(rest-terms) sparse-rest-terms)
  (put 'sparse '(empty-termlist?) sparse-empty-termlist?)
  (put 'sparse '(order) sparse-order)
  (put 'sparse '(coeff) sparse-coeff)
)

;=> dense not done depends on the previous exercise
(define (term-list_dense lst)
)