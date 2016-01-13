// modification to tree-square
=> 

(define (square-tree tree) (tree-map square tree))

;defining tree-map
(define (tree-map func tree)
  (map (lambda (t)
	 (if (pair? t)
	     (tree-map func t)
	     (func t)
         )
       )
  tree)
)

;consider a add procedure which add 10 to all the nodes
(define (add z)
  (+ z 10)
)

(tree-map add (list 1 2 3 (list 4 5 (list 6 (list 7)))))
;value= (11 12 13 (14 15 (16 (17))))

