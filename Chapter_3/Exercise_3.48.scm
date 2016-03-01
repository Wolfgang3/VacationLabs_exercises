;; deadlock avoidance
;=> 
; by giving both accounts a unique id number, and then modifying procedures to lock and access only accounts
; with smaller id number. so in the above case peter has a1 and paul has a2. and peter wants a2 and paul want a1.
; so now according to the rule paul's process will be given hold of a1 since a1 has smaller id then a2
; so peter's process has to wait untill paul's process finishes its operation. and hence no deadlock.

;reference from pg no. 309
(define (make-account-and-serialized balance unique_id)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
                balance)
        "insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
            ((eq? m 'serializer) balance-serializer)
            ((eq? m 'unique_id) unique_id)
            (else (error "Unknown request -- MAKE-ACCOUNT" m))))
    dispatch))

(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer))
        (id1 (account1 'unique_id))
        (id2 (account2 'unique_id)))
    (if (> id2 id1)
        ((serializer1 (serializer2 exchange))
        account1
        account2)
        ((serializer2 (serializer1 exchange))
        account2
        account1))))