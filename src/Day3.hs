module Day3 (part1, part2) where


import Data.Char (isAlphaNum, isDigit)
import Data.List (nub)
import Data.List (sortBy)
import Data.Ord (comparing)





-- test :: [String] -> Int
part1 :: [String] -> Int
part1 xs = sum allDigitsCombined
  where
    xLength = length $ head xs
    yLength = length xs
    coord = addCoordinates xs
    symbols = filterSymbols coord
    allSpacesNextSymbol = concatMap (getNeighbors (xLength, yLength)) symbols
    allDigitsNextSymbol = nub $ checkForDigit coord allSpacesNextSymbol
    allDigitsCombined = map (\(string, _, _) -> read string :: Int ) $ combineDigits $ sortBy compareTupleInts allDigitsNextSymbol


combineDigits :: [(String, Int, Int)] -> [(String, Int, Int)]
combineDigits ((charA, xA,yA):(charB, xB, yB):xs)
  | xA == (xB -1) && (yA == yB) = combineDigits ((charA ++ charB, xB, yB)  : xs)
  | otherwise = (charA, xA,yA) : combineDigits ((charB, xB,yB):xs)
combineDigits [x] = [x]
combineDigits _ = []

compareTupleInts :: (a, Int, Int) -> (b, Int, Int) -> Ordering
compareTupleInts (_, x1, y1) (_, x2, y2) = compare (y1, x1) (y2, x2)



checkForDigit :: [[(Char, Int, Int)]] -> [(Int, Int)] -> [(String, Int, Int)]
checkForDigit inputWithCoordinates = go []
  where
    go _ [] = []
    go visited ((x, y):xs)
      | (x, y) `elem` visited = go visited xs
      | isDigit char =
          ([char], x, y) : go ((x, y) : visited) (neighbours ++ xs)
      | otherwise = go ((x, y) : visited) xs
      where
        (char, _, _) = inputWithCoordinates !! y !! x
        maxX = length (head inputWithCoordinates) - 1
        maxY = length inputWithCoordinates - 1
        neighbours = filter isValidCoord [(x - 1, y), (x + 1, y), (x, y - 1), (x, y + 1)]
        isValidCoord (a, b) = a >= 0 && a <= maxX && b >= 0 && b <= maxY

-- | Get all valid neighboring coordinates around (x, y).
-- | The grid has dimensions (maxX, maxY).
getNeighbors :: (Int, Int) -> (a, Int, Int) -> [(Int, Int)]
getNeighbors (maxX, maxY) (_, x, y) =
    filter withinBounds neighbors
  where
    directions = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
    neighbors = [(x + dx, y + dy) | (dx, dy) <- directions]
    withinBounds (nx, ny) = nx >= 0 && ny >= 0 && nx < maxX && ny < maxY


filterSymbols :: [[(Char, Int, Int)]] -> [(Char, Int, Int)]
filterSymbols = concatMap ( filter (\(a, x, y) -> not (isAlphaNum a) && a /= '.'))


addCoordinates :: [[Char]] -> [[(Char, Int, Int)]]
addCoordinates xs = zipWith (curry addRowCoordinates) xs [0..]
  where
    addRowCoordinates (row, rowIndex) = zipWith (\ char colIndex -> (char, colIndex, rowIndex)) row [0..]

----

part2 :: [String] -> Int
part2 xs = sum $ map product $ filter (\n -> length n == 2 ) allDigitsCombined-- sum allDigitsCombined
  where
    xLength = length $ head xs
    yLength = length xs
    coord = addCoordinates xs
    symbols = filterGear coord
    allSpacesNextSymbol = map (getNeighbors (xLength, yLength)) symbols
    allDigitsNextSymbol = nub $ map (checkForDigit coord) allSpacesNextSymbol
    allDigitsCombined = map (map (\(string, _, _) -> read string :: Int ) . combineDigits . sortBy compareTupleInts) allDigitsNextSymbol
      --  map (\(string, _, _) -> read string :: Int ) $ combineDigits $ sortBy compareTupleInts allDigitsNextSymbol

filterGear :: [[(Char, Int, Int)]] -> [(Char, Int, Int)]
filterGear = concatMap ( filter (\(a, _, _) -> a == '*'))
