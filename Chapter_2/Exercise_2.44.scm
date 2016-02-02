;this exercise was solved using DrRacket
#lang racket
(require sicp-pict)
(paint einstein)

;up-split procedure 
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define pic (up-split einstein 2))
(paint pic)
;got the correct output