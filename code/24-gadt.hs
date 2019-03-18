{-# LANGUAGE GADTs #-}

data Expr a where
  I :: Int -> Expr Int -- cf. Expr a
  B :: Bool -> Expr Bool
  IsZero :: Expr Int -> Expr Bool -- NEW!
  (:+:) :: Expr Int -> Expr Int -> Expr Int
  (:*:) :: Expr Int -> Expr Int -> Expr Int
  If :: Expr Bool -> Expr a -> Expr a -> Expr a

infixl 6 :+:
infixl 7 :*:







expr = I 8 :*: I 3 :+: (I 6 :+: I 3) :*: I 2

expr2 = If (B False) expr (I 0)

expr3 = If (IsZero expr2) (I 1) (I 0)







eval :: Expr a -> a
eval (I n) = n
eval (B b) = b
eval (IsZero e) = eval e == 0
eval (e1 :+: e2) = eval e1 + eval e2
eval (e1 :*: e2) = eval e1 * eval e2
eval (If b e1 e2)
  | eval b = eval e1
  | otherwise = eval e2

-- Now it's easy!

-- Unfortunately, it's harder to construct
-- such an expression programmatically
-- (say, by reading from the file)





main = undefined
