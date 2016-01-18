// 
=>
(define (entry tree)
  (car tree)
)

(define (left-branch tree)
  (cadr tree)
)

(define (right-branch tree)
  (caddr tree)
)

;given procedures 1
(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1 (right-branch tree))
            )
    )
  )  
)

;given procedure 2
(define (tree->list-2 tree)
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



;run
;creating the same trees from fig. 2.16

(define t1 (list 7 (list 3 (list 1 () ()) (list 5 () ())) (list 9 () (list 11 () ())) ))
(define t2 (list 3 (list 1 () ()) (list 7 (list 5 () () ) (list 9 () (list 11 () ())))))
(define t3 (list 5 (list 3 (list 1 () ()) ()) (list 9 (list 7 () ()) (list 11 () ()))))


(define tree1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
(define tree2 '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))
(define tree3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))

(tree->list-1 t1)
(tree->list-1 t2)
(tree->list-1 t3)
(tree->list-2 t1)
(tree->list-2 t2)
(tree->list-2 t3)



;part a) ;both procedures give the same result for all the 3 trees i.e. (1 3 5 7 9 11)

;part b) ;they will hav same order of growth because they use a balance tree