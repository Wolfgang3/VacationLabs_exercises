// union-set operation
=>
;with reference to procedure on pg no. 152 
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))
  )
)

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)
  )
)

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (not (element-of-set? (car set1) set2)
          (adjoin-set (car set1) (union-set (cdr set1) set2)) )
        (else (union-set (cdr set1) set2))
  )
)


;run
(define set1 (list 1 2 3))

(define set2 (list 3 4 5))

(union-set set1 set2)
