import Char
import List
import Maybe

score = sum . map ((flip (-) 64) . ord)

tri n = n * (n+1) `div` 2
tris = map tri [1..]

main = do 
	f <- readFile "words.txt"
	let scores = map score $ lines f in
		print . length $ map show [n | n <- scores,
						n `elem` (takeWhile (<=n) tris)]

