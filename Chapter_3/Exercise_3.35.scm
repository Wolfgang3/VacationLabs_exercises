;; ben bitdiddle's solution
;=> 
(define (squarer a b)
  (define (process-new-value)
    (if (has-value? b)
      (if (< (get-value b) 0)
        (error "square less than 0 -- squarer" (get-value b))
        ;check which value is given 
        <alternative1>)
      <alternative2>))
  (define (process-forget-value) <body1>)
  (define (me request) 
    (cond ((eq? request 'have-a-value)
           (process-new-value))
          ((eq? request 'lost-the-value)
           (process-forget-value))
          (else (error "Unknown operation - SQUARER " request))
    ))
  ;<rest of def>
  me)