// employee record system
=>
;part a): procedure for get-record

;get-record must take two parameters personnel_file and name and return employee details
;assume that there is a personnel_file where all the data of the employees are kept in a row form
(define (get-record personnel_file name)
  (define (get-record-iter row personal-file name)
    (if(null? row)
        (display "cant find records of this employee")
      (if (get 'get-record row)
        record
        (get-record-iter (next-row) personal-file name)
      )
    )
    (get-record-iter row personal-file name)
  )
)

;part b): procedure for get-salary
;assume that salary info isplaced in the same record personnel_file 
(define (get-salary personnel_file name)
  (define (iter row personal-file name)
    (if(null? row)
        (display "cant find record of this employee")
      (if (get 'get-salary row)
        (salary record)
        (iter (next-row) personal-file name)
      )
    )
    (iter row personal-file name)
  )
)

;part c): find-employee-record procedure
;this searches all personnel_files for the record of the employee
(define (find-employee-record employee_name)
  (define (personal-file-iter row personal-file name)
    (define (iter row personal-file name)
      (if(null? row)
          (display "cant find record of this employee")
        (if (get 'find-employee-record row)
          record
          (iter (next-row) personal-file name)
        )
      )
      (iter row personal-file name)
    )
    (personal-file-iter row personal-file name))
)

;part d): they must update the info of the employee in the personnel_file