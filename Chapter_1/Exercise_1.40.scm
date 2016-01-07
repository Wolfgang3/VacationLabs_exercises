// procedure for cube method for newtons-method
=>
// with reference to procedures on page no. 73,74,75 and first-point from page no. 69


(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx))
)






