module Day2 (part1, part2) where

import Data.List.Split (splitOn)
import qualified Data.Text as T
import Data.Char (isDigit)



part1 :: [String] -> Int
part1 xs = sum $ map checkGame xs


checkGame :: String -> Int
checkGame ('G':'a':'m':'e':' ': xs) =
    let parts = splitOn ":" xs
    in if length parts > 1 && gamePossible (head (tail parts))
        then read (head parts)
        else 0
checkGame _ = -1


gamePossible :: String -> Bool
gamePossible [] = True
gamePossible (nn : n : ' ':'b':'l':'u':'e':xs)
    | (read [nn, n] :: Int ) > 14 = False
gamePossible (nn : n : ' ':'r':'e':'d':xs)
    | (read [nn, n] :: Int) > 12 = False
gamePossible (nn : n : ' ':'g':'r':'e':'e':'n':xs)
    | (read [nn, n] :: Int) > 13 = False
gamePossible (x:xs) = gamePossible xs

------


part2 :: [String] -> Int
part2 xs = sum $ map powerOfCubes xs

powerOfCubes :: String -> Int
powerOfCubes xs = 
    let cubes = minCubes $ head $ tail $ splitOn ":" xs
        maxBlue = maxOfColor cubes "blue"
        maxGreen = maxOfColor cubes "green"
        maxRed  = maxOfColor cubes "red"
    in maxBlue * maxGreen * maxRed

maxOfColor :: [(Int, String)] -> String -> Int
maxOfColor xs color = maximum $ map fst (filter (\(_, s) ->s == color) xs )


minCubes :: String -> [(Int, String)]
minCubes xs = map splitColorAndAmount  $ splitStrings xs

splitStrings :: String -> [String]
splitStrings xs =  concatMap  (map (T.unpack . T.strip .  T.pack) . splitOn "," )  $ splitOn ";" xs
    -- let parts = splitOn ":" xs
    -- in if length parts > 1 && minCubes 

splitColorAndAmount :: String -> (Int, String)
splitColorAndAmount (x:y:' ':xs)
    | isDigit x && isDigit y = (read [x, y], xs)
splitColorAndAmount (x:' ':xs)
    | isDigit x = (read [x], xs)
splitColorAndAmount _ = (0, "")
