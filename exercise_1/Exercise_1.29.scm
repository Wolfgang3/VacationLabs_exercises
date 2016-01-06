// simpsons rule
=>
// for this problem i hav to take 4 parameters with reference from the code on pg no. 60 
// given the value of h=(b-a)/n and Yk=f(a+kh)
// using recursion for procedure

(define (cube x) (* x x x))

(define (simpsons_rule f a b n)

  (define h(/ (- b a) n))

  (define (addh x)
    (+ x (/ (- b a) n))
   )

  (define (first_term c)
    (if (remainder (/ (- c a) h)
      2
  (* (/ (/ (- b a) n) 3)               
     (sum first_term a addh b)
  )
)


ex: (simpson-integral cube 0 1 100)




