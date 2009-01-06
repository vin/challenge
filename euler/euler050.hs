import Data.List
import Primes


primeSumSeqs = map (scanl1 (+)) (tails primes)

primeSums = map (last . takeWhile (<1000000)) $ primeSumSeqs

main = print . head . filter isPrime $ primeSums
