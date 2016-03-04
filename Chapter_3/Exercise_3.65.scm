;; 
;=>
(define (ln2-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln2-summands (+ n 1)))))

;prev procedures
(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (partial-sums s)
  (cons-stream (stream-car s) 
               (add-streams (stream-cdr s) 
                             (partial-sums s))))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define ln2-stream
  (scale-stream (partial-sums (ln2-summands 1)) 1))

(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
        (s1 (stream-ref s 1))
        (s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (euler-transform (stream-cdr s)))))

(define (make-tableau transform s)
  (cons-stream s
               (make-tableau transform
                             (transform s))))

(define (accelerated-sequence transform s)
  (stream-map stream-car
              (make-tableau transform s)))

(define (stream-for-each proc s)
  (if (stream-null? s)
    'done
    (begin (proc (stream-car s))
           (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(display-stream (accelerated-sequence euler-transform
                                      ln2-stream))
;value
1.
.7
.6932773109243697
.6931488693329254
.6931471960735491
.6931471806635636
.6931471805604039
.6931471805599445
.6931471805599427
.6931471805599454

