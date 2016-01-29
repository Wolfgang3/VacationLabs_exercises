// alternate syntax for make-withdraw procedure
=>

;using let
; (let ((<var> <exp>)) <body>)
(define (make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount))
                balance)
        "insufficient funds"
      )
    )
  )
)

;using lambda
; ((lambda (<var>) <body>) <exp>)
(define (make-withdraw initial-amount)
  ((lambda (balance)
    (lambda (amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount))
                balance)
        "insufficient funds"
      )
    )
  )
  initial-amount)
)

;=> environment model of the above alternate procedure using lambda is drawn on the note book
