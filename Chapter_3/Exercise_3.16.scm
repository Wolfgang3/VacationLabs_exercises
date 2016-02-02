// 
=>
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

(define t2 (list '(a) '(b)))
(count-pairs t2)
;value: 4

(define t3 (cons t1 t1))
(count-pairs t3)
;value: 7

(define t4 '(a b c))
(set-cdr! (last-pair t4) t4)
(count-pairs t4)
;Aborting!: maximum recursion depth exceeded

;the box-and-pointer diagram drawn on the notebook