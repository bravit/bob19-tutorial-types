{-# LANGUAGE TypeFamilies #-}


data family XList a
data instance XList Char = XCons Char (XList Char) | XNil
data instance XList () = XListUnit Integer
data instance XList Bool = XBits Integer












class XListable a where
  headMay :: XList a -> Maybe a

instance XListable Char where
  headMay (XCons c _) = Just c
  headMay XNil = Nothing

instance XListable () where
  headMay (XListUnit 0) = Nothing
  headMay _ = Just ()

instance XListable Bool where
  headMay (XBits n)
    | n < 0 = Nothing
    | otherwise = Just (n `mod` 2 /= 0)









-- $
-- >>> headMay (XCons 'x' XNil)
-- Just 'x'
-- >>> headMay (XListUnit 0)
-- Nothing
-- >>> headMay (XBits 11)
-- Just True

main = undefined

-- Exercise 1: add data instance for XList Word8

-- Exercise 2: implement tail function
