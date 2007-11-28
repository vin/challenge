import Data.List
import Primes (numfactors)

tris = scanl1 (+) [1..]

main = print $ find ((>= 500) . numfactors) tris
