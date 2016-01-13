// square elements in the tree using map and recursion
=> 
;normal
(define (square-tree tree)
  (cond ((null? tree) ())
	((not (pair? tree)) (square tree))
	(else 
          (cons (square-tree (car tree)) 
            (square-tree (cdr tree))
          )
        )
  )
)

;using map
(define (square-tree tree)
  (map (lambda (t)
	 (if (not (pair? t))
	     (square t)
	     (square-tree t)
         )
       )
  tree)
)

;run
(square-tree (list 1 2 3 (list 4 5 (list 6 (list 7)))))
;value= (1 4 9 (16 25 (36 (49))))




