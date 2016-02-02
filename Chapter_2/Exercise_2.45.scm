;this exercise was solved using DrRacket
#lang racket
(require sicp-pict)
(paint einstein)

;define a general procedure split
(define (split p1 p2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split p1 p2) painter (- n 1))))
          (p1 painter (p2 smaller smaller))))))

;define right-split and up-split
(define right-split (split beside below))
(define up-split (split below beside))

;transform the painter
(define pic1 (right-split einstein 2))
(paint pic1)

(define pic2 (up-split einstein 2))
(paint pic2)
;got the correct output as observed in fig 2.14(pg.no. 133)

;check for corner-split procedure
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define pic3 (corner-split einstein 1))
(paint pic3)
;got the correct output as observed in fig 2.14(pg.no. 133)

;check for square-limit procedure
(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(define pic4 (square-limit einstein 6))
(paint pic4)
;got the correct output as observed in fig 2.9(pg.no. 127)

