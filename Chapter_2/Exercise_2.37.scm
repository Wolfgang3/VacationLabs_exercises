// complete the given matrix procedure
=> 
;previous procedure
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence))
    )
  )
)

;previous exercise 2.36 procedure 
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    nil
    (cons (accumulate op init (map (lambda (x) (car x)) seqs) )
          (accumulate-n op init (map (lambda (x) (cdr x)) seqs) )
    )
  )
)

(define (dot-product v w)
  (accumulate + 0 (map * v w))
)

;matrix-*-vector has to use the dot-product
(define (matrix-*-vector m v)
  (map (lambda (r) (dot-product r v)) m))

;
(define (transpose mat)
  (accumulate-n cons nil mat))

;
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)
  )
)

;accumulate-n procedure was giving nul error for previous exercise
