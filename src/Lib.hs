{-# LANGUAGE OverloadedStrings #-}

module Lib(run) where

import Web.Spock
import Control.Monad.Trans
import Data.Monoid
import Data.IORef
import qualified Data.Text as T

data MySession = EmptySession
data MyAppState = DummyAppState (IORef Int)

run :: IO ()
run = do
  ref <- newIORef 0
  let spockCfg = defaultSpockCfg EmptySession PCNoDatabase (DummyAppState ref)
  runSpock 8080 (spock spockCfg app)

app :: SpockM () MySession MyAppState ()
app = get root $ text "Hello World!"
