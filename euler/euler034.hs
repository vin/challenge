import Char
fac n = product [1..n]

sumfac :: Int -> Int
sumfac = sum . map fac . map digitToInt . show

main = print $ sum [ n | n <- [10..100000], sumfac n == n]
