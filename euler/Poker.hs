module Poker (Suit, Card, rankToInt, ace, jack, queen, king, Hand, deck, hand) where

import Data.List(sort, group)
import Char(digitToInt, intToDigit)

data Suit = Club | Diamond  | Heart | Spade deriving (Eq, Ord)
data Card = Card { rank :: Int 
                 , suit   :: Suit
                 }
          deriving (Eq, Ord)


rankToInt 'A' = 1
rankToInt 'T' = 10
rankToInt 'J' = 11
rankToInt 'Q' = 12
rankToInt 'K' = 13
rankToInt c = digitToInt c

intToRank 1 = 'A'
intToRank 10 = 'T'
intToRank 11 = 'J'
intToRank 12 = 'Q'
intToRank 13 = 'K'
intToRank c = intToDigit c

showsCard :: Card -> ShowS
showsCard (Card r s) = (intToRank r:) . shows s

instance Show Card where
  showsPrec _ c = showsCard c

readsCard :: ReadS Card
readsCard (rankChar:suitChar:rest) =
    [(Card (rankToInt rankChar) suit, remainder) |
                      (suit,remainder) <- readsSuit (suitChar:rest)]
readsCard _ = []

showsSuit :: Suit -> ShowS
showsSuit s = ((case s of
  Club -> 'C'
  Diamond -> 'D'
  Heart -> 'H'
  Spade -> 'S'
  ):)

instance Show Suit where
  showsPrec _ s = showsSuit s

readsSuit :: ReadS Suit
readsSuit ('C':rest) = [(Club, rest)]
readsSuit ('D':rest) = [(Diamond, rest)]
readsSuit ('H':rest) = [(Heart, rest)]
readsSuit ('S':rest) = [(Spade, rest)]
readsSuit _ = []

instance Read Card where
  readsPrec _ s = readsCard s

instance Read Suit where
  readsPrec _ s = readsSuit s

ace, jack, queen, king :: Int
ace   = 1
jack  = 11
queen = 12
king  = 13


deck :: [Card]
deck = [ Card i s | i <- [ 1..13 ], s <- [ Club, Diamond, Heart, Spade ] ]


data HandType = HighCard  | Pair | TwoPair | ThreeOfAKind | Straight | Flush
          | FullHouse | FourOfAKind | StraightFlush 
          deriving (Eq, Show, Ord)

data Hand = Hand { handType :: HandType
                 , cards :: [Card]
                 } deriving (Eq, Show, Ord)

hand :: [Card] -> Hand
hand cs = 
    Hand (case matches of 
        [1,1,1,1,1] -> case undefined of
                           _ | isStraight && isFlush -> StraightFlush
                           _ | isFlush               -> Flush
                           _ | isStraight            -> Straight
                           _ | otherwise             -> HighCard
        [1,1,1,2]                                    -> Pair
        [1,2,2]                                      -> TwoPair
        [1,1,3]                                      -> ThreeOfAKind
        [2,3]                                        -> FullHouse
        [1,4]                                        -> FourOfAKind) (sort cs)
  where
    (x:xs) = (sort . map rank) cs
    (s:ss) = map suit cs

    isStraight | x == ace && xs == [ 10..king ] = True
               | otherwise                      = xs == [ x+1..x+4 ]

    isFlush = all (== s) ss

    matches = (sort . map length . group) (x:xs)


