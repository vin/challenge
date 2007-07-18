{-
 - number of distinct permutations of 1 and 2 that add up to 50
 - for each n [1..25] we have (50-2n) + n tiles total
 - C(50-2n+n,n)
 -}

fac n = product [1..n]
comb n k = fac n `div` (fac k) `div` (fac (n-k))

rowcomb rowlength tilewidth = 
  sum [comb (rowlength - tilewidth * n + n) n | n <- [1..rowlength `div` tilewidth]]

main = print $ sum $ map (rowcomb 50) [2,3,4]
