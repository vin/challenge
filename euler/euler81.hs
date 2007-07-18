import Data.List

traverse matrix = scanl minrow [] matrix

minrow [] row = scanl1 (+) row
minrow prev row = zipWith (+) row $ zipWith min prev (head prev:minrow prev row)

main = do
  readFile "matrix.txt" >>=
    print . last . last . traverse . map (map read.words) . lines
