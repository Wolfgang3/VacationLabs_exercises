// width of an interval
=>
;using the reference of earlier procedures on page: 94

as given in the problem, width of an interval is half of the difference between its upper bound and lower bound
=> [(a b) + (c d)] =[(b+d)-(a+c)]/2
 
as given in the problem, the width of the resulting combination of two intervals is a function only of the widths of the argument intervals
=> width(a b) + width (c d) 
   = (b-a)/2 + (d-c)/2		    
   = 1/2[(b-a) + (d-c)]
   = 1/2[(b+d) - (a+c)]    ;rearranging the terms
   

now with help of example we check for multiplication,
  [(1 5) * (6 12)] = [(5*12) - (1*6)]/2
                   = [60 -6]/2
		   = [54]/2 =27

  width(1 5) * width(6 12)
 = (5-1)/2 * (12-6)/2
 = 4/2 * 6/2
 = 2 * 3
 =6 
,as we can see from above the proof doent hold true for multiplication and division

				


