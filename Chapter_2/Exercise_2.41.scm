// 
=> 
;referring to previous exercise 2.40
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence))))
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

(define (unique-pairs n)
  (flatmap
        (lambda (i)
          (map (lambda (j) (list i j))
              (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n))
)

;referring to procedure on pg. 123
(define (unique-triples number)
  (if (< number 3)
      ()
      (append (unique-triples (- number 1))
         (map (lambda (x) (append x (list number)))
              (unique-pairs (- number 1))
         )
      )
  )
)

;run
(unique-triples 5)
;value= ((2 1 3) (2 1 4) (3 1 4) (3 2 4) (2 1 5) (3 1 5) (3 2 5) (4 1 5) (4 2 5) (4 3 5))


