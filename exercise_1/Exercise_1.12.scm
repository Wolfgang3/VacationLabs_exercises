// pascal's triangle
=>
conside the traingle as with 5 rows
   123456789

1  000010000
2  000101000
3  001020100
4  010303010
5  104060401

   123456789

1  1
2  11
3  121
4  1331
5  14641

(define (pascal_tri row col)		
  (cond ((= col 0) 1)
     	((= col row) 1)
        ((> col row) 0)
        ((< col row) (+ (pass (- row 1) (- col 1)) (pass (- row 1) col)))
  )
)


