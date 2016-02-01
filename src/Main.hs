module Main (main) where

import Scanner
import Parser
import PrettyPrinter
import qualified Control.Exception as E

filterfn (S_Error _) = False
filterfn _ = True

weedScanErrors (l:ls) = if (not (filterfn l))
 then (l:(weedScanErrors ls))
 else (weedScanErrors ls)
weedScanErrors [] = []

weed l = filter filterfn l

final s = unlines $ prettyPrint (parse (scan s))


main = do
 s <- getContents
 let t = final s
 putStr t
 putStr $ show (t == (final t))
 --E.catch (putStrLn ("VALID: " ++(show (final s))))
  --(\(E.ErrorCall e) -> putStrLn ("INVALID: Parse Error at "++ e))

