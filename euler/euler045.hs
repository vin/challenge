
intersect _ [] = []
intersect [] _  =[]
intersect (x:xs) (y:ys) = case compare x y of
  LT -> intersect xs (y:ys)
  EQ -> x : intersect xs ys
  GT -> intersect (x:xs) ys
  

pents = scanl1 (+) [1,4..]
hexs = scanl1 (+) [1,5..]

main = print . head . drop 2 $ intersect pents hexs
