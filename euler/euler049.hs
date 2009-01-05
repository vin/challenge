import Primes
import Data.List(nub,isPrefixOf,sort,group)

--import Data.List(permutations)
permutations            :: [a] -> [[a]]
permutations []         =  [[]]
permutations (x:xs)     =  [zs | ys <- permutations xs, zs <- interleave x ys ]
  where interleave          :: a -> [a] -> [[a]]
        interleave x []     =  [[x]]
        interleave x (y:ys) =  [x:y:ys] ++ map (y:) (interleave x ys)


candidates = takeWhile (<9999) $ dropWhile (<1000) $ primes

differences (a:[]) = []
differences (a:b:cs) = (b-a):differences (b:cs)

candidates2:: [Integer]
-- This is a beast:
-- first get all the 4-digit permutations of each 4-digit prime.
candidates2 = filter (any (>1).map length.group.differences.sort.filter isPrime.map read.filter (not.isPrefixOf "0").nub.permutations.show) candidates

