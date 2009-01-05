import Ratio


main = print . denominator . product $ [n%d | n <- [1..100],
                                              d <- [n..100],
                                              n /= d,
                                              d `mod` 10 /= 0,
                                              n `mod` 10 == d `div` 10,
                                              (n `div` 10) % (d `mod` 10) == n % d]


