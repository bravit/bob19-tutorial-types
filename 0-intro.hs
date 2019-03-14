-- Haskell can be used as a calculator
-- without thinking about types

-- $
-- >>> :type f
-- f :: Num a => a -> a
-- >>> f 5
-- 42
-- >>> :type f 5
-- f 5 :: Num a => a
f x = (x * 3 + 6)*2

arg :: Integer
arg = 5

-- $
-- >>> answer
-- 42
-- >>> :type answer
-- answer :: Integer
answer = f arg

-- So, we have terms and types.
-- Types can be inferred.
-- Programmer may affect type inference
-- by specifying type signatures.



main = undefined
