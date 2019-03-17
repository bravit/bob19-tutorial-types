{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

class Describe a where
  describe :: String

instance Describe Bool where
  describe = "My favorite type"

data MyType

instance Describe MyType where
  describe = "My own type"

instance Describe Maybe where
  describe = "Maybe type constructor"

-- ghci




-- :section Type applications

-- $
-- >>> :set -XTypeApplications
-- >>> describe @ Bool
-- "My favorite type"
-- >>> describe @ Maybe
-- "Maybe type constructor"

  
-- >>> :☛ The most popular example:

-- $
-- >>> read @ Int "42"
-- 42
-- >>> :type read
-- read :: Read a => String -> a
-- >>> :type read @ Int
-- read @ Int :: String -> Int


main = undefined
