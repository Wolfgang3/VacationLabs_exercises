// make-account with password
=>
;previous procedure of make-account
(define (make-account balance acc_password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "insufficient funds"
    )
  )
  (define (deposit amount)
    (set! balance (+ balance amount))  
  balance)

  (define (dispatch password m)
    (if (eq? acc_password password)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "unknown request -- MAKE-ACCOUNT" m))
      )
    ("incorrect password")
    )
  )
dispatch)

;run
(define acc (make-account 100 'aa))

((acc 'aa 'withdraw) 40)
;Value: 60
((acc 'bb 'deposit) 50)
;incorrect password
