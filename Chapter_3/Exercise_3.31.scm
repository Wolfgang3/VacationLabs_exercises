;; why accept-action-procedure! defined in make-wire?
;=>

; the procedure accept-action-procedure! has to be initialize in the wire because
; it has to be executed immediately, if not then the system will not run
; cuz inorder to make the system run the signal must be added to the agenda.
; no signal would propagate

;Without executing the procedure immediately the system would never actually start 
