{-# LANGUAGE OverloadedStrings #-}


-- Run as:
-- runhaskell helloScotty.hs
-- Or compile and run:
-- ghc -threaded -o mywebapp helloScotty.hs
-- ./mywebapp
-- Test locally:
-- curl http://localhost:3000/hello
-- Test in Codespaces (replace the server by your codespace URL):
-- https://ideal-parakeet-p55v4xx7vx536pgw-3000.app.github.dev/hello

import Web.Scotty
import Network.Wai.Middleware.RequestLogger (logStdoutDev)

main :: IO ()
main = scotty 3000 $ do
  middleware logStdoutDev

  -- Define your routes and handlers here
  get "/hello" $ do
    text "Hello, Haskell Web Service!"

  -- Add more routes as needed
