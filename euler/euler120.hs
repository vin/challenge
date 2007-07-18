--r a n = ((a-1)^n + (a+1)^n) `mod` (a^2)

r a n
  | n `mod` 2 == 0    = 2
  | otherwise         = 2*a*n `mod` (a^2)


rmax a
  | a `mod` 2 == 0  =  (a^2) - 2*a
  | otherwise       =  (a^2) - a

main = print $ sum $ map rmax [3..1000]

