denominations = [ 200, 100, 50, 20, 10, 5, 2, 1]

change :: Integer -> [Integer] -> [[Integer]]
change 1 _ = [[1]]
change 0 _ = [[]]
{--
 -ex: change 3 [2,1] = [2:change 1 [2,1], 1:change 2 [1]]
 -    change 4 [2,1] = [2:change 2 [2,1], 1:change 3 [1]]
 -    change 5 [5,2,1] = [5:change 0 [5,2,1], 2:change 3 [2,1], 1:change 4 [1]]
 -    change 6 [5,2,1] = [5:change 1 [5,2,1], 2:change 4 [2,1], 1:change 5 [1]]
 -  but since change gives [[Integer]], when I say "5:change 1 [5,2,1]", that
 -  really means "map (5:) (change 1 [5,2,1])", and we use concatMap to string
 -  them together.
 -}
change n denominations = let ds = (filter (<=n) denominations) in
    concatMap (\d -> map (d:) $ change (n-d) (filter (<=d) ds)) ds


change2 n [] = 0
change2 0 _ = 1
change2 n coins
  | n < 0 = 0
  | otherwise = change2 (n - head coins) coins + change2 n (tail coins)



main = print $ length $ change 200 denominations
