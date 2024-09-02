module Main (main) where


import qualified Day1
import qualified Day2
import qualified Day3
import qualified Day4
import qualified Day5
import qualified Day6
import qualified Day7

main :: IO ()
main = do 
    day7


day7 = do 
    contents <- readFile "/workspaces/Advent-of-Haskell/Puzzles/Day7.txt"
    let splitIntoLines = lines contents
    let result = Day7.part1 splitIntoLines 
    let result2 = Day7.part2 splitIntoLines
    print "part 1"
    print result
    print "part 2"
    print result2

day6 = do 
    contents <- readFile "/workspaces/Advent-of-Haskell/Puzzles/Day6.txt"
    let splitIntoLines = lines contents
    let result = Day6.part1 splitIntoLines 
    let result2 = Day6.part2 splitIntoLines
    print "part 1"
    print result
    print "part 2"
    print result2

day5 = do 
    contents <- readFile "/workspaces/Advent-of-Haskell/Puzzles/Day5.txt"
    let splitIntoLines = lines contents
    let result = Day5.part1 splitIntoLines 
    let result2 = Day5.part2 splitIntoLines
    print "part 1"
    print result
    print "part 2"
    print result2

day4 = do 
    contents <- readFile "/workspaces/Advent-of-Haskell/Puzzles/Day4.txt"
    let splitIntoLines = lines contents
    let result = Day4.part1 splitIntoLines 
    let result2 = Day4.part2 splitIntoLines
    print "part 1"
    print result
    print "part 2"
    print result2

day3 = do 
    contents <- readFile "/workspaces/Advent-of-Haskell/Puzzles/Day3.txt"
    let splitIntoLines = lines contents
    let result = Day3.part1 splitIntoLines 
    let result2 = Day3.part2 splitIntoLines
    print "part 1"
    print result
    print "part 2"
    print result2

day2 = do 
    contents <- readFile "/workspaces/Advent-of-Haskell/Puzzles/Day2.txt"
    let splitIntoLines = lines contents
    let result = Day2.part1 splitIntoLines 
    let result2 = Day2.part2 splitIntoLines
    print "part 1"
    print result
    print "part 2"
    print result2

day1 = do 
    contents <- readFile "/workspaces/Advent-of-Haskell/Puzzles/Day1Part1.txt"
    let splitIntoLines = lines contents
    let result = Day1.part1 splitIntoLines 
    let result2 = Day1.part2 splitIntoLines
    print "part 1"
    print result
    print "part 2"
    print result2