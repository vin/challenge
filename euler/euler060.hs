import Primes
import Data.List(nub)


--import Data.List(permutations)
permutations            :: [a] -> [[a]]
permutations []         =  [[]]
permutations (x:xs)     =  [zs | ys <- permutations xs, zs <- interleave x ys ]
  where interleave          :: a -> [a] -> [[a]]
        interleave x []     =  [[x]]
        interleave x (y:ys) =  [x:y:ys] ++ map (y:) (interleave x ys)

concatInts :: [Integer] -> Integer
concatInts (a:b:[]) = read . shows a . show $ b

success ps = all isPrime.map concatInts.nub.map (take 2).permutations $ ps

-- now just get the first set of five primes that satisfies success...
