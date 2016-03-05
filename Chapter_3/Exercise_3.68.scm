;; 
;=>
(define (pairs s t)
  (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                t)
    (pairs (stream-cdr s) (stream-cdr t))))

; the above procedure will not work.
; because the above procedure will result in an infinite loop cuz it recursively calls interleave and pairs. 
; it doesnt hav cons-stream for the delay


