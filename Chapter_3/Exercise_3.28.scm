;; or-gate procedure primitive function box
;=>
(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
            (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
                    (lambda ()
                      (set-signal! output new-value)))))
  (or-action! a1 or-action-procedure)
  (or-action! a2 or-action-procedure)
  'ok)
