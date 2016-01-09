// church mumerals
=>

(define zero 
  (lambda (f) (lambda (x) x))
)

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))
  )
)

;defination of one 
(define one 
  (lambda (f) (lambda (x) x))
)

;defination of two 
(define two 
  (lambda (f) (lambda (x) x))
)

;evaluate (add-1 zero)
;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x))) )
;(lambda (f) (lambda (x) (f ((lambda (x) x) x) x))) )

