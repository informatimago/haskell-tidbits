{-# LANGUAGE UnicodeSyntax #-}

(∈) :: Eq e => e -> [e] -> Bool
(∈) _ [] = False
e ∈ (x:xs) = e == x || e ∈ xs
infixl 5 ∈ 

(∉) :: Eq e => e -> [e] -> Bool
(∉) _ [] = True
e ∉ (x:xs) = e /= x && e ∉ xs
infixl 5 ∉ 

(∅) = []

(∧) = (&&)
(∨) = (||)
-- (≠) = (/=)
(¬) = not


-- ∞∝
-- ⊣ ⊥ + ⊢ ⊤ 
-- ∀∃∫
-- ⊆ ⊇
-- ⎕ ○
-- 
-- ∂
-- ⇒⇔
-- ≇
-- ≡≢
-- ≣
-- ∴ ∵
-- ∪ ∩ ⊂ ⊃
-- ← → ↓ ↑
