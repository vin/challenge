main = print $ sumDiagonals 1001

--sumDiagonals 1 = 1
{-
sumDiagonals n = let 
  ne = n*n
  se = sw - n + 1
  sw = (n-1)*(n-1)+1
  nw = sw + n - 1
  in sumDiagonals (n-2) + ne + se + sw + nw
  -}
--sumDiagonals n = sumDiagonals(n-2) + n*n + 3*(n-1)*(n-1) + 3
--sumDiagonals n = sumDiagonals(n-2) + 4*sq n -6*n + 6
sumCorners 1 = 1
sumCorners n = 4*sq n -6*n + 6
sumDiagonals n = sum . map sumCorners $ [1,3..n]
--sumDiagonals n = (n-2)*(n-2) + 3*(n-3)*(n-3) + 3 + n*n + 3*(n-1)*(n-1) + 3
{-
sumDiagonals n = sq n - 4*n + 4 + 3*sq n - 18*n + 27 + 3 + 
               sq n + 3*sq n - 6*n + 3 + 3
-}
sq n = n*n
--sumDiagonals n =  8*sq n + 16*n + 40

{-
 - 43 44 45 46 47 48 49
 - 42 21 22 23 24 25 26
 - 41 20  7  8  9 10 27
 - 40 19  6  1  2 11 28
 - 39 18  5  4  3 12 29
 - 38 17 16 15 14 13 30
 - 37 36 35 34 33 32 31
 -}
