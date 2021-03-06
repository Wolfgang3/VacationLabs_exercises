condition: f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n -3) if n> 3
=>
// first i define a function funct
(define (funct n) 
   (if (< n 3) 
	n 
        (+ (funct (- n 1)) 
                  (* 2 (funct (- n 2))) 
                  (* 3 (funct (- n 3))))
    )
) 


ex: (funct 3) then, funct(2)+2*funct(1)+3*funct(0)
		    = 2 + 2(1) + 3(0) = 4
