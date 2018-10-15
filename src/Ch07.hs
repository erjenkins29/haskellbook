-- functional
-- binding (taking a argument and attaching it to a parameter)
-- anonymous function (\x -> x)

-- higher order functions (functions that take other functions as input)
-- case

-- guards (usually wise to use "otherwise")
myAbs :: Integer -> Integer
myAbs x
 | x < 0 = negate x
 | otherwise = x

-- (.) : (f . g) x = f (g x)
f :: Integer -> Integer
f = sum . take 5 . filter odd . enumFrom
