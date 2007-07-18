import Char

sumDigits n = sum $ map digitToInt $ show n

main = print $ maximum $ map sumDigits [ a^b | a <- [1..99], b <- [1..99]]
