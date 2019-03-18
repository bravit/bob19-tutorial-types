{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NoStarIsType #-}

data a * b = a :*: b
  deriving Show
           
data a + b = Inl a | Inr b
  deriving Show

infixl 7 *
infixl 6 +









first :: a * b -> a
first (a :*: _) = a

second :: a * b -> b
second (_ :*: b) = b










val1 :: Int + Bool * Bool
val1 = Inl 0

val2 :: Int + Bool * Bool
val2 = Inr (True :*: False)















type NiceType a = a + a * a + a * a * a

val3 :: NiceType Int
val3 = Inl (Inr (0 :*: 0))








main = undefined
