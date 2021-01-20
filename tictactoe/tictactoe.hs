cons = (:)
append = (++)
apply = ($)
maparray = mapM_

makeList :: Int -> a -> [a]
makeList n e 
  | n == 0    = []
  | otherwise = e : makeList (n-1) e


map4 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
map4 f [] _ _ = []
map4 f _ [] _ = []
map4 f _ _ [] = []
map4 f (a:as) (b:bs) (c:cs) = cons (f a b c) (map4 f as bs cs)


data Cell = Empty | Cross | Circle deriving (Eq,Show,Read)
data Board = Board { width :: Integer
                   , height :: Integer
                   , cells :: [[Cell]]
                   } deriving (Eq,Show,Read)

cellRep :: Cell -> String
cellRep cell 
  | cell == Empty  = " "
  | cell == Cross  = "x"
  | cell == Circle = "o"

lineRep :: [Cell] -> String
lineRep line = "(" ++ (concat (map cellRep line)) ++ ")"


boardRep :: Board -> [String]
boardRep board =
  (map4 (\ prefix line suffix -> prefix ++ line ++ suffix)
   ("(" : (makeList (length (cells board)) " "))
   (map lineRep (cells board))
   ((makeList (length (cells board)) " ") ++ [")"]))


-- I want to print something like:
  
-- ((xoxoxoxo)
--  (x      x)
--  (o      o)
--  ( x    x )
--  (  o  o  )
--  (   xx   )
--  (   o o  )
--  (xoxoxoxo))

main = maparray putStrLn (boardRep (Board 3 3 [[Empty,Empty,Empty],[Cross,Empty,Cross],[Empty,Circle,Empty]]))
