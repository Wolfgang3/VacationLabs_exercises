// for-each implementation 
=> 

(define (for-each func l)
  (cond ((null? l) "done")
    (else (func (car l))
       (for-each func (cdr l))
    )
  )
)



