module Change(change, Cell(Cell)) where
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

