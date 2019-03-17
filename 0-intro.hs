-- Haskell can be used as a calculator without thinking about types


f x = (x * 3 + 6)*2
-- ghci




-- >>> :section Welcome to my GHCi!

-- $
-- >>> :type f
-- f :: Num a => a -> a
-- >>> f 5
-- 42
-- >>> :type f 5
-- f 5 :: Num a => a

-- >>> :back





arg :: Integer
arg = 5

answer = f arg
-- ghci




-- $
-- >>> answer
-- 42
-- >>> :type answer
-- answer :: Integer

-- >>> :☛ So, we have terms and types.
-- >>> :section Let's classify types

-- $
-- >>> :kind Integer
-- Integer :: *
-- >>> :kind Int
-- Int :: *
-- >>> :kind Maybe
-- Maybe :: * -> *
-- >>> :kind Maybe Int
-- Maybe Int :: *

-- >>> :section '*' is outdated

-- $
-- >>> :set -XNoStarIsType
-- >>> :kind Integer
-- Integer :: Type
-- >>> :kind Bool
-- Bool :: Type
-- >>> :kind Maybe
-- Maybe :: Type -> Type
-- >>> :kind Either
-- Either :: Type -> Type -> Type
-- >>> :kind Maybe Int
-- Maybe Int :: Type

-- >>> :section "Ok, what about Num?"

-- $
-- >>> :kind Num
-- Num :: Type -> Constraint
-- >>> :kind Num Int
-- Num Int :: Constraint
-- >>> :set -XExplicitForAll 
-- >>> :kind forall a. Num a
-- forall a. Num a :: Constraint
-- >>> :kind forall a. Num a => a
-- forall a. Num a => a :: Type

-- >>> :section "Can we classify kinds?"

-- $
-- >>> import Data.Kind (Type, Constraint)
-- >>> :kind Type
-- Type :: Type
-- >>> :kind Constraint 
-- Constraint :: Type

-- >>> :☛ We have terms, types, and kinds.
-- >>> :☛ Kinds are also types!



main = undefined
