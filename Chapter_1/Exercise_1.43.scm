// repeate procedure 
=> 
;with reference to exercise 1.42

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f count)
  (if (= count 0)
    (lambda (x) x)
    (compose f (repeated f (repeated f (- count 1)) 
               )
  )
)

; to run ((repeated square 2) 5)
; value= 625


