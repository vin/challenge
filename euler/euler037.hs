import Primes

isTruncatablePrime :: Integer -> Bool
isTruncatablePrime n | n == 0 = True
			| n < 10 = False
			| otherwise = isPrime n &&
				isTruncatableL n &&
				isTruncatableR n

isTruncatableL 0 = True
isTruncatableL n = isPrime n && isTruncatableL (n `div` 10)

isTruncatableR n = isPrime n && (n < 10 || isTruncatableR (read . tail . show $ n))

main = print $ sum $ take 11 $ filter isTruncatablePrime primes
