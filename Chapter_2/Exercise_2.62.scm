// procedure for union-set in ordered lists
=>
;using the prevoius procedure of previous exercise

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((= x (car set)) false)
        (else (element-of-set x (cdr set)))
  )
)

(define (adjoint-set x set)
  (cond ((null? set) (cons x ()))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoint-set x (cdr set))))
  )
)

;procedure for union-set
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((= (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) (cdr set2))))
        ((< (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) set2)))
        ((< (car set2) (car set1))
         (cons (car set2) (union-set set1 (cdr set2))))
  )
)

;run
(define set1 (list 1 2 5))
(define set2 (list 3 4 5 6))
(union-set set1 set2)  
;value= (1 2 3 4 5 6)
