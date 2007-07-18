import Data.List
import Primes

tri n = n * (n+1) `div` 2
tris = map tri [2500..]

--factors = ((map (factors' 1) [0..]) !!)
factors = factors' 1
  where
    factors' k n | k*k > n        = []
		 | k*k == n       = [k]
		 | n `mod` k == 0 = k : n `div` k : factors' (k+1) n
		 | otherwise      = factors' (k+1) n

main = print $ find ((>= 500) . length . factors) tris
