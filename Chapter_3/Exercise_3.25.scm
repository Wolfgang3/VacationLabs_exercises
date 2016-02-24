;; implemetation of a table in which values are stored under an arbitrary number of keys
;=>
;with refrence to acc proc on pg no. 268
(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    
    ;accoc procedure
    (define (assoc key records)
      (cond ((null? records) false)
            ((same-key? key (caar records)) (car records))
            (else (assoc key (cdr records)))))

    (define (lookup key_list) 
      (define (lookup-iter keys table)
        (let ((subtable (assoc (car keys) (cdr table))))
          (if subtable
              (if (null? (cdr keys))
                  (cdr subtable)
                  (lookup-iter (cdr keys) subtable))
              false)))
      (lookup-iter key_list local-table))

    (define (insert! key_list value)
      (define (make-entry keys)
        (if (null? (cdr keys)) 
            (cons (car keys) value)
            (list (car keys) (make-entry (cdr keys)))))
      (define (insert-iter keys table) 
        (let ((subtable (assoc (car keys) (cdr table))))
          (if subtable
              (if (null? (cdr keys))
                  (set-cdr! subtable value)
                  (insert-iter (cdr keys) subtable))
              (set-cdr! table
                        (cons (make-entry keys)
                              (cdr table))))))
      (insert-iter key_list local-table)
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

; ex run for creating a 2d table
(define table2 (make-table eq?))
(define get (table2 'lookup-proc))
(define put (table2 'insert-proc!))
(put '(a x) 1)
(put '(a y) 2)
(put '(b x) 3)
(put '(b y) 4)

(get '(a x))
;Value: 1
(get '(a y))
;Value: 2
