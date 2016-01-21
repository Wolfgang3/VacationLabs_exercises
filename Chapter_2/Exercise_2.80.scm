// generic predicate zero? procedure
=>
;for ordinary numbers
(define (=zero_ordinary? n)
	(= n 0)
)

;for rational number
(define (=zero_rational? r)
  (= (numer r) 0)
)

;for complex number 
;for rectangular
(define (=zero_complex? c)
  (and (= (real-part c) 0)
       (= (imag-part c) 0)
  ) 
)
;Or for polar
(define (=zero_complex? c)
  (= (magnitude c) 0)
)

;now to construct the full generic arithmetic package
(define (install-generic-arithmetic-package)
  (put '=zero? '(ordinary) =zero_ordinary?)
  (put '=zero? '(rational) =zero_rational?)
  (put '=zero? '(complex) =zero_complex?) 
)

(define (=zero? x)
  (apply-generic '=zero? x)
)