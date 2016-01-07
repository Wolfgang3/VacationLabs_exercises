// to complete the procedure 1st we define a function sum of square
//last is to check which is greater
=>
(define (sum_of_squares x y) (+ (* x x) (* y y ))) 
(define (largest_sum_of_squares x y z) 
	(cond ((= (min x y z) x) (sum_of_squares y z)) 
	((= (min x y z) y) (sum_of_squares x z)) 
	((= (min x y z) z) (sum_of_squares x y)))) 
