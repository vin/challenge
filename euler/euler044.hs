import Data.List(find)
import Maybe
import Control.Arrow

--pentagonals = map (\n -> n * (3 * n - 1) `div` 2) [1..]
pentagonals = scanl1 (+) [1,4..]

--isPentagonal n = n `elem` takeWhile (<=n) pentagonals
isPentagonal :: Integer -> Bool
isPentagonal n = let d = 24 * n + 1
                     root = (round.sqrt.fromIntegral) d in
  (root*root == d) && root `mod` 6 == 5

pentagonalSum n = case find (isPentagonal.(n-)) $ takeWhile(<=n) pentagonals of
  Just r -> Just (r, n-r)
  Nothing -> Nothing

results1 = [p | Just p <- map pentagonalSum pentagonals]

differenceIsPentagonal :: (Integer, Integer) -> Bool
differenceIsPentagonal = isPentagonal.(uncurry.flip) (-)

isPentagonalSum n = any (isPentagonal.(n-)) $ takeWhile(<=n) pentagonals

main = print . head $ filter differenceIsPentagonal results1
