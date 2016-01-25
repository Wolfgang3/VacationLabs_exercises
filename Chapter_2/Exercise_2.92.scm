// extending polynomial package to work with different variables
=>
;with reference from the procedure on pg no. 190
;using this package we can work with different variables
(define (install-rational-package)
  ;;internal procedures
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))
    ) 
  )

  ;here we change the arithmetic procedures in terms of polynimial
  (define (add-rat x y)
    (make-rat (add-poly (mul-poly (numer x) (denom y))
                        (mul-poly (numer y) (denom x))) )
  )

  (define (sub-rat x y)
    (make-rat (sub-poly (mul-poly (numer x) (denom y))
                        (mul-poly  (numer y) (denom x))) )
  )

  (define (mul-rat x y)
    (make-rat (mul-poly (numer x) (denom y))
              (mul-poly (numer x) (denom y))) )

  (define (div-rat x y)
    (make-rat (mul-poly (numer x) (denom y))
              (mul-poly (denom x) (numer y))) )

  ;;interface to rest of the system
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
       (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
       (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
       (lambda (x y) (tag (div-rat x y))))

  (put 'make 'rational
       (lambda (n d) (tag (make-rat n d))))
  'done
)
