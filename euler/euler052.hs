import Data.List

digits :: Integer -> String
digits = sort . show
main = print $ head [n | n <- [1..],
	digits n == digits (2*n),
	digits n == digits (3*n),
	digits n == digits (4*n),
	digits n == digits (5*n),
	digits n == digits (6*n)]
