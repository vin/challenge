--import Ratio

--diff d = 3%7 - (d * 3 `div` 7) % d
diff :: (Integral a, Fractional b) => a -> b
diff d = 3/7 - (d * 3 `div` 7) / d

main = print $ minimum $ map diff [1..1000000]
