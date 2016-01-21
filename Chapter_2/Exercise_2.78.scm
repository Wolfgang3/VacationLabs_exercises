// modify type-tag, contents n attach-tag to work in the genetic system
=>
; with reference to the procedures on page no. 176
;ordinary numbers should be represented simply as a scheme numbers rather than as pairs whose car is the symbol scheme-number
(define (attach-tag type-tag contents)
  (cond ((number? contents) contents)
        (else (cons type-tag contents))
  )
)

(define (type-tag datum)
  (cond ((number? datum) datum)
        ((pair? datum)
          (car datum))
        (else (error "bad tagged datum -- TYPE-TAG" datum))
  )
)

(define (contents datum)
  (cond ((number? datum) datum)
        ((pair? datum)
          (cdr datum))
        (else (error "bad tagged datum -- CONTENTS" datum))
  )
)
