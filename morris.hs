s = "1113213211"

morris 0 = "1"
morris (n+1) = nextMorris $ morris n

nextMorris :: String -> String
-- nextMorris s = 
nextMorris [] = ""
nextMorris s = let (a,b) = break (\x -> x /= s !! 0) s in
	show (length a) ++ [head a] ++ nextMorris(b)
