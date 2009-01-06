import Primes
import List
import Char

isPanDigital :: Integral a => a -> Bool
isPanDigital n = let s = show n in
	sort s == map intToDigit [1..(length s)]

main = print . last . filter isPanDigital . takeWhile (<10000000) $ primes
