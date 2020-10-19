{-# LANGUAGE DuplicateRecordFields,BlockArguments #-}
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


-- haskell-mode-hook --> (lsp turn-on-haskell-indentation)
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

data Ttv = Ttv { v_title :: String
               , values :: [Quantum]
               } deriving (Eq,Show,Read)

data Tta = Tta { a_title :: String
               , function :: [Quantum] -> Bool
               }

combine :: [[a]] -> [[a]]
combine x = undefined
-- (combine '((a b) (c d) (e f))) --> ((a c e) (a c f) (a d e) (a d f) (b c e) (b c f) (b d e) (b d f))
cons = (:)
append = (++)
apply = ($)

maxColumnWidth :: [[a]] -> [Int]
maxColumnWidth x = undefined

-- actual code:
truthTable :: [Ttv] -> [Tta] -> [String]
truthTable vals actions =
  let v_titles = (map v_title  vals)
      v_values = (map values   vals)
      a_titles = (map a_title  actions)
      a_functions = (map function actions)
      rows = (apply combine v_values)
      table = (cons (append v_titles a_titles)
               (map (\row -> (append (map show row)
                               (map (\fun -> show (apply fun row)) a_functions)))
                 rows))
      width = (maxColumnWidth table)
      formatted = (map (\row -> row) table)
  in ["line1","line2"]

data TBool = TBool { name :: String , b_values :: [Bool] } --worse than Python!

first :: (Quantum -> Bool) -> [Quantum] -> Bool
first f = (\l -> f (head l))

main :: IO ()
main = do

    -- (mapc (function write-line)
    --     (truth-table '(("A" (t nil)) ("B" (t nil)))
    --                  (list (list "¬A"  (lambda (a b) (declare (ignore b)) (not a)))
    --                        (list "A∨B" (lambda (a b) (or a b)))
    --                        (list "A∧B" (lambda (a b) (and a b))))))

  -- mapM_ putStrLn (truthTable [ TBool "A" [True, False]
  --                            , TBool "B" [True, False]]
  --                 [Tta "¬A"  (\a b -> not a)
  --                            ,Tta "A∨B" or
  --                            ,Tta "A∧B" and])

  mapM_ putStrLn  (truthTable [Ttv "Quantum" [Yes,No,Both]]
                    [Tta "convert0" (first convert0)
                    ,Tta "convert1" (first convert1)
                    ,Tta "convert2" (first convert2)
                    ,Tta "convert3" (first convert3)
                    ,Tta "convert4" (first convert4)
                    ,Tta "convert5" (first convert5)
                    ,Tta "convert6" (first convert6)
                    ,Tta "convert7" (first convert7)])
  return ()
