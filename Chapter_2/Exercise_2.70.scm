// 
=> 
;using the generate-huffman-tree procedure of exercise 2.69
;encode procedure of exercise 2.68 is incomplete

;run
(define song_tree '((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1)) )
(generate-huffman-tree song_tree)
;value= (((leaf na 16) ((leaf yip 9) (((leaf a 2) ((leaf wah 1) (leaf boom 1) (wah boom) 2) (a wah boom) 4) ((leaf sha 3) ((leaf job 2) (leaf get 2) (job get) 4) (sha job get) 7) (a wah boom sha job get) 11) (yip a wah boom sha job get) 20) (na yip a wah boom sha job get) 36))


;===> total 36 bits are required for the symbols

;to encode
;incomplete without the procedure for encode in exercise 2.68
