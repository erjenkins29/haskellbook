module Exam where

import Data.Char

prswap :: [a] -> [a]
prswap [] = []
prswap (x:y:xs) = y:x:(prswap xs)

rotabc :: String -> String
rotabc []       = []
rotabc ('a':xs) = 'b':(rotabc xs)
rotabc ('b':xs) = 'c':(rotabc xs)
rotabc ('c':xs) = 'a':(rotabc xs)
rotabc (x:xs)   = x:(rotabc xs)

--Explicit recursion
--bt :: (Integral a) => a -> [(a,a)] -> [(a,a)]
--bt m [] = []
--bt m ((a,b):xs) = if m<(a+b) then (a,b):(bt m xs) else bt m xs

--Higher order functions
bt :: (Integral a) => a -> [(a,a)] -> [(a,a)]
bt m ls = foldr (\(a,b) y -> if (a+b)>m then (a,b):y else y) [] ls

fml :: [a] -> (a,a,a)
fml xs = let
          len         = div (length xs) 2
          go (y:ys) l
                 | l ==0 = y
                 | l > 0 = go ys (l-1)
         in (head xs, go xs len, last xs)

separate :: [Char] -> ([Char],[Char])
separate = foldr (\x (a,b) -> if isDigit x then (x:a, b) else (a, x:b)) ([],[])

--foldr (\x y -> if isDigit x then (x:y, y) else (y, x:y)) [] ls

mapr :: (a-> b) -> [a] -> [b]
mapr f list = foldr (\x y -> (f x):y) [] list
