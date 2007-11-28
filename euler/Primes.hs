module Primes (isPrime, primes, factor, numfactors) where
import Data.List (group)

isPrime a = isPrimeHelper a primes

isPrimeHelper a (p:ps)
        | p*p > a = True
        | a `mod` p == 0 = False
        | otherwise = isPrimeHelper a ps

primes = 2 : filter isPrime [3,5..]

factor 1 = []
factor n = let f = head (filter (\p -> n `mod` p == 0) primes) in
    f: factor (n `div` f)

numfactors n = product $ map ((+1).length) $ (group.factor) n
