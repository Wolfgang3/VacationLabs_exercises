;; 
;=>
;with reference to the merge procedure on page no.
(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else 
          (let ((s1car (stream-car s1))
                (s2car (stream-cdr s2)))
            (cond ((< (weight s1car) (weight s2car))
                   (cons-stream s1car (merge (stream-cdr s1) s2 weight)))
                  ((> s1car s2car)
                   (cons-stream s2car (merge s1 (stream-cdr s2) weight)))
                  (else
                    (cons-stream s1car
                                (merge (stream-cdr s1)
                                       (stream-cdr s2)
                                       weight))))))))

(define (weighted-pairs s1 s2 weight)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (merge-weighted
      (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
      (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
      weight)))

;a) all pairs with +ve integer with i<= j
(define (positive_integers1 x)
  (+ (car x)
      (cdr x)))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define display1 (weighted-pairs integers integers positive_integers1))

;b) all positive integers with i<=j where neither i nor j divisible by 2, 3 or 5
