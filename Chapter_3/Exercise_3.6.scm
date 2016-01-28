// to modify rand procedure to reset 
=>
;we have to put two procedures in rand ('generate and 'reset)
(define random-init 87)
(define r_number 0)

;rand-update to update new value of a random number
(define (rand-update x)
  ;so given in footnote 6 
  ;ax+b modulo m (take any random numbers)
  ;(modulo (+ (* a x) b) m)
  (modulo (+ (* 10 x) 20) 30)
)

(define rand
  (let ((x random-init))
    (define (action arg)
      (cond ((eq? arg 'generate) 
             (begin (set! x (rand-update x))
               x))
            ((eq? arg 'reset) 
              (lambda (new_init)
                (set! random-init new_init)))
            (else (error "unknown option" arg))
      )
    )
  action)
)

;run
(rand 'generate)
;any random value using modulo
((rand 'reset) 99)
(rand 'generate)
;any random value using modulo




