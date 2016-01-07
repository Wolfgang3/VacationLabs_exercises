// modified fixed-point
=>
; refering to previous problem 

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (newline )
    (display guess)
    (display " Count=")
    (display count)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
      (try next (+ count 1)))))
  (try first-guess 1))

(define (average a b)
  (/ (+ a b) 2))

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 10)
; output: 
10 Count=1
6.5 Count=2
5.095215099176933 Count=3
4.668760681281611 Count=4
4.57585730576714 Count=5
4.559030116711325 Count=6
4.55613168520593 Count=7
4.555637206157649 Count=8
4.55555298754564 Count=9
4.555538647701617 Count=10
Value=> 4.555536206185039

