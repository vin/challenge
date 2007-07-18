import Primes
import Data.List

remainder :: Integer -> Integer
remainder n = let pn = primes !! fromInteger (n-1) in
  (2 * n * pn)

main = print $ find (\n -> remainder n > (10^10)) [7037,7039..]
