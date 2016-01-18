// modify union-set and intersection-set to operate on the tree
=>
;using the result of 2.63
(define (entry tree)
  (car tree)
)

(define (left-branch tree)
  (cadr tree)
)

(define (right-branch tree)
  (caddr tree)
)

;to convert tree into lists
(define (tree->list-1 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree) result-list)
                      )
        )
    )
  )
  (copy-to-list tree '())
)


(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)) )
  )
)

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)
  )
)

(define (union-set set1 set2)

  (cond ((null? (tree->list-1 set1)) (tree->list-1 set2))
        ((null? (tree->list-1 set2)) (tree->list-1 set1))
        (not (element-of-set? (car (tree->list-1 set1)) (tree->list-1 set2))
          (adjoin-set (car (tree->list-1 set1)) (union-set (cdr (tree->list-1 set1)) (tree->list-1 set2))) )
        (else (union-set (cdr (tree->list-1 set1)) (tree->list-1 set2)))
  )
)

;run
(define t1 (list 7 (list 3 (list 1 () ()) (list 5 () ())) (list 9 (list 8 () ()) (list 11 () ())) ))
(define t2 (list 7 (list 3 (list 1 () ()) (list 5 () ())) (list 9 (list 8 () ()) (list 11 () ())) ))

(union-set t1 t2)

