import Data.List
import Data.Time

-- folding
foldingSum :: [Integer] -> Integer
foldingSum = foldr (+) 0

get9001 = foldr (\_ _ -> 9001) 0
thisFolds1 = get9001 [1, undefined]
thisDoesntFold1 = get9001 undefined

-- folding left
thisStartsWith1 = foldl (+) 0 [1,2,3]

-- show the folding structure
showFoldL = foldl f "0" (map show [1..5]) where
  f x y = concat ["(",x,"+",y,")"]
showFoldR = foldr f "0" (map show [1..5]) where
  f x y = concat ["(",x,"+",y,")"]

-- can also see how folds are working with scan

-- catamorphism;

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [DbDate (UTCTime
          (fromGregorian 1921 5 1) (secondsToDiffTime 34123)
          )
  , DbNumber 9001
  , DbString "Hello World"
  , DbDate (UTCTime
          (fromGregorian 1921 5 2) (secondsToDiffTime 34123)
          )
  ]

--easy implementation
--filterDbDate :: [DatabaseItem] -> [UTCTime]
--filterDbDate [] = []
--filterDbDate ((DbDate x):xs) = x : filterDbDate xs
--filterDbDate (x:xs) = filterDbDate xs

-- implementing with fold
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate xs = foldr f [] xs where
  f (DbDate x) y = x : y
  f _ y = y
