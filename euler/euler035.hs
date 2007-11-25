import Primes

rotate s = tail s ++ [head s]

rotations n = let s = show n in
  map read $ take (length s) $ iterate rotate s

check = all isPrime . rotations

main = print $ length . filter check $ takeWhile (<10^6) primes
