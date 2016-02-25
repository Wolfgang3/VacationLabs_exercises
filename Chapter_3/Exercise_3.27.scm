;; memo-fib procedure using memoize concept
;=>
; this memo-fib procedure, takes few steps to find the nth Fibonacci number
; because this procedure doesnt duplicate the work
; it stores the computed value in a table with a lookup with the number
; so, when next time a procedure is called with that same number 
;     it searches in the table with the loop up to retun the value.

; if we had to define memo-fib to be (memoize fib) then it would hav not look up in the table.
;     so this would not hav resulted in the same order of steps
