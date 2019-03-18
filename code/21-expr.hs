data Expr = I Int
          | Expr :+: Expr
          | Expr :*: Expr

infixl 6 :+:
infixl 7 :*:

expr = I 8 :*: I 3 :+: (I 6 :+: I 3) :*: I 2

eval :: Expr -> Int
eval (I n) = n
eval (e1 :+: e2) = eval e1 + eval e2
eval (e1 :*: e2) = eval e1 * eval e2
--ghci

-- $
-- >>> eval expr
-- 42

main = undefined
