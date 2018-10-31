

module Ch2 where

triple x = 3*x
hello :: String
hello = "hello"
world :: String
world = "world"

main = do
   putStrLn "Intro"
   putStrLn appOutput
   where appOutput = 
          concat [hello, " ", world]


