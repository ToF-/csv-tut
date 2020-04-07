module Main where

-- open-data
import OpenData

-- base
import qualified Control.Monad as Monad
import qualified System.Exit as Exit

main :: IO ()
main = do
    putStrLn "Open data!"

    eitherCountryItems <-
        fmap filtrerCountryItems 
        <$> decodeItemsFromFile "test/opendatasites91819.csv"

    case eitherCountryItems of
        Left reason -> 
          Exit.die reason

        Right countryItems -> do
            putStrLn "Number of country items:"
            print (length countryItems)

            Monad.void (encodeItemsToFile "test/countries.csv" countryItems)
