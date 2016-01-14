// complete the procedure
=> 
;refering to the procedure on pg no. 116
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence))
    )
  )
)

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p y) x) ) nil sequence)
)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate op 0 sequence)
)

;run exs from pg no. 116
(accumulate + 0 (list 1 2 3 4 5))
;value= 15

(accumulate * 1 (list 1 2 3 4 5))
;value= 120
