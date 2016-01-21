// generic equality predicate equ? procedure
=>
;for ordinary numbers
(define (ordinary_equ? n1 n2)
  (= n1 n2)
)

;for rational numbers(assumtions both numbers are in reduce form)
(define (rational_equ? r1 r2)
  (and (= (numer r1) (numer r2))
       (= (denom r1) (denom r2))
  )
)

;for complex numbers
;for rectangular real and imag
(define (complex_equ? c1 c2)
  (and (= (real-part c1) (real-part c2))
       (= (imag-part c1) (imag-part c2))
  )
)

; Or for polar magnitude and angle
(define (complex_equ? c1 c2)
  (and (= (magnitude c1) (magnitude c2))
       (= (angle c1) (angle c2))
  )
)

;now to construct the full generic arithmetic package
(define (install-generic-arithmetic-package)
  (put 'equ? '(ordinary) ordinary_equ?)
  (put 'equ? '(rational) rational_equ?)
  (put 'equ? '(complex) complex_equ?) 
)

(define (equ? x y)
  (apply-generic 'equ? x y)
)
