// mystery procedure
=>
(define (mystery x)
  (define (loop x y)
    (if (null? x)
      y
      (let ((temp (cdr x)))
        (set-cdr! x y)
        (loop temp x)
      )
    )
  )
(loop x '()))

(define v (list 'a 'b 'c 'd))
(define w (mystery v))
;if we print w then the value will be (d c b a)
;so mystery reverses the list

;box-and-pointer diagram drawn on the notebook