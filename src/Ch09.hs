-- Data.Char
import Data.Char
-- ord, chr,

--Lists

myTail :: [a] -> Maybe [a]
myTail [] = Nothing
myTail (x:[]) = Nothing
myTail (_:xs) = Just xs

-- Syntactic sugar for lists: [1,3..10] == [1,3,5,7,9] == enumFromThenTo 1 3 10

-- some list-friendly functions∷
-- drop
x1 = drop 3 [1..10]
-- splitAt
x2 = splitAt 5 [1..10]

x3 = takeWhile (<3) [1..10]

x4 = dropWhile (<3) [1..10]

-- list comprehensions

x5 = [x*22 | x<- [1..10]]
x6 = [x*22 | x<- [1..10], x/=7 ]

acro :: String -> String
acro xs = [x | x <- xs, x `elem` ['A'..'Z']]
--acro = filter (\x -> x `elem` ['A'..'Z'])

-- map: map is defined recursively... demonstrated below.
thisworks = take 2 . map (+1) $ [1, 2, undefined]

-- filter
-- zip
-- zipWith
thisReturnsSixTrues = zipWith (==) ['a'..'f'] ['a'..'z']


--Ex 3: function that capitalizes the first letter
capFirst :: String -> String
capFirst (x:xs) = toUpper x : xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse x = last x : (myReverse . init $ x)
--myReverse (x:[]) = [x]
--myReverse (x:xs) = myReverse xs ++ [x]
