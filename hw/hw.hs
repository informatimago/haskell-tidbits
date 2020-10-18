hw x = "Hello world, " ++ x ++ "!"

data Object = S String | D Double | I Int | Obj [Object] deriving (Eq, Show)

data Object = String String | Float Float | Integer Integer deriving (Show)

value (String  value) = value
value (Float   value) = value
value (Integer value) = value
value (head [ Integer 42, String "foo", Float 3.14 ]) + 10


data Person = Person String String Int Float String String deriving (Show)

firstName :: Person -> String  
firstName (Person firstname _ _ _ _ _) = firstname  

lastName :: Person -> String  
lastName (Person _ lastname _ _ _ _) = lastname  

age :: Person -> Int  
age (Person _ _ age _ _ _) = age  

height :: Person -> Float  
height (Person _ _ _ height _ _) = height  

phoneNumber :: Person -> String  
phoneNumber (Person _ _ _ _ number _) = number  

flavor :: Person -> String  
flavor (Person _ _ _ _ _ flavor) = flavor

-- (defstruct person firstname lastname age height number flavor)

data Person = Person {
firstName :: String,
lastName :: String,  
age :: Int,  
height :: Float,  
phoneNumber :: String,  
flavor :: String  
} deriving (Show)   
