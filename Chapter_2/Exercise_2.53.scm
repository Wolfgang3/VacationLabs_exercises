// print the result
=> 

(list 'a 'b 'c)
;value= (a b c)

(list (list 'george))
;value= ((george))

(cdr '((x1 x2) (y1 y2)))
;value= ((y1 y2))

(cadr '((x1 x2) (y1 y2)))
;value= (y1 y2)

(pair? (car '(a short list)))
;value= #f

(memq 'red '((red shoes) (blue socks)))
;value= #f

(memq 'red '(red shoes  blue socks))
;value= (red shoes blue socks)
