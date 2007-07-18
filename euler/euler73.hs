import Ratio
import Data.List

fracs = [n%d | d <- [1..8], n <- [ceil (d/3) .. d `div` 2]]

main = print $ length $ uniq $ sort fracs

uniq [x] = [x]
uniq (x:y:ys) | x == y    = uniq (y:ys)
              | otherwise = x : uniq(y:ys)
