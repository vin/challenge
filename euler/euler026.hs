import Primes
import Control.Arrow

{- Wikipedia: Recurring Decimal:
-- The period of the repeating decimal of 1⁄p is equal to the order of 10
-- modulo p. The period is equal to p-1 if 10 is a primitive root modulo p.
- We just use our list of primes, so we can ignore multiples of 10.
- "order of 10 modulo p" means the smallest k st 10^k = 1 (mod p)
-}

cycle_length p = head $ dropWhile (\k -> 10^k `mod` p /= 1) [1..]

main = print . snd . maximum $
            map (cycle_length &&& id) $ takeWhile (< 1000) $ drop 10 primes
