// to obtain n-fold smoothed function
=> 
; with referenc from prev repeated procedure 
(define dx 0.00001)

(define (smoothing_avg f) 
  (lambda (x) (/ (+ (f (- x dx)) 
                    (f x) 
                    (f (+ x dx))
                 ) 
               3)
  )
)

(define (repeated smoothing_avg n)
  (if (= n 0)
    (lambda (x) x)
    (compose smoothing_avg (repeated smoothing_avg (- n 1))
                           )
  )
)


(define (n-fold_smoothed f n)
  (repeated (smoothing_avg f) n)
)

; to run
; ((n-fold_smoothed square 5) 1.0)
; value:  1.0000000020666668


