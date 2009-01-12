import Data.List

cubes = map (\x -> x*x*x) [1..]

digit :: Int -> [Integer] -> [Integer]
digit len = takeWhile ((== len).length.show) . dropWhile((< len).length.show)


isCube n = (==n) . head . dropWhile (<n) $ cubes

permutation [] = [[]]
permutation xs = [x:ys | x <- xs, ys <- permutation (delete x xs)]

permute :: Integer -> [Integer]
permute = map read . nub . permutation . show

-- lazier than (==5).length
lengthIs5 (a:b:c:d:e:xs) = null xs
lengthIs5 _ = False

main = print . head . filter (lengthIs5.filter isCube.permute) $ cubes
