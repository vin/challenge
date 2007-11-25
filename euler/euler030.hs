sumFifths 0 = 0
sumFifths n = (mod n 10)^5 + sumFifths (div n 10)

main = print . sum . take 6 . tail . filter (\n -> n == sumFifths n) $ [1..]
