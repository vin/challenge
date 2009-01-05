import Control.Arrow
import Primes

primeLength f = length . takeWhile isPrime $ map f [0..]

quad a b x = x*x + a*x + b

main = print . snd . maximum $ map (primeLength . uncurry quad &&& id) [(a,b) | a <- [-999..999], b <- [-999..999]]
