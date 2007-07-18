import Ratio
import Data.Set

diff d  = 3%7 - (d * 3 `div` 7) % d
fracs = fromList [diff d | d <- [1..1000000], d > 0]

uniq [x] = [x]
uniq (x:y:ys) | x == y = uniq (y:ys)
              | otherwise = x:uniq(y:ys)

main = print $ (3%7 - findMin (delete (0%1) fracs))
