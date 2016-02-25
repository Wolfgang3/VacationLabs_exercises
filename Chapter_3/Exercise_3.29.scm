;; or-gate procedure build from and-gates n inverters
;=>
;diagram drawn on the notebook
;a and b are input,ai and bi will be the inverter of a and b respectively
; c will be the and output of ai and bi
;   ouput will be the final value of or-gate when c is inverted

(define (or-gate a b output)
  (let ((ai (make-wire))
        (bi (make-wire))
        (c (make-wire)))
    (inverter a ai)
    (inverter b bi)
    (and-gate ai bi c)
    (inverter c output)
  'ok))

; dont know the delay