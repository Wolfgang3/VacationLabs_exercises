// binary mobile
=> 
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a) procedures for left-branch, right-branch , branch-length and branch-structure
(define (left-branch mobile)
  (car mobile)
)

(define (right-branch mobile)
  (cdr mobile)
)

(define (branch-length branch)
  (car branch)
)

(define (branch-structure branch)
  (car (cdr branch))
)

;b) procedure for total-weight using 
(define (total-weight mobile)
  (cond  ((null? mobile) 0)
    ((not (pair? mobile)) mobile)
    (else (+ (total-weight (left-branch mobile))
	     (total-weight (right-branch mobile))
          )
    )
  )
)

;c) check for balance tree (not sure)
(define (balanced mobile)
  (if (= (* (total-weight (left-branch mobile)) (branch-length (left-branch mobile)))
         (* (total-weight (right-branch mobile)) (branch-length (right-branch mobile)))
      )
  (display "balanced") 
  (display "not balanced")
  )
)





