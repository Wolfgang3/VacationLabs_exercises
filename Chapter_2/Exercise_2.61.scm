// implementation of adjoin-set using the ordered representation
=>
;ordered list is a list arranged in a ascending order to search faster
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)) )
  )
)

(define (intersetion-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
                (cons x1
                      (intersetion-set (cdr set1) (cdr set2))))
              ((< x1 x2)
                (intersetion-set (cdr set1) set2))
              ((< x2 x1)
                (intersetion-set set1 (cdr set2)))
        )
      )
  )
)

;procedure for adjoint-set using ordered representation
(define (adjoint-set x set)
  (cond ((null? set) (cons x ()) )
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoint-set x (cdr set))))
  )
)

;run
(define set (list 1 2 3 4))
(adjoint-set 5 set)
;value= (1 2 3 4 5)
