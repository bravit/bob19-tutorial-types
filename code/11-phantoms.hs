{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- Does it make sense to have types without values? Absolutely!

-- 'unit' is called a phantom type
newtype Weight unit = Weight Double
  deriving (Num, Show)

data Kg
data Lb








w1 :: Weight Kg
w1 = Weight 81

w2 :: Weight Lb
w2 = Weight 120

--ghci






-- >>> w1 + w2
-- <TYPE ERROR!>
-- >>> :back







kg2lb :: Weight Kg -> Weight Lb
kg2lb (Weight wkg) =
  Weight (wkg * 2.205)

--ghci






-- $
-- >>> kg2lb w1 + w2
-- Weight 298.605


-- >>> :☛ This is type level!

-- >>> :☛ Unfortunately, this works too:

-- $
-- >>> let w3 = Weight 0 :: Weight Bool
-- >>> w3
-- Weight 0.0







main = undefined
