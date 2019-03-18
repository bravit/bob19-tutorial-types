{-# LANGUAGE GADTSyntax #-}


data Expr where
  I :: Int -> Expr
  (:*:) :: Expr -> Expr -> Expr
  (:+:) :: Expr -> Expr -> Expr









-- The following definitions mean the same thing

data BinTree a = EmptyTree
               | Node a (BinTree a) (BinTree a)

data BinTree' a where
  EmptyTree' :: BinTree' a
  Node' :: a -> BinTree' a -> BinTree' a -> BinTree' a






main = undefined
