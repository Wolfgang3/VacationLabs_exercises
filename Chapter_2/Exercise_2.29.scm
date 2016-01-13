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



