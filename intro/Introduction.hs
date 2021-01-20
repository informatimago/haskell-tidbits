
main :: IO ()
main = do
 let a=[2,4..100]
     b=drop 5 a
   in
   do
   putStr "a = {"
   mapM_ (\x -> do
             putStr (show x)
             putStr ", ") a
   putStrLn "};"

   putStr "b = {"
   mapM_ (\x -> do
             putStr (show x)
             putStr ", ") b
   putStrLn "};"
    
   return ()

