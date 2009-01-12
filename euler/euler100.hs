import Control.Arrow

odds :: Integer -> Integer -> Float
odds blues total = let b = fromIntegral blues
                       t = fromIntegral total
                   in (b / t) * (b - 1) / (t - 1)

success blues total = 0.5 == odds blues total

bagsize :: Integer -> (Integer, Float)
bagsize blues = (id &&& odds blues) . head . dropWhile ((>0.5) . odds blues) $ [blues * 3 `div` 2 - 1 ..]
