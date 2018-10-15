

module Ch3 where

rvrs :: String -> String
rvrs x = concat
      [ drop 9 x,
      drop 6 $ take 8 x,
      take 5 x]
   
main :: IO()
main = do
    print ("nihao")
