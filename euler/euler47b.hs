import Maybe
import Data.Map
import Data.List
import Control.Monad.State


type Hist = Map Int Int

check :: Int -> State Hist Bool
check soln =
        do h <- get
           return ((all (>=4)) (Data.List.map (\x -> findWithDefault 0 x h) [soln..soln+3]))

addFactor :: Int -> [Int] -> State Hist (Maybe Int)
addFactor f [] = return Nothing
addFactor f (x:xs) = do h <- get
                        if (x `mod` f == 0)
                          then
                           do
                            newh <- return (insertWith (+) x 1 h)
                            put newh
                            c <- check (x-3)
                            if c
                              then return (Just (x-3))
                              else addFactor f xs
                          else
                            addFactor f xs

pf limit = foldr (\a b -> isJust a || isJust b) (\f -> addFactor f [f,2*f..limit])





--addFactors fs xs :: [Int] -> [Int] -> State Hist (Maybe Int)
--addFactors fs = foldr

--limit = 10^6

-- main = print $ foldr (\ a b -> b || isJust a) False (map (check (>4)) [1..limit])

{--
 -
 - get a 2: for item in filter (\n -> n `mod` 2 == 0) xs
 -   foldr (\item hist -> insertWith (+) item 1)
 -
--}


