// make-cycle procedure using the prev exercise
=>
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
x)

(define z (make-cycle (list 'a 'b 'c)))
;when we run (last-pair z)
;=> we dont get any output cuz z doesnt hav a last pair
;=> if we try to display z, we get a infinite loop

;structure drawn and explained on the notebook