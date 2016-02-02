#lang racket
(require sicp-pict)
;since a vector can be represented in a pair consisting of x-coord and y-coord
(define (make-vect x_cord y_cord)
  (cons x_cord y_cord))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))
              

(define (scale-vect x vect)
  (make-vect (* x (xcor-vect vect))
             (* x (ycor-vect vect)))) 

;run 
(define v1 (make-vect 1 2))
(define v2 (make-vect 3 4))
v1
; '(1 . 2)
v2
; '(3 . 4)
(add-vect v1 v2)
; '(4 . 6)
(sub-vect v1 v2)
; '(-2 . -2)
(scale-vect 2 v1)
; '(2 . 4)
