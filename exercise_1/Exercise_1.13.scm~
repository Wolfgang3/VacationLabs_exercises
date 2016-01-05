// proof of fibonacci
=>
with reference to the section 1.2.2. there is a rule of fibonacci numbers
	| 0  			if n=0
fib(n)=	| 1			if n=1
	| fib(n-1)+fib(n-2)	otherwise

T.P.T. fib(n)=(Φ^n - Ψ^n)/sq_root(5)


for n=0 : (Φ^0 - Ψ^0)/sq_root(5)
	  = 0

for n=1 : (Φ^1 - Ψ^1)/sq_root(5)
	  = [ (1+sq_root(5))/2 - (1-sq_root(5))/2 ] / sq_root(5)
	  = [ (1+sq_root(5)-1 +sq_root(5))/2 ] / sq_root(5)
	  = [ 2*sq_root(5) ] / 2 sq_root(5)
	  = 1

for otherwise:

 fib(n) = fib(n-1)+fib(n-2)
	= (Φ^n-1 - Ψ^n-1)/sq_root(5) + (Φ^n-2 - Ψ^n-2)/sq_root(5)
	= [ (Φ^n-1 + Φ^n-2) - (Ψ^n-1 + Ψ^n-2) ]/sq_root(5)
	= [ Φ^n(Φ^-1 + Φ^-2) - Ψ^n(Ψ^-1 + Ψ^-2)]/sq_root(5)
	now substitute values of Φ n Ψ
	= [ Φ^n( 2/(1+sq_root(5)) + 4/(1+sq_root(5))^2 ) 
	  - Ψ^n( 2/(1-sq_root(5)) + 4/(1-sq_root(5))^2 )  ]/sq_root(5)

	= [ Φ^n( 2/(1+sq_root(5)) + 4/(1+2sq_root(5)+5) ) 
	  - Ψ^n( 2/(1-sq_root(5)) + 4/(1-2sq_root(5)+5) )  ]/sq_root(5)

	= [ Φ^n( 2/(1+sq_root(5)) + 4/(6+2sq_root(5)) ) 
	  - Ψ^n( 2/(1-sq_root(5)) + 4/(6-2sq_root(5)) )  ]/sq_root(5)

	= [ Φ^n( 2/(1+sq_root(5)) + 2/(3+sq_root(5)) ) 
	  - Ψ^n( 2/(1-sq_root(5)) + 2/(3-sq_root(5)) )  ]/sq_root(5)      # taking 2 common 

	= [ Φ^n( 6+2sq_root(5) + 2+2sq_root(5) )/ 3+sq_root(5)+3sq_root(5)+5 
	  - Ψ^n( 6-2sq_root(5) + 2-2sq_root(5) )/ 3-sq_root(5)-3sq_root(5)+5  ]/sq_root(5)    # cross multiply

	= [ Φ^n( 8+4sq_root(5))/ 8+4sq_root(5) 
	  - Ψ^n( 8-4sq_root(5))/ 8-4sq_root(5) ]/sq_root(5) 

	= [ Φ^n - Ψ^n ]/sq_root(5)   # as required



