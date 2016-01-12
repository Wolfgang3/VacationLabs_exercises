// reverse a list
=> 

;note append is a inbuild function
(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l)) ) ; everytime it append the car (first node) to the last
  )
)

;run
(reverse (list 1 4 9 16 25))
;value= (25 16 9 4 1)


