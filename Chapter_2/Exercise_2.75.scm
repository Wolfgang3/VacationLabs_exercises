// make-from-mag-ang
=>
;with reference form the procedure on pg no. 186
;as seen from pg no. 183, the real-part is the result of magnitude and sin 
; & the imag-part is the result of magnitude and cos of angle
(define (make-from-mag-ang m a)
  (define (dispatch op) 
    (cond ((eq? op 'magnitude) m)
          ((eq? op 'angle) a)
          ((eq? op 'real-part)
            (* (magnitude m) (cos (angle a))) )
          ((eq? op 'imag-part)
            (* (magnitude m) (sin (angle a))))
          (else (error "Unknown op -- MAKE-FROM-MAG-ANG" op))
    )
  )
dispatch)

