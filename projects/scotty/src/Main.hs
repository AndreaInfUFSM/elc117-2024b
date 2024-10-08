{-# LANGUAGE OverloadedStrings #-}


-- ghc -threaded -o mywebapp Main.hs
-- ./mywebapp
-- curl http://localhost:3000/hello
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
