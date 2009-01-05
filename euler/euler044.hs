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

-- generates a list of pairs of pentagonal numbers that add up to n.
pentagonalSum :: Integer -> [(Integer,Integer)]
pentagonalSum n = map (id &&& (n-)) $ filter (isPentagonal.(n-)) candidates
  where candidates = takeWhile(<n) . dropWhile (<n`div`2) $ pentagonals

-- a list of pairs of pentagonals whose sums are pentagonal
pentagonalPairs = concatMap pentagonalSum $ pentagonals

-- we'll filter out only the pairs whose differences are also pentagonal
differenceIsPentagonal :: (Integer, Integer) -> Bool
differenceIsPentagonal = isPentagonal.uncurry (-)

main = print . uncurry(-) . head . filter differenceIsPentagonal $ pentagonalPairs
