import Data.Array


data Cell = Cell (Int, [[Int]])
  deriving (Eq, Show, Ord)


change :: Int -> [Int] -> Cell
change total coins = valOf nCoins total
  where
    nCoins = length coins
    coinsArr = listArray (1, nCoins) coins
    coin n = coinsArr ! n
    table = array ((1,1),(nCoins, total)) $ 
            [ ((m, n), cell m n) | m <- [1..nCoins], n <- [1..total]]
    valOf m n
      | n == 0 = Cell (1, [[]])
      | n < 0  = Cell (0, [])
      | m <= 0 = Cell (0, [])
      | otherwise = table ! (m,n)
    cell m n 
      | otherwise = let Cell (ul, un) = valOf (m - 1) n
                        Cell (ll, ln) = valOf m (n - coin m)
                    in Cell (ul + ll, un ++ map (coin m:) ln)

main = let Cell (l,n) = change 100 [1..99] in print l

{-

2 = 1 + 1
(1) = 1

3 = 2 + 1
  = 1 + 1 + 1
(2) = 2

4 = 3 + 1
  = 2 + 2
  = 2 + 1 + 1
  = 1 + 1 + 1 + 1
(4) = 3 + 1

5 = 4 + 1
  = 3 + 2
  = 3 + 1 + 1
  = 2 + 2 + 1
  = 2 + 1 + 1 + 1
  = 1 + 1 + 1 + 1 + 1
(6) = 5 + 1

6 = 5 + 1
  = 4 + 2
  = 4 + 1 + 1
  = 3 + 3
  = 3 + 2 + 1
  = 3 + 1 + 1 + 1
  = 2 + 2 + 2
  = 2 + 2 + 1 + 1
  = 2 + 1 + 1 + 1 + 1
  = 1 + 1 + 1 + 1 + 1 + 1
(10) = 7 + 2 + 1

7 = 6 + 1
  = 5 + 2
  = 5 + 1 + 1
  = 4 + 3
  = 4 + 2 + 1
  = 4 + 1 + 1 + 1
  = 3 + 2 + 2
  = 3 + 2 + 1 + 1
  = 3 + 1 + 1 + 1 + 1
  = 2 + 2 + 2 + 1
  = 2 + 2 + 1 + 1 + 1
  = 2 + 1 + 1 + 1 + 1 + 1
  = 1 + 1 + 1 + 1 + 1 + 1 + 1
(13) = 10 + 2 + 1

8 = 7 + 1
  = 6 + 2
  = 6 + 1 + 1
  = 5 + 3
  = 5 + 2 + 1
  = 5 + 1 + 1 + 1
  = 4 + 4
  = 4 + 3 + 1
  = 4 + 2 + 2
  = 4 + 2 + 1 + 1
  = 4 + 1 + 1 + 1 + 1
  = 3 + 3 + 2
  = 3 + 2 + 2 + 1 
  = 3 + 2 + 1 + 1 + 1
  = 3 + 1 + 1 + 1 + 1 + 1
  = 2 + 2 + 2 + 2
  = 2 + 2 + 2 + 1 + 1
  = 2 + 2 + 1 + 1 + 1 + 1
  = 2 + 1 + 1 + 1 + 1 + 1 + 1
  = 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1
(20) = 14 + 4 + 1 + 1
-}
