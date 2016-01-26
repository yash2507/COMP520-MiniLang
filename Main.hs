module Main (main) where

import Scanner (S_Tokens(..), scan, smain)
import Parser (P, parse, pmain)
import qualified Control.Exception as E

filterfn (S_Error _) = False
filterfn _ = True

scanErrors (l:ls) = if (not (filterfn l))
 then (l:(scanErrors ls))
 else (scanErrors ls)
scanErrors [] = []

weed l = filter filterfn l

final s = (parse (scan s))

main = do
 s <- getContents
 E.catch (putStrLn ("VALID: " ++(show (final s))))
  (\(E.ErrorCall e) -> putStrLn ("INVALID: Parse Error at "++ e))

