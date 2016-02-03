#lang racket
(require sicp-pict)
;both definations of make-frame are same
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame edge1 edge2)
  (cons origin (cons edge1 edge2)))

;first we define origin, edge1 and edge2
(define origin (make-vect 0 0))
origin

(define edge1 (make-vect 4 1))
edge1

(define edge2 (make-vect -1 4))
edge2

;run
(make-frame origin edge1 edge2)
;this will construct the frame