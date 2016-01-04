// to complete the procedure 1st we define a function for square
// next to defie sum of square
//last is to check which is greater
(define (square x) (* x x))  
(define (sum-of-squares x y) (+ (square x) (square y))) 
  
(define (sum-of-squared-largest-two x y z) 
	(cond ((= (min x y z) x) (sum-of-squares y z)) 
	((= (min x y z) y) (sum-of-squares x z)) 
	((= (min x y z) z) (sum-of-squares x y)))) 
