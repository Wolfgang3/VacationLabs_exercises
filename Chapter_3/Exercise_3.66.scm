;; 
;=>
;refering to pairs and interleave procedure
; the stream pair formed by (1 2 3 4)= (1 2)(1 3)(1 4)
; (1 1) + interleaved items from s1 n s2
;   1   +   2(n-1) 
; therefore, no. of pairs for (1,n) will be 2(n – 1) - 1 (-1 since we want preceding)
; so, pairs preceeding the pair (1,100) will be [2(100-1) + 1]= 2*99 -1= 198
;
; for (99,100), 
;
