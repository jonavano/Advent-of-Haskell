module Day5 (part1, part2) where


import Data.List.Split (splitOn)
-- import Data.Maybe (fromMaybe)
-- import qualified Data.IntMap.Strict as IntMap


part1 :: [String] -> Int
part1 xs = minimum [findLocFromSeed x searchData | x <- seeds]
    where
        seeds = stringOfDigitToIntList $ head $ tail $ splitOn ":" (head xs)
        restOfData = drop 2 xs
        searchData = partConverter restOfData

stringOfDigitToIntList :: String -> [Int]
stringOfDigitToIntList xs = map read $ filter (not.null) $ splitOn " " xs

findLocFromSeed :: Int -> [[(Int, Int, Int)]]  -> Int
findLocFromSeed seed []  = seed
findLocFromSeed seed ([]:xs) = findLocFromSeed seed xs
findLocFromSeed seed (((dest, origin, range):ys):xs)
    | origin <= seed && seed < origin + range = findLocFromSeed (seed + (dest - origin)) xs
    | otherwise = findLocFromSeed seed (ys:xs)


partConverter :: [String] -> [[(Int, Int, Int)]]
partConverter []  = []
partConverter xs = currentDataList : partConverter nextSeedData
    where
        seedData = map stringOfDigitToIntList $ takeWhile (not.null) $ tail xs
        currentDataList = map destToOrigin  seedData
        nextSeedData = drop 1 $ dropWhile (not.null) xs

destToOrigin :: [Int] -> (Int,Int, Int)
destToOrigin [dest, origin, range]  = (dest, origin, range)
destToOrigin _ = (-1,-1,-1)


----

part2 :: [String] -> Int
part2 xs = minimum [findLocFromSeed x searchData | x <- createSeedList seeds]
    where
        seeds = stringOfDigitToIntList $ head $ tail $ splitOn ":" (head xs)
        restOfData = drop 2 xs
        searchData = partConverter restOfData

createSeedList :: [Int] -> [Int]
createSeedList (seed:range:xs) = [seed + x| x <- [0..range]] ++ createSeedList xs
createSeedList _ = []

