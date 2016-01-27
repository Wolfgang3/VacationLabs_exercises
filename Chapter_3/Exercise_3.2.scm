// make-monitored procedure
=>

(define (make-monitored f)
  (let ((ct 0))
    (define (mf arg)
      (cond ((eq? arg 'how-many-calls?) ct)
            ((eq? arg 'reset-count) (set! ct 0))
            (else (begin (set! ct (+ ct 1)) (f arg)))
      )
    )
  mf)
)

;run
(define s (make-monitored sqrt))
(s 100)
;Value: 10
(s 'how-many-calls?)
;Value: 1
(s 'reset-count)

(s 'how-many-calls?)
;Value: 0
