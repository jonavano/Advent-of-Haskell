module Day1 (part1, part2) where

import Data.Char (digitToInt, isDigit)


part1 :: [String] -> Int
part1 xs = sum $ map (combineDigits findAllDigits) xs

part2 :: [String] -> Int
part2 xs = sum $ map (combineDigits updatedFirstInt) xs
    

combineDigits :: ([Char] -> [Char]) -> String -> Int
combineDigits f xs = digitToInt (head updatedInt) * 10 + digitToInt (last updatedInt)
  where
    updatedInt = f xs


findAllDigits :: String -> [Char]
findAllDigits (x:xs) 
    | isDigit x = x : findAllDigits xs
    | otherwise = findAllDigits xs
findAllDigits [] = []



updatedFirstInt :: String -> [Char]
updatedFirstInt [] = []
updatedFirstInt ('o':'n':'e':xs) = '1' : updatedFirstInt ('n':'e':xs)
updatedFirstInt ('t':'w':'o':xs) = '2' : updatedFirstInt ('w':'o':xs)
updatedFirstInt ('t':'h':'r':'e':'e':xs) = '3' : updatedFirstInt ('h':'r':'e':'e':xs)
updatedFirstInt ('f':'o':'u':'r':xs) = '4' : updatedFirstInt ('o':'u':'r':xs)
updatedFirstInt ('f':'i':'v':'e':xs) = '5' : updatedFirstInt ('i':'v':'e':xs)
updatedFirstInt ('s':'i':'x':xs) = '6' : updatedFirstInt ('i':'x':xs)
updatedFirstInt ('s':'e':'v':'e':'n':xs) = '7' : updatedFirstInt ('e':'v':'e':'n':xs)
updatedFirstInt ('e':'i':'g':'h':'t':xs) = '8' : updatedFirstInt ('i':'g':'h':'t':xs)
updatedFirstInt ('n':'i':'n':'e':xs) = '9' : updatedFirstInt ('i':'n':'e':xs)
updatedFirstInt (x:xs)
    | isDigit x = x : updatedFirstInt xs
    | otherwise = updatedFirstInt xs