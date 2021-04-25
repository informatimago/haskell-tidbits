findSubst :: Eq a => a->[(a,a)]->a  
findSubst s [] = s
findSubst s (kv:kvs) =
  (if s==key then val else findSubst s kvs)
  where { (key,val) = kv }

substs :: Eq a => [a]->[(a,a)]->[a] 
substs ss [] = ss
substs [] _ = []
substs (s:ss) kvs =
  (findSubst s kvs):(substs ss kvs)

main :: IO ()
main = do
    putStrLn "Input:"
    mapM_ putStrLn list
    putStrLn "Output:"
    mapM_ putStrLn (substs list subs)
 where list = ["one","two","three"]
       subs = [("one","un"),("two","deux"),("four","quatre")] 
