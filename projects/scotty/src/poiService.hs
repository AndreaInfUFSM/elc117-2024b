{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import System.Random (randomRIO)
import Control.Monad.IO.Class (liftIO)
import Data.Text.Lazy (Text, pack, unpack)
import Text.Printf (printf)
import Data.List (intercalate)

-- Latitude and longitude of some Points of Interest at UFSM
poiList :: [(String, Double, Double)]
poiList = [("Centro de Tecnologia", -29.713318, -53.71663),
           ("Biblioteca Central", -29.71566, -53.71523),
           ("Centro de Convenções", -29.72237, -53.71718),
           ("Planetário", -29.72027, -53.71726),
           ("Reitoria da UFSM", -29.72083, -53.71479),
           ("Restaurante Universitário 2", -29.71400, -53.71937),
           ("HUSM", -29.71368, -53.71536),
           ("Pulsar Incubadora Tecnológica - Prédio 2", -29.71101, -53.71634),
           ("Pulsar Incubadora Tecnológica - Prédio 61H", -29.72468, -53.71335),
           ("Casa do Estudante Universitário - CEU II", -29.71801, -53.71465)]



-- Simple functions to convert our POIs to JSON-formatted strings
-- For more robust JSON manipulation, see Aeson (a library for JSON manipulation): 
-- https://hackage.haskell.org/package/aeson
-- https://williamyaoh.com/posts/2019-10-19-a-cheatsheet-to-json-handling.html
poiJsonFormat :: String
poiJsonFormat = "{\"poi\": \"%s\", \"latitude\": \"%s\", \"longitude\": \"%s\"}"

poiToJSONString :: (String, Double, Double) -> String
poiToJSONString (poi,lat,lon) = printf poiJsonFormat poi (show lat) (show lon)

poiListToJSONString :: [(String, Double, Double)] -> String
poiListToJSONString poiList = "[" ++  (intercalate "," $ map poiToJSONString poiList) ++ "]"



-- Function to calculate the distance between 2 points on a sphere, using the 
-- Haversine formula with latitudes and longitudes, as per this tutorial:
-- https://acervolima.com/formula-haversine-para-encontrar-a-distancia-entre-dois-pontos-em-uma-esfera/
calcDistance :: Double -> Double -> Double -> Double -> Double
calcDistance lat1 lon1 lat2 lon2 = 
    let r = 6371.0 -- Earth's radius in km
        dLat = (lat2 - lat1) * pi / 180.0
        dLon = (lon2 - lon1) * pi / 180.0
        a = sin (dLat / 2.0) * sin (dLat / 2.0) +
            cos (lat1 * pi / 180.0) * cos (lat2 * pi / 180.0) *
            sin (dLon / 2.0) * sin (dLon / 2.0)
        c = 2.0 * atan2 (sqrt a) (sqrt (1.0 - a))
    in r * c


-- Main Scotty application
main :: IO ()
main = scotty 3000 $ do
    middleware logStdoutDev  -- Log requests for development

    -- Route to return a hardcoded, sample POI
    get "/poi" $ do
        -- We set the header manually because we are returning a text (manually formatted as json)
        setHeader "Content-Type" "application/json"
        let response = poiToJSONString ("Restaurante Universitário 2", -29.71400, -53.71937)
        text (pack response)

    -- Route to return the POI list in JSON format
    get "/poilist" $ do
        setHeader "Content-Type" "application/json"
        let response = poiListToJSONString poiList
        text (pack response)    

    -- For example: http://localhost:3000/near/-29.71689/-53.72968
    get "/near/:lat/:lon" $ do
        setHeader "Content-Type" "application/json"
        givenLat <- pathParam "lat" :: ActionM Double
        givenLon <- pathParam "lon" :: ActionM Double
        let nearDistance = 1.5::Double
            near = filter isNear poiList
                where
                    distance (_, poiLat, poiLon) = calcDistance givenLat givenLon poiLat poiLon
                    isNear poi = distance poi <= nearDistance
            response = poiListToJSONString near
        text (pack response)