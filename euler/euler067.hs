{--
mysum 0 0 = head (head triangle)
mysum row 0 = head (sums !! (row - 1)) + head (triangle !! row)
mysum row col | col == row = (sums !! (row - 1)) !! (col - 1) + 
                             last (triangle !! row)
              | otherwise = max (sums !! (row - 1) !! col)
	                        (sums !! (row - 1) !! (col - 1))
				+ (triangle !! row) !! col
rowsum row = map (mysum row) [0..row]
--}

-- sums = map rowsum [0..length triangle - 1]

main = do
  triangle <- readFile "triangle.txt"
  let tri = map (map read.words) (lines triangle) :: [[Int]]
  print $ maximum $ rowsum (length tri - 1) tri


rowsum 0 triangle = triangle !! 0
rowsum (n+1) triangle = rowsum' (0:rowsum n triangle) (triangle !! (n+1))
	where
	rowsum' (a:b:cs) (x:xs) = (x + (max a b) ) : rowsum' (b:cs) xs
	rowsum' [a] [x] = [a+x]
