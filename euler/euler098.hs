import Data.List
import Data.Ord
import Data.Maybe

eqing :: (Eq b) => (a -> b) -> a -> a -> Bool
eqing fn a b = (fn a) == (fn b)

sortedEq = eqing sort

fstEq :: (Eq a) => (a,b) -> (a,b) -> Bool
fstEq = eqing fst
sndEq :: (Eq b) => (a,b) -> (a,b) -> Bool
sndEq = eqing snd

squares = map (\x -> x*x) [1..]

digit :: Int -> [Integer] -> [Integer]
digit len = takeWhile ((== len).length.show) . dropWhile((< len).length.show)


anagrams :: [String] -> [[String]]
anagrams = filter (not.null.drop 1) . groupBy sortedEq . sortBy (comparing sort)

-- longest anagram from a list of anagrams
maxlen :: [[String]] -> Int
maxlen = maximum . map (length.head)

{-
stringMap :: Int -> [String] -> [String]
stringMap n (s:ss) = let numstring = show n in
-}

-- rearrange a string according to a permutation list
-- e.g. permute "ABCD" [0,1,3,2] -> ABDC
permute _ [] = ""
permute cs (n:ns) = (cs!!n) : permute cs ns

-- e.g. unpermute "ABCD" "ABDC" -> [0,1,3,2]
unpermute _ "" = []
unpermute from (c:cs) = (fromJust . elemIndex c $ from) : unpermute from cs

isSquare n = (==n) . head . dropWhile (<n) $ squares

uniqueMap s n = let mapping = nub . sort . zip s . show $ n in
  null . drop 1 . group . map (\f -> f mapping) $ [nubBy fstEq, nubBy sndEq, nub]
{-
- e.g.:
-  > filter (uniqueMap "foo") $ 3 `digit` squares
-  [100,144,400,900]
-  > filter (uniqueMap "ofo") $ 3 `digit` squares
-  [121,484,676]
-}

candidatesquares s = filter (uniqueMap s) $ n `digit` squares
  where n = length s

success :: String -> String -> Integer -> Bool
success a b n = let permutation =  permute (show n) $ unpermute a b in
  (not . (== '0') . head $ permutation) && 
    (isSquare . read $ permutation)

squareAnagrams a b = filter (success a b) . candidatesquares $ a

main = do
  f <- readFile "words.txt"
  let ws = lines f
  let as = reverse . sortBy (comparing $ map length) . anagrams $ ws
  let candidates = filter (not.null) . map (\(a:b:cs) -> max (squareAnagrams a b) (squareAnagrams b a)) $ as
  print . head $ candidates

