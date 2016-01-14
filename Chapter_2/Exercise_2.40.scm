// unique pairs
=> 
;previous procedure
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence))))
)

(define (prime-sum? pair)
  (prime? (+ (car pair) (cdr pair))
  )
)

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter prime-sum?
      (unique-pairs n)
  ))
)

(define (flatmap proc seq)
  (accumulate append () (map proc seq))
)

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))
  )
)

;referring to procedure on pg. 123
;
(define (unique-pairs n)
  (flatmap
        (lambda (i)
          (map (lambda (j) (list i j))
              (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n))
)

;run
(unique-pairs 10)
;value= ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4))

(prime-sum-pairs 5)

