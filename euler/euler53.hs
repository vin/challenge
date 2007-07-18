fac n = product [1..n]
comb n k = fac n `div` (fac k) `div` (fac (n-k))

main = print $ length [(n,r) |  n <- [23..100], r <- [1..n], comb n r > 10^6]
