;; 
;=> 
(define s (cons-stream 1 (stream-map s s)))

; according to the above procedure,
; each element in the stream will be double 
; so the resulting stream will be,
; (1 2 4 8 16 .....)