import Primes
import Control.Arrow

cycle_length n = length $ 10 : (takeWhile (not . (==10)) . map (\k -> 10^k `mod` n)) [2..]

main = putStrLn . show $ snd . maximum $
            map (cycle_length &&& id) (takeWhile (< 1000) (drop 10 primes))
