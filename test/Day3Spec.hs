module Day3Spec (spec) where

import           Day3 (part1, part2)
import Test.Hspec (Spec, describe, it, shouldBe)


example1 :: [String]
example1 = [ 
    "467..114..",
    "...*......",
    "..35..633.",
    "......#...",
    "617*......",
    ".....+.58.",
    "..592.....",
    "......755.",
    "...$.*....",
    ".664.598.."
  ]
  
-- example2 :: [String]
-- example2 = [ "two1nine"
--   , "eightwothree"
--   , "abcone2threexyz"
--   , "xtwone3four"
--   , "4nineeightseven2"
--   , "zoneight234"
--   , "7pqrstsixteen"
--   ]

spec :: Spec
spec = do
    describe "part 1" $ do
        it "examples" $ do
            part1 example1 `shouldBe` 4361
    describe "part 2" $ do
        it "examples" $ do
            part2 example1 `shouldBe` 467835