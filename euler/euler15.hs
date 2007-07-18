fac n = product [1..n]
comb n k = fac n `div` (fac k) `div` (fac (n-k))
