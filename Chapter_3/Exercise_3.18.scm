;; check to see if there is a cycle in the list
;=>

;in this procedure the list is divided into 2 parts.
;part 1 of the list moves slower then part 2
(define (check-cycle-iter part1 part2)
  ;(display "itr ")
  (cond 
    ((null? part2) display "no cycle in the list")
    ((eq? part1 part2) display "list contains cycle")
    (else (check-cycle-iter (cdr part1) (cddr part2)))))

;the main procedure 
(define (check-cycle lst)
  (cond
    ((null? lst) display "empty list")
    (else (check-cycle-iter lst (cdr lst)))))

;run
(define x (list 1 2 3))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
x)

;to make cycle on list x
(define c (make-cycle x))
(check-cycle c)
;value= "list contains cycle"