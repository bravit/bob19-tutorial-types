{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE MultiParamTypeClasses #-}



type family SumTy a b

type instance SumTy Integer Double = Double
type instance SumTy Int Integer = Integer
-- ghci







-- $
-- >>> :set -XNoStarIsType
-- >>> :kind SumTy Integer Double
-- SumTy Integer Double :: Type
-- >>> :kind! SumTy Integer Double
-- SumTy Integer Double :: Type
-- = Double

-- >>> :☛ Note using ':kind!'

-- $
-- >>> :kind! SumTy Integer
-- SumTy Integer :: Type -> Type
-- = SumTy Integer

-- >>> :back











class GNum a b where
  plus :: (Num a, Num b) => a -> b -> SumTy a b

instance GNum Integer Double where
  plus a b = fromInteger a + b

instance GNum Int Integer where
  plus a b = fromIntegral a + b

-- ghci





  
-- $
-- >>> plus (2 :: Integer) (4.5 :: Double)
-- 6.5
-- >>> plus (2 :: Int) (5 :: Integer)
-- 7
-- >>> :type plus (2 :: Integer) (4.5 :: Double)
-- plus (2 :: Integer) (4.5 :: Double) :: Double
-- >>> :type plus (2 :: Int) (5 :: Integer)
-- plus (2 :: Int) (5 :: Integer) :: Integer




main = undefined
