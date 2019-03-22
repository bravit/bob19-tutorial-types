{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Main where

import Data.Proxy
import Servant
    ((:>), (:<|>)((:<|>)),
     Get, JSON, PlainText,
     Server, Handler, serve)
import Network.Wai (Application)
import Network.Wai.Handler.Warp (run)
import Network.Wai.Middleware.RequestLogger (logStdoutDev)










-- | Describes API as a type.
type MyAPI = Get '[PlainText] String
        :<|> "year" :> Get '[JSON] Int
        :<|> "conf" :> Get '[JSON] [String]
        :<|> "like" :> Get '[JSON] Bool










-- | Defines API as a collection of hadlers.
myAPI :: Server MyAPI
myAPI = root :<|> year :<|> conf :<|> like

root :: Handler String
root = pure "Hello!"

year :: Handler Int
year = pure 2019

conf :: Handler [String]
conf = pure ["BOB2019",
             "Type-level programming in Haskell"]

like :: Handler Bool
like = pure True












-- | Defines a Warp 'Application'.
app :: Application
app = serve (Proxy :: Proxy MyAPI) myAPI

-- | Runs 'app'.
main :: IO ()
main = run 19322 $ logStdoutDev app

-- stack exec servant-simple

-- >>> :info Server
-- >>> import Servant.Server.Internal
-- >>> :info Handler
-- >>> :info ServerT

-- Great description of type-level features used in Servant:
-- https://arow.info/blog/posts/2015-07-10-servant-intro.html 
