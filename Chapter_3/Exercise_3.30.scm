;; ripple-carry adder procedure
;=>
(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

(define (ripple-carry-adder ak bk sk c)
  (let ((c_in (make-wire)))
    (if (null? (cdr ak))
        ()
        (full-adder (car ak) (car bk) c_in (car s) c))
    (ripple-carry-adder (cdr ak) (cdr bk) (cdr sk) c-in)))
