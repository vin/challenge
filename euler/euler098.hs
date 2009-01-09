import Data.List
import Data.Ord
import Control.Arrow

eqing :: (Eq b) => (a -> b) -> a -> a -> Bool
eqing fn a b = (fn a) == (fn b)

sortedEq = eqing sort

fstEq :: (Eq a) => (a,b) -> (a,b) -> Bool
fstEq = eqing fst

squares = map (\x -> x*x) $ [1..]

digit :: Int -> [Integer] -> [Integer]
digit len = map snd . takeWhile ((== len).fst) . dropWhile((< len).fst). map (length.show &&& id) 


anagrams :: [String] -> [[String]]
anagrams = filter (not.null.drop 1) . groupBy sortedEq . sortBy (comparing sort)

-- longest anagram from a list of anagrams
maxlen :: [[String]] -> Int
maxlen = maximum . map (length.head)

{-
stringMap :: Int -> [String] -> [String]
stringMap n (s:ss) = let numstring = show n in
-}



uniqueMap s = all (null.drop 1.group) . groupBy fstEq . sort . zip s . show
{-
- e.g.:
-  > filter (uniqueMap "foo") $ 3 `digit` squares
-  [100,144,400,900]
-  > filter (uniqueMap "ofo") $ 3 `digit` squares
-  [121,484,676]
-}

candidatesquares s = filter (uniqueMap s) $ n `digit` squares
  where n = length s

main = do
  f <- readFile "words.txt"
  let ws = lines f
  print . map (map (length.candidatesquares)) . anagrams $ ws

