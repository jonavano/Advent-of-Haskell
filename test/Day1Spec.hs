module Day1Spec (spec) where


import           Day1 (part1, part2)
import Test.Hspec (Spec, describe, it, shouldBe)


example1 :: [String]
example1 = [ "1abc2"
  , "pqr3stu8vwx"
  , "a1b2c3d4e5f"
  , "treb7uchet"
  ]
  
example2 :: [String]
example2 = [ "two1nine"
  , "eightwothree"
  , "abcone2threexyz"
  , "xtwone3four"
  , "4nineeightseven2"
  , "zoneight234"
  , "7pqrstsixteen"
  ]

spec :: Spec
spec = do
    describe "part 1" $ do
        it "examples" $ do
            part1 example1 `shouldBe` 142
    describe "part 2" $ do
        it "examples" $ do
            part2 example2 `shouldBe` 281