=> 
tree illistration
consider the count change procedure on page 40-41 of the book
(count-change amount)
the amount given in the problem is 11
therefore,
(count-change 11)
(cc 11 5)
(+ (cc 11 4) (cc (- 11 50) 5))   	# else part is executed and kinds-of-coins are 5 so 50 is printed 
(+ (+ (cc 11 3) (cc (- 11 25) 4)) (cc -39 5))
(+ (+ (+ (cc 11 2) (cc (- 11 10) 3)) (cc -14 4)) (cc -39 5))

this will contiue to build a big tree.

as the amount increase the order of growth and the number of steps might increase exponentially.




