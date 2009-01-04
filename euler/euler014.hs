import Data.List(unfoldr, maximumBy, foldl1')
import Data.Ord(comparing)
import Control.Arrow


collatz = unfoldr next
  where
    next 0 = Nothing
    next 1 = Just (1, 0)
    next n
      | even n = Just (n ,n `div` 2)
      | odd n  = Just (n, 3 * n + 1)

collatz2 1 = [1]
collatz2 n = n : collatz2 next
  where next | even n = n `div` 2
             | odd n  = 3 * n + 1

-- main = do
--   print $ foldl1' max $ map (length.collatz) [1..1000000]

maximumBy' :: (a -> a -> Ordering) -> [a] -> a
maximumBy' _ [] =  error "List.maximumBy: empty list"
maximumBy' cmp xs =  foldl1' max xs
                         where
                            max x y = case cmp x y of
                                         GT -> x
                                         _  -> y 

main = putStrLn . show $ snd . maximum $ map ((length &&& id) . collatz) [1..1000000]
