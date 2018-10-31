-- Eq, Ord, Num, Enum, Show
-- typeclasses are like interfaces (work across multiple datatypes)

-- Eq : equality
-- tuple (,) function has an Eq instance, Eq a, Eq b => Eq (a,b)
data Trivial = Trivial'

instance Eq Trivial where
  Trivial' == Trivial' = True

-- partial functions (NOTE: not partially applied function)
f :: Integer -> Bool
f 1 = True
-- We don't give a fallback case.  Must add it below...
f _ = False
-- ...then it will compile.

data Identity a = Identity a

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'

  -- Exercises:
data StringOrInteger = TisAnInteger Integer | TisAString String --ex 3
instance Eq StringOrInteger where
    (==) (TisAnInteger x) (TisAnInteger y) = x == y
    (==) (TisAString x) (TisAString y) = x == y
    (==) _ _ = False

data Pair a = Pair a a  -- ex 4
instance (Eq a) => Eq (Pair a) where
  (==) (Pair v x) (Pair v' x') = (v,x)==(v',x')

-- Num : Some instances include Integer, Float, Double, etc.
-- important methods: (*), (+), negate, fromIntegral (which takes Integrals --> Nums)

-- Integral (Real, Enum), functions : quot, rem, div, mod, toInteger
-- Fractional (Num), functions : (/) (recip) (fromRational)

-- Ord
-- when using deriving Ord, the order in which the values are defined matters
data DayOfWeek = Mon | Tue | Wed | Thurs | Fri | Sat | Sun deriving (Ord, Show)

instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tue Tue = True
  (==) Wed Wed = True
  (==) Thurs Thurs = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==) _ _ = False

-- Ord ==> Eq

-- Enum :
-- important methods, succ, pred, enumFromThenTo x y z (like range(x,y,z))

-- Show
-- minimal implementations is that show is defined:
data Something = Something
instance Show Something where
  show Something = "Something being shown"

-- use "deriving Show" if it's desired to quickly return the Something 
