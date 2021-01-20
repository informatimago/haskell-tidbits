import Data.List

printCommaList :: Show a => [a] -> IO ()
printCommaList v = do
  putStr "{"
  (putStr . intercalate ", " . map show) v
  putStrLn "};"

main :: IO ()
main = do
  let a=[2,4..100]
      b=drop 5 a

  putStr "a = "
  printCommaList a

  putStr "b = "
  printCommaList b


