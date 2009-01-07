import Data.Char(isSpace,ord,chr)
import Data.Bits(xor)
import Data.List(isInfixOf)

words' s
  | findComma == [] = []
  | otherwise = w : words' s''
  where
  (w, s'') = break isComma findComma
  findComma = dropWhile isComma s
  isComma s = (==',') s || isSpace s

keychars = map ord ['a'..'z']

keys = [cycle [a,b,c] | a <- keychars, b <- keychars, c <- keychars]

main = do
  f <- readFile "cipher1.txt"
  let cipher = (map read . words' $ f :: [Int])
      candidates = filter (isInfixOf " the ") [map chr $ zipWith xor key cipher | key <- keys]
  print $ map (sum.map ord) candidates
  
