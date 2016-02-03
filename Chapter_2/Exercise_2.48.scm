#lang racket
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

;make-segment will be same as make-vector
(define (make-segment x y)
  (cons x y))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))




