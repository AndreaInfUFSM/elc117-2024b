{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import System.Random (randomRIO)
import Control.Monad.IO.Class (liftIO)
import Data.Text.Lazy (Text)

-- List of random advices
-- From https://api.adviceslip.com/advice
advices :: [Text]
advices =
    [ "It always seems impossible, until it's done."
    , "To cleanly remove the seed from an Avocado, lay a knife firmly across it, and twist."
    , "Fail. Fail again. Fail better."
    , "Play is the true mother of invention."
    , "Remedy tickly coughs with a drink of honey, lemon and water as hot as you can take."
    ]

-- Function to get a random advice
-- Using "do" to execute actions step by step, like in "imperative" programming
getRandomAdvice :: IO Text
getRandomAdvice = do
    index <- randomRIO (0, length advices - 1)
    return $ advices !! index

main :: IO ()
main = scotty 3000 $ do
    middleware logStdoutDev
    get "/advice" $ do
        randomAdvice <- liftIO getRandomAdvice   
        text randomAdvice

