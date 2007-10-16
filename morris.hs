-- e.g.: ["1", "11", "21", "1211", "111221", "312211", "13112221",
-- "1113213211", "31131211131221", "13211311123113112211"]

morris = iterate nextMorris "1"

nextMorris :: String -> String
nextMorris [] = ""
nextMorris s@(c:cs) = let (a,b) = span (== c) s in
	show (length a) ++ c:nextMorris(b)
