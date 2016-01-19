// lookup procedure for structured binary tree
=>
;earlier exercises procedures
(define (entry tree)
  (car tree)
)

(define (left-branch tree)
  (cadr tree)
)

(define (right-branch tree)
  (caddr tree)
)

;modifying the lookup procedure uisng previous element-of-set procedure 
(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((equal? given-key (key (car set-of-records)))
          (car set-of-records))
        ((< given-key (key (car set-of-records)))
          (lookup given-key (left-branch set-of-records)) )
        ((< (key (car set-of-records)) given-key)
          (lookup given-key (right-branch set-of-records)))
  )
)

;run
(define t1 (list 7 (list 3 (list 1 () ()) (list 5 () ())) (list 9 () (list 11 () ())) ))
(lookup 3 t1)