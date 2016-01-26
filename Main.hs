module Main (main) where

import Scanner (S_Tokens(..),scan, smain)
import Parser (parse, pmain)

filterfn (S_Error _) = False
filterfn _ = True

scanErrors (l:ls) = if (not (filterfn l))
 then (l:(scanErrors ls))
 else (scanErrors ls)
scanErrors [] = []

weed l = filter filterfn l

main = do
 s <- getContents
 print (parse (weed (scan s)))


