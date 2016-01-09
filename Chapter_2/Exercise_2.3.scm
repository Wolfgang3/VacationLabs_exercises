// area n perimeter of a rectangle
=>
; area of rectangle is length*breadth
; for this prob i amtaking 4 points of the rectangle

(define (x-point pt)
  (car pt))

(define (y-point pt)
  (cdr pt))

; make-segment consists of two co-ordinates
(define (make-segment a b)
  (cons a b))

(define (make-point x y) 
  (cons x y)
)

(define (start-segment x)
  (car x))

(define (end-segment y)
  (cdr y))


(define (square x) (* x x))

; get length
(define (rectangle_length pt1 pt2) 
  (sqrt (+ (square (- (x-point pt2) (x-point pt1)))
      	   (square (- (y-point pt2) (y-point pt1)))
        )
  )
)

; get breadth
(define (rectangle_breadth pt1 pt2) 
  (sqrt (+ (square (- (x-point pt2) (x-point pt1)))
      	   (square (- (y-point pt2) (y-point pt1)))
        )
  )
)

; area of rectangle
(define (rectangle_area a b) 
  (*(rectangle_length (start-seg a) (end-seg a))
    (rectangle_breadth (start-seg b) (end-seg b))
  )
)

; perimeter of rectangle
(define (rectangle_perimeter a b) 
  (* 2 (+ (rectangle_length (start-seg a) (end-seg a))
      	  (rectangle_breadth (start-seg b) (end-seg b)))
  )
)

;
(define (rectangle_area_perimeter a b) 
  (newline) 
  (display "area of the rectangle is: ")
  (rectangle_area a b) 

  (newline)
  (display "Perimeter of the rectangle is: ")
  (rectangle_perimeter a b)
)
       

; run
(rectangle_area_perimeter 
  (make-segment (make-point 0 0) 
                (make-point 3 0))
  (make-segment (make-point 0 0)
      		(make-point 0 4))
)


