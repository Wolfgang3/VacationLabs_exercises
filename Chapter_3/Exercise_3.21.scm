;; 
;=>
(define (make-queue)
  (cons '() '()))

(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue)
  (null? (front-ptr queue)))

(define (front-queue queue)
  (if (empty-queue? queue)
    (error "FRONT called with an empty queue" queue)
    (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
            (set-cdr! (rear-ptr queue) new-pair)
            (set-rear-ptr! queue new-pair)
            queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
          (error "DELETE! called with an empty queue" queue))
        (else
          (set-front-ptr! queue (cdr (front-ptr queue)))
          queue)))

;run
(define q1 (make-queue))
(insert-queue! q1 'a)
;value: ((a) a)
(insert-queue! q1 'b)
;value: ((a b) b)
(delete-queue! q1)
;value: ((a b) b)
(delete-queue! q1)
;value: ((a b) b)

;looking at the above result, queue doesnt return the list in a proper order
;(it shows the recent added element also) ie ((front-part)rear-part)
;the front-ptr display the full list which is present in the car part
;here the display-queue procedure will display the full queue
(define (display-queue queue)
  (display (front-ptr queue)))
;
(insert-queue! q1 'a)
(insert-queue! q1 'b)
(insert-queue! q1 'c)
(display-queue q1)
;value: (a b c)
