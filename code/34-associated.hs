{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleContexts #-}

import Data.List
import Data.Map (Map)
import qualified Data.Map as Map (fromList)









class Graph g where
  type Vertex g -- associated type family
  data Edge g   -- associated data family
  src, tgt :: Edge g -> Vertex g
  outEdges :: g -> Vertex g -> [Edge g]
  -- other methods








neighbours :: Graph g => 
              g -> Vertex g -> [Vertex g]
neighbours g v = map tgt (outEdges g v)











isLoop :: (Graph g, Eq (Vertex g)) =>
          g -> Edge g -> Bool
isLoop g e = src e == tgt e








-- Representation #1: list of edges
newtype G1 = G1 [Edge G1]

instance Graph G1 where
  type Vertex G1 = Int
  data Edge G1 = MkEdge1 (Vertex G1) (Vertex G1) 
  src = undefined
  tgt = undefined
  outEdges = undefined

g1 :: G1
g1 = G1 [MkEdge1 0 1, MkEdge1 1 0]






-- Representation #2: lists of adjacent vertices
newtype G2 = G2 (Map (Vertex G2) [Vertex G2])

instance Graph G2 where
  type Vertex G2 = String
  data Edge G2 = MkEdge2 Int (Vertex G2)
                             (Vertex G2)
  src = undefined
  tgt = undefined
  outEdges = undefined

g2 :: G2
g2 = G2 (Map.fromList [("A", ["B"]),
                       ("B", ["A"])])

-- ghci






-- $
-- >>> :type neighbours g1 0
-- neighbours g1 0 :: [Int]
-- >>> :type neighbours g2 "A"
-- neighbours g2 "A" :: [String]
-- >>> :type isLoop g1 (MkEdge1 0 1)
-- isLoop g1 (MkEdge1 0 1) :: Bool

main = undefined

-- Exercise: implement both instances!
