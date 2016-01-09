// mid point of a line segment
=>

;
(define (x-point pt)
  (car pt))

(define (y-point pt)
  (cdr pt))

; make-segment consists of two co-ordinates
(define (make-segment a b)
  (cons a b))


(define (start-segment x)
  (car x))

(define (end-segment y)
  (cdr y))

;to store the midpoints
(define (make-point x y)
  (cons x y))

;to calculate the midpoint
(define (midpoint ls)
  (make-point 
    (/ (+ (x-point (start-segment ls)) (x-point (end-segment ls))) 2)
    (/ (+ (y-point (start-segment ls)) (y-point (end-segment ls))) 2)))


;print the points
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


;run
(print-point 
  (midpoint 
    (make-segment 
      (make-point 0 0) 
      (make-point 5 5)
    )
  )
)

; value= (5/2,5/2)



