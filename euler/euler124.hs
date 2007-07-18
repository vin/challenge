import Primes
import Data.List

uniq [] = []
uniq [x] = [x]
uniq (x:y:zs) | x == y = uniq (y:zs)
              | otherwise = x:uniq(y:zs)

rad = product . uniq . factor
rads = [(id n, rad n) | n <- [1..]]

main = print $ sortBy (\a b -> compare (snd a) (snd b)) (take (10^5) rads) !! 9999
