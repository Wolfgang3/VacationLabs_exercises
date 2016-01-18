// reasoning if duplicates are allowed in the previous procedures
=>
; from the previous procedures like adjoin-set there will not be any conditional check if the element exist in the set
;the element can be directely added on the set. Same goes for union-set
; intersection-set remains same

(define (adjoin-set x set)
  (cons x set)
)

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (adjoin-set (car set1) (union-set (cdr set1) set2)) )
  )
)

;run
(define set1 (list 1 2 3))
(define set2 (list 3 4 5))
(union-set set1 set2)
;value= (1 2 3 3 4 5)


; the procedures union-set and teh adjoin-set will hav good run speed and performance and hense efficiency is better
