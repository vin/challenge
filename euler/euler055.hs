import Control.Arrow

isPalindrome :: Integer -> Bool
isPalindrome = uncurry (==) . (show &&& reverse.show)

isLychrel = try 50
  where
    try 0 _ = True
    try i n | isPalindrome (next n) = False
            | otherwise = try (i - 1) (next n)

next :: Integer -> Integer
next n = n + (read.reverse.show) n

main = print . length . filter isLychrel $ [1..10000]
