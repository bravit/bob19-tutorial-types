{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- We can define new kinds!

data WeightUnits = Kg | Lb

-- ghci







-- $
-- >>> :type Kg
-- Kg :: WeightUnits
-- >>> :set -XNoStarIsType
-- >>> :kind WeightUnits 
-- WeightUnits :: Type
-- >>> :set -XDataKinds
-- >>> :kind Kg
-- Kg :: WeightUnits

-- >>> :☛ We can use ' to disambiguate value and type 

-- $
-- >>> :kind 'Kg
-- 'Kg :: WeightUnits

-- Note this "'": 'Kg is another name for Kg type
-- when it's necessary to disambiguate type and
-- data constructor


-- >>> :back






newtype Weight (a :: WeightUnits) = Weight Double
  deriving (Num, Show)

w1 :: Weight Kg
w1 = Weight 81

w2 :: Weight Lb
w2 = Weight 120

kg2lb :: Weight Kg -> Weight Lb
kg2lb (Weight wkg) = Weight (wkg * 2.205)

-- ghci




-- $
-- >>> kg2lb w1 + w2
-- Weight 298.605

-- >>> :☛ This is no longer possible:
-- >>> w3 = Weight 0 :: Weight Bool



main = undefined
