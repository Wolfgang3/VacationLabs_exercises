// 
=>
;from the previous exercise
;(given in the problem) modifying the make-rat so it doesnt reduce d fractions to lowest terms 
(define (install-rational-package)
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rational n d)
    (cons n d)
  )

  ;empty-termlist?
  (define (empty-termlist? term-list)
    (null? term-list)
  )
  ;gcd procedure for list 
  (define (gcd-terms a b)
    (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))
    )
  )

  ;make rational using the GCD procedure to reduce polynomials
  (define (make-rational-gcd n d)
    (let ((g (gcd-terms n d)))
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

;now the polynomial package
(define (install-polynomial-package)
  (define (make-polynomial variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
)


;run 
(define p1 (make-polynomial 'x '((2 1) (0 1))) )
(define p2 (make-polynomial 'x '((3 1) (0 1))) )
(define rf (make-rational p2 p1))
;value of rf: ((x (3 1) (0 1)) x (2 1) (0 1))
(define rf2 (make-rational-gcd p2 p1))