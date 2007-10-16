-- e.g.: ["1", "11", "21", "1211", "111221", "312211", "13112221",
-- "1113213211", "31131211131221", "13211311123113112211"]
import Data.List

morris = iterate nextMorris "1"

nextMorris :: String -> String
nextMorris = concatMap (\a -> show (length a) ++ [head a]) . group
