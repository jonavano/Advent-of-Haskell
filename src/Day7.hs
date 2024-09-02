module Day7 (part1, part2) where

import Data.List.Split (splitOn)
import Data.List (sort, sortBy, group)
-- import Data.Ord (comparing)
-- import qualified Data.Map as Map

data HandType = FiveOfAKind | FourOfAKind | FullHouse | ThreeOfAKind | TwoPair | OnePair | HighCard
    deriving (Eq, Ord, Show)


part1 :: [String] -> Int
part1 xs = sum $ zipWith (curry (\((_,bid),ranking) -> bid * ranking)) (sortHands $ map rowToTuple xs) [1..]

rowToTuple :: String -> (String, Int)
rowToTuple xs = (hand, bid)
    where
        hand = head $ splitOn " " xs
        bid = read $ head $ tail $ splitOn " " xs

rank :: Char -> Int
rank c = case c of
    'A' -> 14
    'K' -> 13
    'Q' -> 12
    'J' -> 11
    'T' -> 10
    '9' -> 9
    '8' -> 8
    '7' -> 7
    '6' -> 6
    '5' -> 5
    '4' -> 4
    '3' -> 3
    '2' -> 2
    _   -> error "Invalid card rank"

-- compareByRank :: Char -> Char -> Ordering
-- compareByRank a b = comparing rank b a

-- sortHand :: [Char] -> [Char]
-- sortHand = sortBy compareByRank

classifyHand :: [Char] -> (HandType, [Int])
classifyHand hand = case reverse . sort . map length . group . sort $ hand of
    [1, 1, 1, 1, 1] -> (HighCard, ranks)
    [2, 1, 1, 1]    -> (OnePair, ranks)
    [2, 2, 1]       -> (TwoPair, ranks)
    [3, 1, 1]       -> (ThreeOfAKind, ranks)
    [3, 2]          -> (FullHouse, ranks)
    [4, 1]          -> (FourOfAKind, ranks)
    [5]             -> (FiveOfAKind, ranks)
    _               -> error "Invalid hand"
  where
    ranks = map rank hand--reverse $ sort $ map rank hand


sortHands :: [(String, Int)] -> [(String, Int)]
sortHands = sortBy compareHands
  where
    compareHands (hand1,_) (hand2,_) = case compare (fst h2) (fst h1) of
        EQ -> compare (snd h1) (snd h2)
        other -> other
      where
        h1 = classifyHand hand1
        h2 = classifyHand hand2

----------------



part2 :: [String] -> Int
part2 xs = sum $ zipWith (curry (\((_,bid),ranking) -> bid * ranking)) (sortHands2 $ map rowToTuple xs) [1..]

rank2 :: Char -> Int
rank2 c = case c of
    'A' -> 14
    'K' -> 13
    'Q' -> 12
    'J' -> 1
    'T' -> 10
    '9' -> 9
    '8' -> 8
    '7' -> 7
    '6' -> 6
    '5' -> 5
    '4' -> 4
    '3' -> 3
    '2' -> 2
    _   -> error "Invalid card rank"



classifyHand2 :: [Char] -> (HandType, [Int])
classifyHand2 hand = case groupJoker hand of
    [1, 1, 1, 1, 1] -> (HighCard, ranks)
    [2, 1, 1, 1]    -> (OnePair, ranks)
    [2, 2, 1]       -> (TwoPair, ranks)
    [3, 1, 1]       -> (ThreeOfAKind, ranks)
    [3, 2]          -> (FullHouse, ranks)
    [4, 1]          -> (FourOfAKind, ranks)
    [5]             -> (FiveOfAKind, ranks)
    _               -> error "Invalid hand"
  where
    ranks = map rank2 hand--reverse $ sort $ map rank hand


groupJoker :: String -> [Int]
groupJoker xs = withJoker : tailNoJokerCheck
    where
        noJoker = filter  (/='J') xs
        countOfJoker = length $ filter (=='J') xs
        noJokerCheck = reverse . sort . map length . group . sort $ noJoker
        withJoker = countOfJoker + (if null noJokerCheck then 0 else head noJokerCheck)
        tailNoJokerCheck = if null noJokerCheck then [] else tail noJokerCheck


sortHands2 :: [(String, Int)] -> [(String, Int)]
sortHands2 = sortBy compareHands
  where
    compareHands (hand1,_) (hand2,_) = case compare (fst h2) (fst h1) of
        EQ -> compare (snd h1) (snd h2)
        other -> other
      where
        h1 = classifyHand2 hand1
        h2 = classifyHand2 hand2