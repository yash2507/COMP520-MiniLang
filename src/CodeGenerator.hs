module CodeGenerator(codeGenerate) where

import Parser
import PrettyPrinter
import TypeChecker
import Numeric

pre = ["#include <stdio.h>", "#include <string.h>", "", "int main ()", "{", "    // PROPER CODE FOLLOWS:"]
post = ["    return 0;", "}"]

codeGenerate :: P -> String
codeGenerate (Program d s) = codeGenerateP (Program d s) (symbolTable d)

codeGenerateP :: P -> [Symbol] -> String
codeGenerateP (Program d s) st = unlines $ pre ++ (indent $ ["// DECLARATIONS"] ++ (codeGenerateD d) ++ ["", "// STATEMENTS"] ++ (codeGenerateS s st)) ++  post

codeGenerateD :: [Declaration] -> [String]
codeGenerateD ((Init x 1):ds) = ("int " ++ x ++ " = 0;"):(codeGenerateD ds)
codeGenerateD ((Init x 2):ds) = ("float " ++ x ++ " = 0.0;"):(codeGenerateD ds)
codeGenerateD ((Init x 3):ds) = ("char " ++ x ++ "[] = \"\";"):(codeGenerateD ds)
codeGenerateD ((Init _ _):ds) = codeGenerateD ds
codeGenerateD [] = ["char temp[] = \"\";"]

codeGenerateS :: [Statement] -> [Symbol] -> [String]
codeGenerateS ((Eval v e):ss) st = let z = (typeCheckS (Eval v e) st) in
 if (z == StV)
  then (v ++ " = " ++ (codeGenerateE e) ++ " ;"):(codeGenerateS ss st)
  else if (z == StCI)
   then ( v ++ " = (int) ( " ++ (codeGenerateE e) ++ " ) ;"):(codeGenerateS ss st)
   else if (z == StCF)
    then ( v ++ " = (float) ( " ++ (codeGenerateE e) ++ " ) ;"):(codeGenerateS ss st)
    else if (z == StS)
     then (codeGenerateStr (Eval v e)) ++ (codeGenerateS ss st)
     else (codeGenerateS ss st)
codeGenerateS ((Pr v):ss) st = let z = (typeCheckS (Pr v) st) in
 if (z == StI)
  then ("printf(\"%d\", " ++ v ++ ");"):(codeGenerateS ss st)
  else if (z == StF)
   then ("printf(\"%f\", " ++ v ++ ");"):(codeGenerateS ss st)
   else if (z == StS)
    then ("printf(\"%s\", " ++ v ++ ");"):(codeGenerateS ss st)
    else (codeGenerateS ss st)
codeGenerateS ((Re v):ss) st = let z = (typeCheckS (Pr v) st) in
 if (z == StI)
  then ("scanf(\"%d\", &" ++ v ++ ");"):(codeGenerateS ss st)
  else if (z == StF)
   then ("scanf(\"%f\", &" ++ v ++ ");"):(codeGenerateS ss st)
   else if (z == StS)
    then ("scanf(\"%s\", " ++ v ++ ");"):(codeGenerateS ss st)
    else (codeGenerateS ss st)
codeGenerateS ((PrS s):ss) st = ("printf(\"" ++ s ++ "\");"):(codeGenerateS ss st)
codeGenerateS ((Wh f s):ss) st = let z = (typeCheckS (Wh f s) st) in
 if (z == StV)
  then ("while ( " ++ (codeGenerateF f) ++ " )"):["{"] ++ (indent $ codeGenerateS s st) ++ ("}"):(codeGenerateS ss st)
  else (codeGenerateS ss st)
codeGenerateS ((IfE f s []):ss) st = let z = (typeCheckS (IfE f s []) st) in
 if (z == StV)
  then ("if ( " ++ (codeGenerateF f) ++ " )"):["{"] ++ (indent $ codeGenerateS s st) ++ ("}"):(codeGenerateS ss st)
  else (codeGenerateS ss st)
codeGenerateS ((IfE f s1 s2):ss) st = let z = (typeCheckS (IfE f s1 s2) st) in
 if (z == StV)
  then ("if ( " ++ (codeGenerateF f) ++ " )"):["{"] ++ (indent $ codeGenerateS s1 st) ++ ["}", "else", "{"] ++ (indent $ codeGenerateS s2 st) ++ ("}"):(codeGenerateS ss st)
  else (codeGenerateS ss st)
codeGenerateS [] _ = []

codeGenerateStr :: Statement -> [String]
codeGenerateStr _ = []

codeGenerateE :: Expr -> String
codeGenerateE (Add e t) = (codeGenerateE e) ++ " + " ++ (codeGenerateT t)
codeGenerateE (Subtract e t) = (codeGenerateE e) ++ " - " ++ (codeGenerateT t)
codeGenerateE (Trm t) = codeGenerateT t

codeGenerateT :: Term -> String
codeGenerateT (Multiply t f) = (codeGenerateT t) ++ " * " ++ (codeGenerateF f)
codeGenerateT (Divide t f) = (codeGenerateT t) ++ " / " ++ (codeGenerateF f)
codeGenerateT (Fctr f) = codeGenerateF f

codeGenerateF :: Factor -> String
codeGenerateF (It i) = show i
codeGenerateF (Flt f) = showFFloat Nothing f ""
codeGenerateF (Var x) = x
codeGenerateF (Expression e) = " ( " ++ (codeGenerateE e) ++ " ) "
codeGenerateF _ = ""

