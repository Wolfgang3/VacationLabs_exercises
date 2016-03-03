;; 
;=> 

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

;stream-enumerate-interval procedure on pg no. 321
(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
      (stream-enumerate-interval (+ low 1) high))))

(define seq (stream-map accum (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq))

(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                          seq))

(stream-ref y 7)
;with refrence from pg no. 320
(define (stream-for-each proc s)
  (if (stream-null? s)
    'done
    (begin (proc (stream-car s))
           (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(display-stream z)

;
;initially sum =0
;after seq, sum =1
;after y, sum=6
;after z, sum=10

(stream-ref y 7)
;sum= 136
(display-stream z)
;10
;15
;45
;55
;105
;120
;190
;210
; sum= 210

; Yes.....the responses will differ if we didnt use the memo-proc
; because the value of sum would hav to be calculated again and again 
;  cuz the previous sum is not saved