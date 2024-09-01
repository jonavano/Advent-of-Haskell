{-# LANGUAGE TupleSections #-}
module Day4 (part1, part2) where

import Data.List.Split (splitOn)


part1 :: [String] -> Int
part1 xs =  sum $ map calcCardScore xs


calcCardScore :: String -> Int
calcCardScore xs = calc
    where
        splitString = map (map (read :: String -> Int) . filter (not . null). splitOn " ") (splitOn "|" $ head $ tail $ splitOn ":" xs)
        winNum =  head splitString
        myNum = head $ tail splitString
        count x
            | x > 1 = 2* count (x-1)
            | x == 1 = 1
            |otherwise = 0
        calc = count $ length [x | x <- myNum, x `elem` winNum]

part2 :: [String] -> Int
part2 xs = calculateAmountCards $ map ((, 1) . calcCardMatches) xs

calculateAmountCards :: [(Int, Int)] -> Int -- [(Int, Int)]
calculateAmountCards ((matches, amount):xs) = amount + calculateAmountCards (dubbleCards ++ restOfCards)
    where
        dubbleCards = map (\(a, b) -> (a, b+ amount)) $ take matches xs
        restOfCards = drop matches xs
calculateAmountCards _ = 0



calcCardMatches :: String -> Int
calcCardMatches xs = calc
    where
        splitString = map (map (read :: String -> Int) . filter (not . null). splitOn " ") (splitOn "|" $ head $ tail $ splitOn ":" xs)
        winNum =  head splitString
        myNum = head $ tail splitString
        count x
            | x > 1 = 2* count (x-1)
            | x == 1 = 1
            |otherwise = 0
        calc = length [x | x <- myNum, x `elem` winNum]