module Day1 (part1) where
    
import Data.Char (isHexDigit, digitToInt)


part1 :: [String] -> Int
part1 xs = sum $ map combineFirstInts xs
    

combineFirstInts :: String -> Int
combineFirstInts xs = (digitToInt ( firstInt xs) * 10 ) + digitToInt (firstInt (reverse xs))

firstInt :: [Char] -> Char
firstInt xs = head $ dropWhile isHexDigit xs
