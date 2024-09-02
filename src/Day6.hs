module Day6 (part1, part2) where

import Data.List.Split (splitOn)


part1 :: [String] -> Int
part1 [x, xs] = product $ map firstWin races
    where
        time = stringOfDigitToIntList $ head $ tail $ splitOn ":" x
        distance = stringOfDigitToIntList $ head $ tail $ splitOn ":" xs
        races = zip time distance
part1 _ = 0

firstWin :: (Int, Int) -> Int
firstWin (time, distance) = length $ [x | x <- [0..time], canWin (time, distance) x]

canWin :: (Int, Int) -> Int -> Bool
canWin (time, distance) buttonPresTime =  0 < ( buttonPresTime * time - (buttonPresTime ^ 2) - distance)

stringOfDigitToIntList :: String -> [Int]
stringOfDigitToIntList xs = map read $ filter (not.null) $ splitOn " " xs

stringRemoveSpaceToInt :: String -> Int
stringRemoveSpaceToInt xs = read $ filter (/= ' ') xs



part2 :: [String] -> Int
part2 [x, xs] =  firstWin (time, distance)
    where
        time = stringRemoveSpaceToInt $ head $ tail $ splitOn ":" x
        distance = stringRemoveSpaceToInt $ head $ tail $ splitOn ":" xs
part2 _ = 0