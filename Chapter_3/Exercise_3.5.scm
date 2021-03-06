// check if the point lies in the circle using monte carlo integration
=>
;;;;;;;;;;;
(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x
    )
  )
)
;;;;;;;;;;;;

;from the question
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))
  )
)

;predicate is described as a region contained in the circle with radius 2 and centered at (5,7)
(define (predicate x y)
  (let ( (lhs (+ (square (- x 5)) (square (- y 7)))) )
    (<= lhs (square 3))
  )
)

(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials c)))
)

(define (estimate-integral predicate x1 x2 y1 y2 trials)
  ;test, to check if predicate holds true(point lies in the given rectangle)
  (define (test) (predicate (random-in-range x1 x2)
                            (random-in-range y1 y2)) 
  )
  (display "status=")
  (display (predicate (random-in-range x1 x2)
                            (random-in-range y1 y2)))
  (newline)
  (monte-carlo trials test)
)


;monte-carlo
(define (monte-carlo trials experiment)
  (define (iter trials-ramining trials-passed)
    (cond ((= trials-ramining 0)
            (/ trials-passed trials))
          ((experiment)
            (iter (- trials-ramining 1) (+ trials-passed 1))
          )
          (else
            (iter (- trials-ramining 1) trials-passed)
          )
    )
  )
(iter trials 0))

;run (points of rectangle (2,4) (8,10) and 100 trials)
(display (estimate-integral predicate 2 8 4 10 100))
;this will give a random point
