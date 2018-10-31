import Control.Monad
import Control.Applicative

--- the same thing
--putStrLn "nihao " >> putStrLn "Evan"  -- from Monad
--putStrLn "nihao " *> putStrLn "Evan"  -- from Applicative

-- desugaring do syntax
sequencing :: IO()
sequencing = do
  putStrLn "first thing"
  putStrLn "second thing"

sequencing' :: IO()
sequencing' =
  putStrLn "first thing" >>
  putStrLn "second thing"

binding :: IO()
binding = do
  name <- getLine
  putStrLn name

binding' :: IO()
binding' = getLine >>= putStrLn

bindingAndSequencing :: IO()
bindingAndSequencing = do
  putStrLn "Name please:"
  name <- getLine
  putStrLn ("Hello, " ++ name)

bindingAndSequencing' :: IO()  -- desugared version
bindingAndSequencing' =
  putStrLn "Name please:" >>
  getLine >>=
  \name ->
    putStrLn ("Hello, " ++ name)

-- this will fail...
--    putStrLn <$> getLine -- where <$> is fmap
-- if we want it to work....
--    join $ putStrLn <$> getLine
printOne = putStrLn "1"
printTwo = putStrLn "2"
twoActions :: ( IO(), IO() )
twoActions = (printOne, printTwo)  --to evaluate, use fst or snd

-- using Monad property for ....
-- Lists
twiceWhenEven :: [Integer] -> [Integer]
twiceWhenEven xs = do
  x <- xs
  if even x
    then [x*x, x*x]
    else []

-- implementing Either Monad
data Sum a b =
    First a
  | Second b
  deriving (Eq, Show)

instance Functor (Sum a) where
  fmap f (Second b) = Second (f b)

instance Applicative (Sum a) where
  pure b = Second b
  (<*>) (Second f) (Second b) = Second (f b)

instance Monad (Sum a) where
  return = pure
  Second b >>= k  = k b

makeASecond' :: Integer -> Sum a Integer
makeASecond' n = Second (n-1)
-- testing : Second 5 >>= makeASecond'

-- Monad laws
--  1. identity laws
--m >>= return   = m
--return x >>= f = f x

--  2. associativity
--(m >>= f) >>= g   =  m >>= (\x -> f x >>= g)

-- 3. composition
-- (>=>) :: (Monad m) => (a -> m b) -> (b -> m c) -> a -> m c
-- flip (.) ::           (a -> b)   -> (b -> c)   -> a -> c

sayHi :: String -> IO String
sayHi greeting = do
  putStrLn greeting
  getLine

readM :: Read a => String -> IO a
readM = return . read

getAge :: String -> IO Int
getAge = sayHi >=> readM

askForAge :: IO Int
askForAge =
  getAge "How old are you?"
