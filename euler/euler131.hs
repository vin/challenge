import Primes

smallPrimes = takeWhile (<10^6) primes

isCube n = n == last (takeWhile (<=n) cubes)
cubes = map (^3) [1..]

results = [ p | p <- smallPrimes, n <- [1..p], isCube (n^3 + p*n^2)]
