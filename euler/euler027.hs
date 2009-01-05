import Control.Arrow
import Primes
import Data.List(foldl1', maximumBy)
import Data.Ord(comparing)

primeLength f = length . takeWhile isPrime $ map f [0..]

quad a b x = x*x + a*x + b


maximumByComparing' :: (Ord a, Ord b) => (a -> b) -> [a] -> a
maximumByComparing' cmp = snd . maximum . map (cmp &&& id)

main = print $ maximumByComparing' (primeLength . uncurry quad) [(a,b) | b <- takeWhile(<1000) primes, a <- [(-b)..b]]

--main = print . snd . maximum $ map (primeLength . uncurry quad &&& id) [(a,b) | b <- takeWhile (<1000) primes, a <- [(-b)..b]]
