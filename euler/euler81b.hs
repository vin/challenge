import Data.List

get row col mat = (mat !! row) !! col

--traverse mat = scanl minrow

--traversal row col mat = (mat !! y) !! x
minrow 0 mat = scanl1 (+) (head mat)
minrow row mat = zipWith (+) matrow ((head prev) : zipWith min (tail prev) (minrow row mat))
  where prev = minrow (row - 1) mat
        matrow = mat !! row

main = do
  matrix <- readFile "matrix.txt"
  let mat = map (map read.words) (lines matrix) :: [[Int]]
--  print $ last (minrow (length mat -1) mat)
  print $ minrow 0 mat
  print $ minrow 1 mat
  print $ minrow 20 mat
