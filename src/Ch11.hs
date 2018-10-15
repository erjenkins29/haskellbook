import Data.Char
-- types

-- type constructors -- compile-time
--------------------------------
-- data constructors -- run-time

-- type constructor + argument = data constructor + argument
data Price = Price Integer deriving (Eq, Show)

-- sumtype constructor example
data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)
data Airline = AsiaAir | Southwest | BoxyAir deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Airplane Airline deriving (Eq, Show)

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar otherwise = False

getManu :: Vehicle -> Maybe Manufacturer
getManu (Car x _) = Just x
getManu otherwise = Nothing

-- arity : number of arguments a function or constructor takes
-- nullary : function that doesnt take arguments
data Example0 = Example0
-- unary : constructor with one argument
data Example1 = Example1 Integer
-- products: constructors with >1 arguments
data Example2 = Example2 Integer String

-- algebraic datatypes : describes arguments in terms of products/sums

-- newtype : cannot be product type or sum type, or contain nullary constructors
--         : meant for types with a single unary data constructor
class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 40

--data Goats = Goats Int deriving (Eq, Show)
newtype Goats = Goats Int deriving (Eq, Show)
newtype Cows = Cows Int deriving (Eq, Show)

-- Below shows us that newtupes are NOT JUST type aliases, we can assign diff behavior
instance TooMany Goats where
  tooMany (Goats n) = n > 43
--tooManyGoats :: Goats -> Bool
--tooManyGoats (Goats n) = n > 40

-- cardinality

-- Binary trees
data BinaryTree a =
     Leaf
   | Node (BinaryTree a) a (BinaryTree a)
   deriving (Eq, Ord, Show)

insert' :: (Ord a) => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Node left a right
  | b < a  = Node (insert' b left) a right
  | b > a  = Node left a (insert' b right)


-- build a map function for trees
mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree f Leaf = Leaf
mapTree f (Node left a right) = Node (mapTree f left) (f a) (mapTree f right)

sampleTree :: BinaryTree Int
sampleTree = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected :: BinaryTree Int
mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

-- unit test {mapTree (+1) sampleTree == mapExpected} returns True

-- create a foldr function for binary trees:
--foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
--foldTree f a Leaf = f a a
--foldTree f a (Node left x right) = f a ((foldTree f x left) (foldTree f x right))

-- Vigenere cipher : given a keyword, encode a message with a salt
-- ex: Salt is "ALLY", the "A" moves the word up 0, "L" moves it 11, etc.
--data Salt = String
--data Message = String

charToInt :: Char -> Int
charToInt c = (ord c) - 97
intToChar :: Int -> Char
intToChar i = chr (i + 97)

moveChar :: Char -> Char -> Char
moveChar s m = intToChar $ mod ((charToInt s) + (charToInt m)) 26

encodeVigenere :: String -> String -> String
encodeVigenere salt msg = encodeFunc (cycle salt) msg where
    encodeFunc _ "" = ""
    encodeFunc slt (' ':ms) = ' ' : encodeFunc slt ms -- skip spaces
    encodeFunc (s:ss) (m:ms) = moveChar s m : encodeFunc ss ms
