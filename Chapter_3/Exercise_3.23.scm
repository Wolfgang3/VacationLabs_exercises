;; deque (double ended queue) procedure 
;=>
(define (make-deque)
  (cons '() '()))

(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))
(define (set-front-ptr! deque item) (set-car! deque item))
(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (empty-deque? deque)
  (null? (front-ptr deque)))

;selectors
(define (front-queue deque)
  (if (empty-deque? deque)
    (error "FRONT called with an empty deque")
    (car (front-ptr deque))
    ))

(define (rear-queue)
  (if (empty-deque? deque)
    (error "REAR called with an empty deque")
    (cdr (rear-ptr deque))
  ))

;mutators
(define (front-insert-deque! deque item)
  (let ((new-pair (cons item '())))
    (cond ((empty-deque? deque)
            (set-front-ptr! deque new-pair)
            (set-rear-ptr! deque new-pair)
            deque)
          (else
            (set-front-ptr! deque (cons new-pair (front-ptr deque)))
            deque)))))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item '())))
    (cond ((empty-deque? deque)
            (set-front-ptr! deque new-pair)
            (set-rear-ptr! deque new-pair)
            deque)
          (else
            (set-cdr! (rear-ptr deque) new-pair)
            (set-rear-ptr! deque new-pair)
            deque)))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
          (error "DELETE called with an empty deque" deque))
        (else
          (set-front-ptr! deque (cdr (front-ptr deque)))
          deque)))

;to remove the last element in the list
(define (remove-last lst)
  (if (null? (cdr lst))
    '()
    (cons (car lst) (remove-last (cdr lst)))))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
          (error "DELETE called with an empty deque" deque))
        (else
          ;to delete the last element
          (set-front-ptr! deque (remove-last (front-ptr deque)))
          (set-rear-ptr! deque (cddr (front-ptr deque)))
          deque)))

;run
(define dq (make-deque))
(rear-insert-deque! dq 'a)
;value: ((a) a)
(rear-insert-deque! dq 'b)
;value: ((a b) b)
(rear-insert-deque! dq 'c)
;value: ((a b c) c)
(front-insert-deque! dq 'n)
;value: (((n) a b c) c)
(front-ptr dq) ; to display the full deque
;value: ((n) a b c)
(front-delete-deque! dq)
;value: ((a b c) c)
(rear-delete-deque! dq) ;not correct
;value: 

