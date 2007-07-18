import Primes

isSquare = isSquare' . fromInteger
isSquare' :: (RealFloat a) => a -> Bool
isSquare' n = (snd . properFraction . sqrt) n == 0

oddComposites = filter (not.isPrime) [3,5..]

check n = any isSquare . map (\p -> (n - p)`div`2) . takeWhile (<n) $ primes

main = print $ head . dropWhile check $ oddComposites
