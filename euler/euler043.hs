import Data.List(delete)

permutations [] = [[]]
permutations xs = [x:p | x <- xs, p <- permutations (delete x xs)]

pandigitals = permutations "1234567890"

substring length offset = take length . drop offset

a `divides` b = b `mod` a == 0

conditions s = map (\(offset, divisor) -> divisor `divides` read (substring 3 offset s))
                   [ (1,2)
                   , (2,3)
                   , (3,5)
                   , (4,7)
                   , (5,11)
                   , (6,13)
                   , (7,17)
                   ]


main = print $ sum $ map read $ filter (and.conditions) pandigitals
