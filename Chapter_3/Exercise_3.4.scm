// make-account with call-the-cops
=>
;previous procedure of make-account
(define (make-account balance acc_password)
  (define attempts 0)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "insufficient funds"
    )
  )
  (define (deposit amount)
    (begin (set! attempts 0))
    (set! balance (+ balance amount))  
  balance)
  ;call the cops procedure
  (define (call-the-cops)
    (begin (set! attempts 0))
    (error "the cops r on thier way(number of attempts exceeded)")
  )

  (define (dispatch password m)
    (if (eq? acc_password password)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "unknown request -- MAKE-ACCOUNT" m))
      )

      (if (>= attempts 6)
        (call-the-cops)
        (begin (set! attempts (+ attempts 1))
               error "incorrect password")
      )
    )
  )
dispatch)

;run
(define acc (make-account 100 'aa))
((acc 'aa 'withdraw) 40) ;sucessfull
;Value: 60

;for not sucessfull attempts(incorrect password)
((acc 'bb 'deposit) 50)
((acc 'bb 'deposit) 50)
((acc 'bb 'deposit) 50)
((acc 'bb 'deposit) 50)
((acc 'bb 'deposit) 50)
((acc 'bb 'deposit) 50)
((acc 'bb 'deposit) 50)
;after 7 wrong trials
;;the cops r on thier way(number of attempts exceeded)
