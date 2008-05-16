import Data.List

{--
 - We have a matrix of numbers.  We can use DP to construct a table from the
 - top-left down to the bottom-right, where each cell contains the max product
 - so far, referring only to cells above and to the left of itself.  Then we
 - just find the max value of the table.
 -}

threshold :: Int -> [Int] -> [String]
threshold n = map (go n) where
    go n x | x >= n    = show x
           | otherwise = "  "

main = do
  readFile "euler011.txt" >>=
    putStr . unlines . (map unwords) . map (threshold 85) . map (map read.words) . lines
