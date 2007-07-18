isPalindrome x = show x == (reverse . show) x

main = print $ maximum $ filter isPalindrome [x*y | x <- [999,998..100], y<-[999,998..100]]
