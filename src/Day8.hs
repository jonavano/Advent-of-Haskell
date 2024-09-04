module Day8 (part1, part2) where

import qualified Data.Map as Map
-- import Data.Foldable (fold1)




part1 :: [String] -> Int
part1 (instructions:_:xs) = 1 + length (takeWhile (/= "ZZZ") (nextMove infinityInstructions "AAA" directions)) --1 + length $ takeWhile (/= "ZZZ") $ nextMove infinityInstructions "AAA" directions
    where
        directions = Map.fromList (map stringToKeyPair xs)
        infinityInstructions = [x | _ <- [1..], x <- instructions]
part1 _ = 0


stringToKeyPair :: String -> (String, (String, String))
stringToKeyPair [k1, k2, k3, _, '=', ' ', '(', l1, l2, l3, ',', ' ', r1, r2, r3, ')'] =
    ([k1,k2,k3],([l1,l2,l3], [r1,r2,r3]))
stringToKeyPair _ = ("", ("",""))



nextMove :: [Char] -> String -> Map.Map String (String, String) -> [String]
nextMove ('R':xs) location dirMap =
    case Map.lookup location dirMap of
        Nothing -> [""]
        Just (_, nextLocation) -> nextLocation : nextMove xs nextLocation dirMap
nextMove ('L':xs) location dirMap =
    case Map.lookup location dirMap of
        Nothing -> [""]
        Just (nextLocation, _) -> nextLocation : nextMove xs nextLocation dirMap
nextMove _ _ _ = [""]

------

part2 :: [String] -> Int
part2 (instructions:_:xs) = foldl1 lcm $ map lengthOfEnd allMoves
    -- 1 + length (head $ takeWhile (all (\str ->  last (take 3 str)/= 'Z')) allMoves)
    where
        directions = map stringToKeyPair xs
        directionsMap = Map.fromList directions
        
        -- endingALocations = map (\(n,(_,_)) -> n) $ filter (\(n,(_,_)) -> last (take 3 n)/= 'A') directions
        endingALocations = map fst $ filter (\(n, _) -> last n == 'A') directions

        
        infinityInstructions = [x | _ <- [1..], x <- instructions]

        nextMovesList startPosition = nextMove infinityInstructions startPosition directionsMap
        allMoves = map nextMovesList endingALocations
        lengthOfEnd moves = 1 + length (takeWhile (\str -> last str /= 'Z') moves)
part2 _ = 0

example3 :: [String]
example3 = [
    "LR",
    "",
    "11A = (11B, XXX)",
    "11B = (XXX, 11Z)",
    "11Z = (11B, XXX)",
    "22A = (22B, XXX)",
    "22B = (22C, 22C)",
    "22C = (22Z, 22Z)",
    "22Z = (22B, 22B)",
    "XXX = (XXX, XXX)"
    ]

-- part2 :: [String] -> Int
-- part2 (instructions : _ : xs) = -- 1 + length (takeWhile allNotZ allMoves)
--   where
--     directions = map stringToKeyPair xs
--     directionsMap = Map.fromList directions

--     -- Generate an infinite list of repeated instructions
--     infinityInstructions = cycle instructions

--     -- Get the ending locations that don't end with 'A'
--     endingALocations = map fst $ filter (\(n, _) -> last (take 3 n) /= 'A') directions

--     -- Get the next moves for a given starting position
--     nextMovesList :: String -> [String]
--     nextMovesList startPosition = nextMove infinityInstructions startPosition directionsMap

--     -- Apply nextMovesList to each starting position and get the list of all moves
--     allMoves = map nextMovesList endingALocations

--     -- Check if all strings at the current index don't end with 'Z'
--     allNotZ :: [String] -> Bool
--     allNotZ = all (\str -> last (take 3 str) /= 'Z')

-- part2 _ = 0

