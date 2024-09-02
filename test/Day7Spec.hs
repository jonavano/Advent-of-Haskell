module Day7Spec (spec) where


import           Day7 (part1, part2)
import Test.Hspec (Spec, describe, it, shouldBe)


example1 :: [String]
example1 = [ 
    "32T3K 765",
    "T55J5 684",
    "KK677 28",
    "KTJJT 220",
    "QQQJA 483"
    ]
  

spec :: Spec
spec = do
    describe "part 1" $ do
        it "examples" $ do
            part1 example1 `shouldBe` 6440
    describe "part 2" $ do
        it "examples" $ do
            part2 example1 `shouldBe` 5905