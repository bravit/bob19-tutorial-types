{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}


import GHC.TypeLits
import Data.Proxy
import Data.List

-- ghci




-- $
-- >>> :set -XDataKinds -XNoStarIsType

-- >>> :section Type-level natural numbers

-- $
-- >>> :kind 4
-- 4 :: Nat

-- >>> :back







newtype Pointer (align :: Nat) = Pointer Integer
  deriving Show

inc :: forall n. KnownNat n =>
       Pointer n -> Pointer n
inc (Pointer n) =
  Pointer (n + natVal (Proxy :: Proxy n))






ptr :: Pointer 4 -- type-level Nat literal
ptr = Pointer 12 -- term-level Integer literal

-- ghci




-- $
-- >>> inc ptr
-- Pointer 16

-- >>> :section Type-level strings

-- $
-- >>> :kind "hello"
-- "hello" :: Symbol

-- >>> :back








data PrefixedString (prefix :: Symbol) = PS String
  deriving Show

type XPrefixed = PrefixedString "X"
type YPrefixed = PrefixedString "Y"







consPS :: forall prefix. KnownSymbol prefix =>
          String -> Maybe (PrefixedString prefix)
consPS s
  | symbolVal (Proxy :: Proxy prefix)
    `isPrefixOf` s = Just (PS s)
  | otherwise = Nothing

ps1 :: Maybe XPrefixed
ps1 = consPS "Xabcd"

ps2 :: Maybe YPrefixed
ps2 = consPS "Xabcd"
-- ghci






-- $
-- >>> ps1
-- Just (PS "Xabcd")
-- >>> ps2
-- Nothing

-- >>> :section Type-level lists

-- $
-- >>> :kind [Int, Bool]
-- [Int, Bool] :: [Type]
-- >>> :kind '[Int, Bool]
-- '[Int, Bool] :: [Type]


main = undefined


-- Exercise: define datatype Id which can be used
-- to define the following type synonyms:
-- type UserId = Id "user"
-- type AdminId = Id "admin"

