{-# LANGUAGE TypeFamilies #-}


type family Widen a where
  Widen Bool = Int
  Widen Int = Integer
  Widen Char = String











class Widener a where
  widen :: a -> Widen a



















instance Widener Bool where
  widen False = 0
  widen True = 1

instance Widener Int where
  widen a = fromIntegral a

instance Widener Char where
  widen c = [c]

-- ghci














-- $
-- >>> widen False
-- 0
-- >>> widen 'x'
-- "x"
-- >>> widen (1 :: Int)
-- 1
-- >>> :t widen (1 :: Int)
-- widen (1 :: Int) :: Integer
-- >>> widen (widen True)
-- 1


main = undefined
