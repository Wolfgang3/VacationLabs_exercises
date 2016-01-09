// better version of make-rat
=>
; reference to the previous procedures of make-rat n print-rat

(define (numer n)
  (car n))

(define (denom n)
  (cdr n))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
)


(define (make-rat_modified n d)
  (let ((g (gcd n d)))
    (if (and (< n 0) (< d 0))
      (cons (/ (* n -1) g) (/ (* d -1) g))
      (cons (/ n g) (/ d g))      
    )
  )
)


; (print-rat (make-rat_modified -6 -3))
; value= 2/1

; (print-rat (make-rat_modified -6 3))
; value= -2/1

; (print-rat (make-rat_modified 6 3))
; value= 2/1

; (print-rat (make-rat_modified 6 -3))
; value= 2/-1

