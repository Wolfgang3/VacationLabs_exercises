;; averager procedure using primitive multiplier, adder and constatnt
;=> 
(define (averager a b c)
  ;two values to store the sum and the average
  (let ((x (make-connector))
        (y (make-connector)))
    (adder a b x)
    constant 2 y)
    (multiplier c y x)
    ))
