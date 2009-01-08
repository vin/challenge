import Data.List

traverse :: [[Int]] -> [[Int]]
traverse = tail . scanl minrow [] . transpose

--minrow :: [Int] -> [Int] -> [Int]
minrow [] row = row
minrow prev row = zipWith min left right
  where left = minrow' prev row
        right = reverse $ minrow' (reverse prev) (reverse row)

minrow' p r = zipWith (+) r $ zipWith min p (head p:minrow' p r)


main = do
  readFile "matrix.txt" >>=
    print . minimum . last . traverse . map (map read.words) . lines

