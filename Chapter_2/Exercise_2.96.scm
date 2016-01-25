//
=>
;incomplete
(define (pseudoremainder-terms x y)
   (cdr (div-poly x y))
)

;modify gcd
(define (gcd-terms a b)
  (if (empty-termlist? b)
    a
    (gcd-terms b (remainder-terms a b))
  )
)