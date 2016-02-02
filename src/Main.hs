module Main (main) where

import Scanner
import Parser
import PrettyPrinter
import TypeChecker
import CodeGenerator
import qualified Control.Exception as E

filterfn (S_Error _) = False
filterfn _ = True

weedScanErrors (l:ls) = if (not (filterfn l))
 then (l:(weedScanErrors ls))
 else (weedScanErrors ls)
weedScanErrors [] = []

weed l = filter filterfn l

sp s = parse (scan s)
sppp t = prettyPrint (sp t)

main = do
 s <- getContents
 let t = sp s
 let u = prettyPrint t
 --putStrLn $ show (u == (sppp u))
 putStrLn $ show $ typeCheck t
 let v = (renameVariables t)
 putStrLn $ codeGenerate v
 --E.catch (putStrLn ("VALID: " ++(show (final s))))
  --(\(E.ErrorCall e) -> putStrLn ("INVALID: Parse Error at "++ e))

