import Poker
import Control.Arrow

hands :: [Card] -> (Hand,Hand)
hands = (hand . take 5 &&& hand . drop 5)

winner :: (Hand,Hand) -> Int
winner (p1,p2) = case compare p1 p2 of
  GT -> 1
  LT -> 2
  EQ -> 0

main = do
  f <- readFile "poker.txt"
  let games = map (map (read::String->Card).words) $ lines f
      winners = map (winner.hands) games
    in
      --putStr $ unlines $ map (show.(winner.hands &&& hands)) games
      print $ length . filter (==1) $ winners
