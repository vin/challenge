import Data.List

uniq [] = []
uniq [x] = [x]
uniq (x:y:ys) | x == y = uniq (y:ys)
	    | otherwise = x:uniq (y:ys)

main = print $ length $ uniq $ sort $ [a^b | a <- [2..100], b <- [2..100]]
