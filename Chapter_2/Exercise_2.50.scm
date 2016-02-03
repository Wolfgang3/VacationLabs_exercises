#lang racket
(require sicp-pict)

;transform-painter
(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
      (painter
       (make-frame new-origin
                   (sub-vect (m corner1) new-origin)
                   (sub-vect (m corner2) new-origin)))))))

;these are the coordinates
;;;;;;;;;;;;;;;;;;;;;;;
;(0,1)    (1,1)
;
;(0,0)    (1,0)
;;;;;;;;;;;;;;;;;;;;;;;

(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))
(paint (flip-vert einstein))

;for horizontal 
;origin will be (1,0)
;edge1 will be (0,0)
;edge2 will be (1,1)
(define (flip-horiz painter)
  (transform-painter painter
		     (make-vect 1.0 0.0)
		     (make-vect 0.0 0.0)
		     (make-vect 1.0 1.0)))
(paint (flip-horiz einstein))

;for 180deg rotate counterclockwise
(define (180rotate painter)
  (transform-painter painter
		     (make-vect 1.0 1.0)
		     (make-vect 0.0 1.0)
		     (make-vect 1.0 0.0)))
(paint (180rotate einstein))

;for 270deg
(define (270rotate painter)
  (transform-painter painter
		     (make-vect 0.0 1.0)
		     (make-vect 0.0 0.0)
		     (make-vect 1.0 1.0)))
(paint (270rotate einstein))
