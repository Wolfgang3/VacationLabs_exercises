#lang racket
(require sicp-pict)

;segment->painter procedure

;a) to draw the outline of a frame
;define points
(define p1 (make-vect 0 0))
(define p2 (make-vect 0 1))
(define p3 (make-vect 1 0))
(define p4 (make-vect 1 1))
(define frame (list (make-segment p1 p3)
		    (make-segment p3 p4)
		    (make-segment p4 p2)
	            (make-segment p2 p1)))
;run
(define outline_frame (segments->painter frame))
(paint outline_frame)
;didnt get outline


;b) to draw the X
;define the points
(define q1 (make-vect 0 0))
(define q2 (make-vect 0 1))
(define q3 (make-vect 1 0))
(define q4 (make-vect 1 1))
(define x (list (make-segment q1 q4)
		(make-segment q2 q3)))
;run
(define xmark (segments->painter x))
(paint xmark)
;x was drawn

;c) to draw a diamond shape
;define the points
(define r1 (make-vect 0 0.5))
(define r2 (make-vect 0.5 0))
(define r3 (make-vect 1 0.5))
(define r4 (make-vect 0.5 1))
(define dia (list (make-segment r1 r2)
		  (make-segment r2 r3)
                  (make-segment r3 r4)
                  (make-segment r4 r1)))
;run
(define diamond (segments->painter dia))
(paint diamond)
;diamond was drawn

;d) to draw a wave
