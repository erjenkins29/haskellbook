data Mood = Meh | Woo deriving Show

changeMood :: Mood -> Mood
changeMood Woo = Meh
changeMood Meh = Woo



-- Integral numbers:  Int, Integer
-- Int is bounded (limited precision)
-- Integer is unbounded (arbitrary precision)

-- Fractional numbers: Double, Float, Rational, Scientific
-- Double, Float are limited in precision.
-- Scientific, Rational have arbitrary precision
-- (/) is a function of Fractional typeclass

-- Typeclasses:
-- Eq (equality) ==
-- Ord (ordered) <, >, >=, <=

-- type: Bool
-- &&, ||

--Data.Tuple
-- fst, snd, swap
-- NOTE: Most tuples will be size 5 or smaller

--Data.List
-- 1. all elements are same type
-- 2. number of values in the type not specified (unlike with tuples)
