{-# LANGUAGE PolyKinds #-}

import Data.Proxy

-- Sometimes we have a value, but we don't need it

-- data Proxy t = Proxy










class DescribeType a where
  describe :: Proxy a -> String









instance DescribeType Bool where
  describe _ = "My favorite type"

data MyType

instance DescribeType MyType where
  describe _ = "My own type"

-- We need the PolyKinds extension to define this instance  
instance DescribeType Maybe where
  describe _ = "Maybe type constructor"

-- ghci






-- $
-- >>> describe (Proxy :: Proxy Bool)
-- "My favorite type"
-- >>> describe (Proxy :: Proxy MyType)
-- "My own type"
-- >>> describe (Proxy :: Proxy Maybe)
-- "Maybe type constructor"

-- >>> :back
  



-- Practical example (json-schema):
-- class JSONSchema a where
--   schema :: Proxy a -> Schema  




-- So, we can use Proxy anywhere we want
-- to specify a type, but don't want
-- to provide (or don't have) a value of that type  

-- Exercise 1: look at the 'tagged' package
-- and find some similarities  

-- Exercise 2: you may occasionally come up
-- with a function like this:

someFunc :: proxy a -> String
someFunc _ = "OK"

-- Invent as many ways as you can to call this function





main = undefined
