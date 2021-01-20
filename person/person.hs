
data Person = Person { firstName :: String,
                       lastName :: String,
                       email :: String,
                       age :: Int,
                       occupation :: String
                     } -- deriving (Show)

instance Show Person where
  show p = ((firstName p)
             ++ " " ++ (lastName p)
             ++ " <" ++ (email p) ++ ">"
             ++ " " ++ (show (age p)) ++ " yo"
             ++ " " ++ (occupation p))

main :: IO ()
main = do
  putStrLn (show (Person
                   "Pascal"
                   "Bourguignon"
                   "pjb+test@informatimago.com"
                   62
                   "Informaticien"))
