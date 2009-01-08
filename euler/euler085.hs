import Data.List(sort)

fac n = product [1..n]

comb n k = fac n `div` fac k `div` fac (n-k)

rectangles x y = comb (x+1) 2 * comb (y+1) 2

main = print . uncurry(*) . snd . head . sort $
   [(r, (x,y)) | x <- [1..100], y <- [1..100], let r = abs (rectangles x y - 2000000)]

{-

** = 1 + 2 + 2 + 4 = 9
**

*** = 1 + 2 + 3

*** = 1 + 2 + 3 + 2 + 4 + 6 = 18
*** 

*** = 1 + 2 + 3 + 2 + 4 + 6 + 3 + 6 + 9 = 6 + 12 + 18 = 36
***
***

**** = 1 + 2 + 3 + 4 = 10

**** = 1 + 2 + 3 + 4 + 2 + 4 + 6 + 8 = 10 + 20 = 30
**** 

**** = 1 + 2 + 3 + 4 
**** + 2 + 4 + 6 + 8 
**** + 3 + 6 + 9 + 12 = 60

-}
