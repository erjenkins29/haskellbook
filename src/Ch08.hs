
-- recursion

--let's try factorial

fac :: (Integral a) => a -> a
fac 1 = 1
fac x = x * (fac (x - 1) )
--infix 9 !

-- bottoms
-- the below functions are examples of a bottom
b1 :: Bool -> Integer
b1 True = error "Evan's error"
b1 False = 0

-- partial function
b2 :: Bool -> Integer
b2 False = 0

-- How to get from a partial function --> total function?  One way: use Maybe
b2' :: Bool -> Maybe Integer
b2' False = Just 0
b2' _ = Nothing

-- type aliases
type Numerator = Integer

-- go function: Let's one build in other variables (like counters) into recursive
dividedBy :: Integral a => a -> a -> (a,a)
dividedBy num denom = go num denom 0
  where go n d count
         | n < d = (count, n)
         | otherwise =
            go (n - d) d (count + 1)
