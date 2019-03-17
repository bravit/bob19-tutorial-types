{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE StandaloneDeriving #-}


import Data.Function ((&))
import Control.Monad (foldM)
import Text.Read (readMaybe)
import Data.Type.Equality ((:~:) (Refl))







data DoorState = Opened | Closed
  deriving Show

data Door (s :: DoorState) where
  MkDoor :: Door Closed
  Open :: Door Closed -> Door Opened
  Close :: Door Opened -> Door Closed
  Hold :: Door s -> Door s

deriving instance Show (Door s)









openedDoor = Open MkDoor

-- badDoor = Close MkDoor

someDoor = MkDoor & Open & Hold & Hold & Close & Hold & Open 
-- (&) = flip ($) -- imported from Data.Function (base)








-- The problem: we want to read a door from the given String:
-- parseDoor "Open Hold Hold Close Hold Open Hold Close Open"

-- What should be returned?








parseDoorAttempt :: String -> Door s
parseDoorAttempt str = undefined








-- Solution: existential type!

data AnyDoor where
  AnyDoor :: Door s -> AnyDoor

deriving instance Show AnyDoor







-- data AnyDoor = forall s . AnyDoor (Door s)
-- requires ExistentialQuantification








applyCmdAttempt :: AnyDoor -> String -> 
                   Maybe AnyDoor
applyCmdAttempt (AnyDoor d) "Open" = undefined -- Just $ AnyDoor $ Open d







doorState :: Door s -> DoorState
doorState MkDoor = Closed
doorState (Open _) = Opened
doorState (Close _) = Closed
doorState (Hold d) = doorState d







applyCmdAttempt2 :: AnyDoor -> String -> Maybe AnyDoor
applyCmdAttempt2 (AnyDoor d) "Open" =
  case doorState d of
    Closed -> undefined -- Just $ AnyDoor $ Open d
    _ -> Nothing








-- Unfortunately, we don't have any information about 's' at the type level. 








checkClosed :: Door s -> Maybe (s :~: Closed)
checkClosed MkDoor = Just Refl
checkClosed (Close _) = Just Refl
checkClosed (Hold d) = checkClosed d
checkClosed _ = Nothing

checkOpened :: Door s -> Maybe (s :~: Opened)
checkOpened (Open _) = Just Refl
checkOpened (Hold d) = checkOpened d
checkOpened _ = Nothing

-- What is going on? Well, GADT data constructors introduce local assumptions about types, e.g.:
-- MkDoor :: Door Closed
-- means
-- MkDoor :: (s ~ Closed) => Door s
-- And we can use these assumptions!







justAny :: Door s -> Maybe AnyDoor
justAny = Just . AnyDoor

applyCmd :: AnyDoor -> String -> Maybe AnyDoor
applyCmd (AnyDoor d) "Open" =
  case checkClosed d of
    Just Refl -> justAny $ Open d -- !!!
                 -- Refl :: s :~: Closed
    Nothing -> Nothing
applyCmd (AnyDoor d) "Close" =
  checkOpened d >>= \Refl -> justAny $ Close d
applyCmd (AnyDoor d) "Hold" = justAny $ Hold d
applyCmd _ _ = Nothing

parseDoor :: String -> Maybe AnyDoor
parseDoor =
  foldM applyCmd (AnyDoor MkDoor) . words

testDoor :: Maybe AnyDoor
testDoor = parseDoor "Open Hold Hold Close Hold Open Hold Close Open"


-- Exercises

anyDoorState :: AnyDoor -> DoorState
anyDoorState = undefined

extractDoor :: AnyDoor ->
               Either (Door Closed) (Door Opened)
extractDoor = undefined

extractClosed :: AnyDoor -> Maybe (Door Closed)
extractClosed = undefined

extractOpened :: AnyDoor -> Maybe (Door Opened)
extractOpened = undefined


main = undefined
