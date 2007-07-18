num = 317584931803

isPrime a = isPrimeHelper a primes

isPrimeHelper a (p:ps)
        | p*p > a = True
        | a `mod` p == 0 = False
        | otherwise = isPrimeHelper a ps

primes = 2 : filter isPrime [3..]

factor 1 = []
factor n = let f = head (filter (\p -> n `mod` p == 0) primes) in
	f: factor (n `div` f)
