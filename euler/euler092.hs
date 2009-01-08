sumSquareDigits n | n < 10 = n*n
                  | otherwise = let units = n `mod` 10 in units*units + sumSquareDigits (n `div` 10)

good :: Int -> Bool
good = (==89) . head . dropWhile (\n -> n /=89 && n /= 1) . iterate sumSquareDigits

main = print . length . filter good $ [1..10000000]
