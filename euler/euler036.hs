isPalindrome s = s == reverse s

showBinary 1 = "1"
showBinary 0 = "0"
showBinary n = showBinary (div n 2) ++ showBinary (mod n 2)

main = print . sum . filter (isPalindrome . showBinary) . filter (isPalindrome . show) $ [1..10^6-1]
