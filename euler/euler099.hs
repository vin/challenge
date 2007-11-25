import Data.List (maximumBy)
import Data.Ord (comparing)

--findMax :: [(Float,Float)] -> Integer
findMax = snd . maximumBy (comparing (val.fst)) . numberLines
  where
    val (a,b) = b*log a
    numberLines ts = zipWith (,) ts [1..]

--parseLine :: String -> (Float,Float)
parseLine s = let (a,b) = break (==',') s in (read a, read $ tail b)

main = do
  readFile "base_exp.txt" >>=
    print . findMax . map parseLine . lines
