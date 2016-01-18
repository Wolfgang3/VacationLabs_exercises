// ordered list to a balanced binary tree
=>
(define (list->tree elements)
  (car (partial-tree elements (length elements)))
)

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts) right-size)
                  ))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts)
              )
            ) 
          )
        )
      )
  )
)


;tree produced by list->tree is (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
;drawn on the book

;explanation for partial-tree
;partial-tree procedure has two arguments elts(list of elements in the tree), n(number of elements in the tree)
;if the length i.e. n is 0 , then list will will displayed

;else 
; 'left-size' is created to save the size of the left tree
; 'left-result' will store the value of the element to the left side of the tree
; 'left-tree' is created to store the left part of the tree (cadr tree)
; 'non-left-elts' will save all the list in the left tree except the 1st element
; 'right-size' will save the right side of the tree
; 'this-entry' will save the 1st entry of the non-left-eltss 
