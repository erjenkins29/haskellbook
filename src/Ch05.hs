-- curry fst 1 2
-- (Returns: 1)

-- uncurry replicate (2,2)
-- (Returns: [2,2])

-- polymorphism: constrained (ad-hoc) and parametric
-- parametric is when we leave the variable unconstrained (a)
--   _parametricity_ requires that functions like const :: a -> b -> a MUST
--   return the first value.  If something more specific desired, must constrain
--   a with a typeclass
-- constrained is when we apply a typeclass (Eq a => a)
--   This allows for less types to abide by the function, but increases the
--   amount of functions that can be used with it (e.g. Eq has (==) function)

-- NOTE:
-- given a function s :: a -> a , one cannot create any other function than id

-- working around constraints...
-- the length function is defined as length :: [a] -> Int
-- That definition restricts us... for example, we can't do 3 / length [1,2]
--   Thus, must use a workaround fromIntegral :: (Num b, Integral a) => a -> b
--   to make... 3 / fromIntegral ( length [1,2])

-- modules.  Any time you import, you're importing functions, values, data types,
--  etc. from a module.  Declared as...
--  module Nihao where...
