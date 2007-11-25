import Ratio
import Data.List

diff d = 3%7 - (d * 3 `div` 7) % d

main = print $ 3%7 - (foldl1' min $ filter (>0) $ map diff [1..1000000])
