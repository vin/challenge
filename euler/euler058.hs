
diagonals 0 = [1]
diagonals n = let step = 2*n
                  base = (2*n-1)^2
		  in [base + i*step | i <- [1..4]]
