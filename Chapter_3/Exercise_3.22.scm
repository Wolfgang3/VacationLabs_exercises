;; queue as procedure with local state 
;=>
;refering to procedure on pg no. 260
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()) )
  ;definition of procedures used by dispatch
  (define (empty-queue?)
    (null? front-ptr))

  (define (front-queue)
    (if (empty-queue?)
        (error "FRONT called with empty an queue")
        (car front-ptr)))

  (define (display-queue)
    (if (empty-queue?)
        (error "queue is empty")
        (display front-ptr)))

  (define (insert-queue! item)
    (let ((new-pair (cons item '())))
      (cond ((empty-queue?)
              (set! front-ptr new-pair)
              (set! rear-ptr new-pair)
              dispatch)
            (else 
              (set-cdr! rear-ptr new-pair)
              (set! rear-ptr new-pair)
              dispatch))))

  (define (delete-queue!)
    (cond ((empty-queue?)
            (error "DELETE! called with an empty queue")
            dispatch)
          (else
            (set! front-ptr (cdr front-ptr))
            dispatch)))

  (define (dispatch m)
    (cond ((eq? m 'empty-queue?) (empty-queue?))
          ((eq? m 'front-queue) (front-queue))
          ((eq? m 'insert-queue!) insert-queue!)
          ((eq? m 'delete-queue!) (delete-queue!))
          ((eq? m 'display-queue) (display-queue))
    ))
  dispatch))

(define (empty-queue? queue)
  (queue 'empty-queue?))

(define (front-queue queue)
  (queue 'front-queue))

(define (insert-queue! queue item)
  ((queue 'insert-queue!) item))

(define (delete-queue! queue)
  (queue 'delete-queue!))

(define (display-queue queue)
  (queue 'display-queue))


;run
(define q2 (make-queue))
(insert-queue! q2 'a)
(insert-queue! q2 'b)
(insert-queue! q2 'c)
(front-queue q2)
;value: a
(empty-queue? q2)
;value: #f
(display-queue q2)
;value: (a b)