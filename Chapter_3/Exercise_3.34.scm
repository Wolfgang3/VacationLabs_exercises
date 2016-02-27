;; Louis Reasoner's squarer procedure
;=> 
(define (squarer a b)
  (multiplier a a b))

;(multiplier m1 m2 product)
; the above procedure will not work if only the value of b is set, 
; because multiplier does not know the value of m1 and m2 to complete its process.