// generic raise procedure 
=>
; from the fig 2.25 integer -> rational -> real -> complex

;previous procedures make-rat
(define (make-rat n d)
  (cons n d)
)

(define (numer x)
  (car x)
)

(define (denom x)
  (cdr x)
)

; integer we hav to make it rational
(define (make_rational_from_integer i)
  (make-rat i 1)
)

;rational we hav to make it real
(define (make_real_from_rational rational_num)
  (/ (numer rational_num)
     (denom rational_num) )
)

;real we hav to make it complex
(define (make_complex_from_real real_num)
  (make-from-real-imag real_num 0)
)

;now we can construct a package that will hav all the above procedures
(define (install-raise-package)
  (put 'raise '(integer) make_rational_from_integer)
  (put 'raise '(rational) make_real_from_rational)
  (put 'raise '(real) make_complex_from_real)
)

(define (raise x)
  (apply-generic 'raise x)
)
