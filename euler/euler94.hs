import Data.List (find)

constructTriangles :: Integer -> [(Integer,Integer,Integer)]
constructTriangles n = [(n,n,n+1),(n,n+1,n+1)]

perimeter :: (Integer,Integer,Integer) -> Integer
perimeter (a,b,c) = (a+b+c)

triangles = takeWhile ((<10^9).perimeter) (concatMap constructTriangles [1..])

isSquare n = (find (>=n) squares == Just n)

squares = map (^2) [1..]

area (a, b, c) = let s = ((a+b+c)/2) in
  sqrt (s*(s-a)*(s-b)*(s-c))

squareArea (a, b, c) = let s = ((a+b+c)`div`2) in
  (s*(s-a)*(s-b)*(s-c))

--integralArea = isSquare.squareArea

integralArea = isSquare.squareArea

main = print $ sum . (map perimeter) . filter integralArea $ triangles
