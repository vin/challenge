import Data.Ratio

expansions = map expansion [0..]
expansion 0 = 1 % 1
expansion n = 1 + 1 / (1 + (expansions !! (n - 1)))

digits = length . show

count p = length . filter p

longerNumerator r = (digits . numerator $ r) > (digits . denominator $ r)

main = do
  putStrLn . show . count longerNumerator . map expansion $ [1..1000]
