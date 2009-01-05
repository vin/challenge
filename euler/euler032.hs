import Primes
import Data.List

pandigitalProduct n = let fs = factors n in
  any (== "123456789") $ map (sort . concatMap show) $ [[n,f,n`div`f] | f <- fs]

main = print $ sum $ filter pandigitalProduct [1000..9999]
