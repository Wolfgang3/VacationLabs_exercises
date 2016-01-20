// employee record system
=>
;part a): procedure for get-record

;get-record must take two parameters personnel_file and name and return employee details
;assume that there is a file and in that file all the data of the employees are kept in a row form
(define (get-record personnel_file name)
  (define (get-record-iter row emp-name personal-file)
    (if(null? row)
        (display "cant find records of this employee")
      (if (get 'get-record row)
        record
        (get-record-iter (next-row) emp-name personal-file)
      )
    )
    (get-record-iter row emp-name personal-file)
  )
)
