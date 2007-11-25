import List
import Char

isPrime a = isPrimeHelper a primes

isPrimeHelper a (p:ps)
        | p*p > a = True
        | a `mod` p == 0 = False
        | otherwise = isPrimeHelper a ps

primes = 2 : filter isPrime [3..]

isPanDigital :: Integral a => a -> Bool
isPanDigital n = let s = show n in
	sort s == map intToDigit [1..(length s)]

