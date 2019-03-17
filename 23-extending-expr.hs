{-# LANGUAGE StandaloneDeriving #-}

-- Let's extend Expr with Bool values and If

data Expr = I Int
          | Expr :+: Expr
          | Expr :*: Expr
          | B Bool            -- NEW!
          | If Expr Expr Expr -- NEW!

deriving instance Show Expr

infixl 6 :+:
infixl 7 :*:

expr = I 8 :*: I 3 :+: (I 6 :+: I 3) :*: I 2

expr2 = If (B False) expr (I 0)








-- eval is much more complicated now
eval :: Expr -> Maybe (Either Int Bool)
eval (I n) = Just $ Left n
eval (B b) = Just $ Right b
eval (e1 :+: e2) = combineInts (+) e1 e2
eval (e1 :*: e2) = combineInts (*) e1 e2
eval (If b e1 e2) =
  case eval b of
    Just (Right True) -> eval e1
    Just (Right False) -> eval e2
    _ -> Nothing





combineInts :: (Int -> Int -> Int) ->
               Expr -> Expr ->
               Maybe (Either Int Bool)
combineInts f e1 e2 = case (eval e1, eval e2) of
  (Just (Left n1), Just (Left n2)) ->
                      Just $ Left $ f n1 n2
  _ -> Nothing

-- Basically, we are combining type checking
-- and evaluation. Why not ask the compiler
-- to check types?

-- $
-- >>> expr2
-- If (B False) (I 8 :*: I 3 :+: (I 6 :+: I 3) :*: I 2) (I 0)
-- >>> eval expr2
-- Just (Left 0)


main = undefined
