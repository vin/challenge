import Primes
import Data.List

uniq [] = []
uniq [x] = [x]
uniq (x:y:zs) | x == y = uniq (y:zs)
              | otherwise = x:uniq(y:zs)

rad = product . uniq . factor
rads = map rad [1..]

nthSmallest n xs = find (\i -> length (filter (<i) xs) == n) xs

main = print $ nthSmallest 9999 (take (10^5) rads)
