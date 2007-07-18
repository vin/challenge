import Char (digitToInt)

irr = concatMap show [0..]

main = print $ product $ map (digitToInt . (irr !!) . (10^)) [0..6]
