;; example of deadlock
;=> 
; the deadloack avoidance mechenism doesnt solve all the posible scenarios.
; consider a program which when runs, and at some point in the execution requires 
;  a input from the user, this wil result in a deadlock if the keyboard is used by 
;   some other operation.

; now this cannot be avoided, since there is no idea whether or not the program requires
;  other resources to complete.