// correct version of count-pairs 
=>
;previous version
(define (count-pairs x)
  (if (not (pair? x))
    0
    (+ (count-pairs (car x))
       (count-pairs (cdr x))
       1
    )
  )
)

;run
(define t1 '(a b c))
(count-pairs t1)
;Value: 3

(define t3 (cons t1 t1))
(count-pairs t3)
;this should return value: 4 
;((a b c) a b c)
;but in the previous procedure for count-pairs it was returning 7 which is wrong
;value: 7

;corrected procedure for count-pairs
(define (count-pairs x)
  (if (not (pair? x))

  )
)
;incomplete

