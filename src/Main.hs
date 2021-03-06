module Main (main) where

import Scanner
import Parser
import PrettyPrinter
import TypeChecker
import CodeGenerator
import System.IO
import qualified Control.Exception as E

filterfn (S_Error _) = False
filterfn _ = True

weedScanErrors (l:ls) = if (not (filterfn l))
 then (l:(weedScanErrors ls))
 else (weedScanErrors ls)
weedScanErrors [] = []

fileName x = take ((length x) - 4) x

weed l = filter filterfn l

sp s = parse (scan s)
sppp t = prettyPrint (sp t)

main = do
 inputFN <- getContents
 inputFC <- readFile inputFN
 let (Program d s) = sp inputFC
 let fileNameCore = fileName inputFN
 writeFile (fileNameCore ++ ".pretty.min") (prettyPrint (Program d s))
 writeFile (fileNameCore ++ ".symbol.txt") (unlines $ map show (symbolTable d))
 if typeCheck (Program d s)
  then writeFile (fileNameCore ++ ".c") (codeGenerate (renameVariables (Program d s)))
  else error "Code Not Generated, Type Error."


