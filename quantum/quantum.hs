
data Quantum = Yes | No | Both deriving (Eq,Show,Read)


-- (loop for i below 8
--       for name = (format "convert%d" i)
--       do (insert (format "%s q = case q of {" name))
--       do (loop for bit from 0
--                for arg in '(Yes No Both)
--                do (insert (format " %-4s -> %5s;" arg (if (zerop (logand i (ash 1 bit))) 'False 'True))))
--       do (insert (format "}\n")))

convert0 q = case q of { Yes  -> False; No   -> False; Both -> False;}
convert1 q = case q of { Yes  ->  True; No   -> False; Both -> False;}
convert2 q = case q of { Yes  -> False; No   ->  True; Both -> False;}
convert3 q = case q of { Yes  ->  True; No   ->  True; Both -> False;}
convert4 q = case q of { Yes  -> False; No   -> False; Both ->  True;}
convert5 q = case q of { Yes  ->  True; No   -> False; Both ->  True;}
convert6 q = case q of { Yes  -> False; No   ->  True; Both ->  True;}
convert7 q = case q of { Yes  ->  True; No   ->  True; Both ->  True;}



-- import Data.List
-- import Data.Maybe
--
-- data Quantum = Yes | No | Both deriving (Eq,Show,Read)
--
-- -- (loop for i below 8
-- --       for name = (format "convert%d" i)
-- --       do  (insert (format "%s q = [%s] !! quantumIndex q\n" name
-- --                           (mapconcat 'symbol-name (loop for bit from 0 to 2
-- --                                      collect (if (zerop (logand i (ash 1 bit))) 'False 'True)) ","))))
--
-- quantumIndex q = fromJust (elemIndex q [Yes,No,Both])
-- convert0 q = [False,False,False] !! quantumIndex q
-- convert1 q = [True,False,False]  !! quantumIndex q
-- convert2 q = [False,True,False]  !! quantumIndex q
-- convert3 q = [True,True,False]   !! quantumIndex q
-- convert4 q = [False,False,True]  !! quantumIndex q
-- convert5 q = [True,False,True]   !! quantumIndex q
-- convert6 q = [False,True,True]   !! quantumIndex q
-- convert7 q = [True,True,True]    !! quantumIndex q


-- useless definitions:

data ttv = ttv {
   title :: String,
   values :: [Quantum]
} deriving (Eq,Show,Read)

data tta = tta {
title :: String,
function :: [Quantum -> Bool]
} deriving (Eq,Show,Read)

-- actual code:
truth_table values actions =
let v_title = (map title values) in
let v_values = (map values values) in
let a_titles = (map title actions) in
let a_functions = (map function actions) in
let rows = (map combine v_values) in
let table = (cons (append v_titles a_titles)
                  (map (\row -> (append (map show row) (map \fun -> show (apply fun row)))) rows)) in
let width = (max_column_width table) in
let formatted = (map (\row -> ) table) in





main :: IO ()
main = do
  map (\r -> putStrLn r) (truthTable [ttv "Quantum" [Yes,No,Both]] [tta "convert0" convert0,
                                                                        tta "convert1" convert1,
                                                                            tta "convert2" convert2,
                                                                                tta "convert3" convert3,
                                                                                    tta "convert4" convert4,
                                                                                        tta "convert5" convert5,
                                                                                            tta "convert6" convert6,
                                                                                                tta "convert7" convert7,
                                                                                                    tta "convert8" convert8])
  return ()
