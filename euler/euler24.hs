import Data.List

permutation [] = [[]]
permutation xs = [x:ys | x <- xs, ys <- permutation (delete x xs)]

main = print (permutation "0123456789" !! 999999)
