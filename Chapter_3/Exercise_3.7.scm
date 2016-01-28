// joint account procedure
=>
;modifying the procedure of exercise_3.3
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

(define (make-joint amount_name password new_password)
  (define (action pass m)
    (if (eq? pass new_password)
        (amount_name password m)
        (error "wrong password - MAKE-JOINT :=" pass)
    )
  )
action)

;run
(define peter-acc (make-account 500 'aa))
((peter-acc 'aa 'withdraw) 40)
;value: 460
((peter-acc 'aa 'deposit) 10)
;value: 470
(define paul-acc
  (make-joint peter-acc 'aa 'rosebud))

((paul-acc 'rosebud 'withdraw) 100)
;value: 370
((paul-acc 'rose 'withdraw) 100)
;;wrong password - MAKE-JOINT := rose
