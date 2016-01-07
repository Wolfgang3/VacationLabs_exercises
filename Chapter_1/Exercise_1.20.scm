//Gcd(greatest common devisor)
=> there are two procedures 

normal order:
given (gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
// normal order gave 

applicative order evaluation:
(gcd 206 40) 
(gcd 40 (remainder 206 40)) 
(gcd 40 6) 
(gcd 6 (remainder 40 6)) 
(gcd 6 4) 
(gcd 4 (remainder 6 4)) 
(gcd 4 2) 
(gcd 2 (remainder 4 2)) 
(gcd 2 0)
// aplicative order gave 4 remainders

