module PrettyPrinter (prettyPrint) where

import Parser
import Numeric
import Prelude
import Data.Either

indent :: [String] -> [String]
indent l = map (\s -> ("    " ++ s)) l

prettyPrint :: P -> [String]
prettyPrint (Program d s) = (prettyPrintD d) ++ (prettyPrintS s)

prettyPrintD :: [Declaration] -> [String]
prettyPrintD (d1:ds) = [(prettyPrintDeclaration d1)] ++ (prettyPrintD ds)
prettyPrintD [] = []

prettyPrintDeclaration :: Declaration -> String
prettyPrintDeclaration (Init varName 1) = ("var " ++ varName ++ ": int;")
prettyPrintDeclaration (Init varName 2) = ("var " ++ varName ++ ": float;")
prettyPrintDeclaration (Init varName 3) = ("var " ++ varName ++ ": string;")
prettyPrintDeclaration (Init varName _) = ("Error PP01")

prettyPrintS :: [Statement] -> [String]
prettyPrintS (s1:ss) = [(prettyPrintStatement s1)] ++ (prettyPrintS ss) 
prettyPrintS [] = []

prettyPrintStatement :: Statement -> String
prettyPrintStatement (Eval varName expression) = (varName ++ " = " ++ (prettyPrintExpression expression) ++ ";")
prettyPrintStatement (Pr varName) = ("print " ++ varName ++ ";")
prettyPrintStatement (Re varName) = ("read " ++ varName ++ ";")
prettyPrintStatement (PrS str) = ("print \"" ++ str ++ "\";")
prettyPrintStatement (Wh f s) = unlines $ ["while " ++ (prettyPrintFactor f) ++ " do"] ++ (indent (prettyPrintS s)) ++ ["done"]
prettyPrintStatement (IfE f s1 []) = unlines $ ["if " ++ (prettyPrintFactor f) ++ " then"] ++ (indent (prettyPrintS s1)) ++ ["endif"]
prettyPrintStatement (IfE f s1 s2) = unlines $ ["if " ++ (prettyPrintFactor f) ++ " then"] ++ (indent (prettyPrintS s1)) ++ ["else"] ++ (indent (prettyPrintS s2)) ++ ["endif"]

prettyPrintExpression :: Expr -> String
prettyPrintExpression (Add e t) = (prettyPrintExpression e) ++ " + " ++ (prettyPrintTerm t)
prettyPrintExpression (Subtract e t) = (prettyPrintExpression e) ++ " - " ++ (prettyPrintTerm t)
prettyPrintExpression (Trm t) = (prettyPrintTerm t)

prettyPrintTerm :: Term -> String
prettyPrintTerm (Multiply t f) = (prettyPrintTerm t) ++ " * " ++ (prettyPrintFactor f)
prettyPrintTerm (Divide t f) = (prettyPrintTerm t) ++ " / " ++ (prettyPrintFactor f)
prettyPrintTerm (Fctr f) = (prettyPrintFactor f)

prettyPrintFactor :: Factor -> String
prettyPrintFactor (It i) = (show i)
prettyPrintFactor (Flt f) = (showFFloat Nothing f "")
prettyPrintFactor (Str s) = "\"" ++ s ++ "\""
prettyPrintFactor (Var v) = " " ++ v ++ " "
prettyPrintFactor (Expression e) = " ( " ++ (prettyPrintExpression e) ++ " ) "





