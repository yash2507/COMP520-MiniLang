module TypeChecker
(
 typeCheck,
 symbolTable,
 typeCheckS,
 typeCheckE,
 renameVariables,
 Symbol(..),
 StTy(..)
) where

import Parser
import Prelude
import Data.List
import Data.Maybe

data Symbol = TyInt String | TyFlt String | TyStr String | TyUnk String
 deriving (Show, Eq)

data StTy = StI | StF | StS | StV | StCI | StCF | StU
 deriving (Show, Eq)

typeCheck :: P -> Bool
typeCheck (Program d s) =
 let symbols = symbolTable d in
  if (duplicateInSym symbols)
  then error "A variable was declared twice using the same identifier."
  else weeded s symbols

typeCheckK :: [Statement] -> [Symbol] -> [StTy]
typeCheckK (s:ss) st = (typeCheckS s st):(typeCheckK ss st)
typeCheckK [] _ = [] 

typeCheckS :: Statement -> [Symbol] -> StTy
typeCheckS (Eval v e) st =
 let k = (symbolExists v st) in
 let l = (typeCheckE e st) in
 if (k == l && k == (TyStr ""))
  then StS
  else if (k == l)
   then StV
   else if ((k == TyInt "") && (l == TyFlt ""))
    then StU
    else if ((k == TyFlt "") && (l == TyInt ""))
     then StCF
     else StU
typeCheckS (Wh f sl) st = if ((typeCheckF f st) == TyInt "") && (weeded sl st)
 then StV
 else StU
typeCheckS (IfE f sl1 sl2) st = if ((typeCheckF f st) == TyInt "") && (weeded sl1 st) && (weeded sl2 st)
 then StV
 else StU
typeCheckS (Pr v) st =
 let k = (symbolExists v st) in
  if (k == TyInt "")
   then StI
   else if (k == TyFlt "")
    then StF
    else if (k == TyStr "")
     then StS
     else StU
typeCheckS (Re v) st =
 let k = (symbolExists v st) in
  if (k == TyInt "")
   then StI
   else if (k == TyFlt "")
    then StF
    else if (k == TyStr "")
     then StS
     else StU
typeCheckS (PrS _) st = StV

weeded :: [Statement] -> [Symbol] -> Bool
weeded (s:ss) st = ((typeCheckS s st) /= StU) && (weeded ss st)
weeded [] _ = True

fn y (TyInt x) = x == y
fn y (TyFlt x) = x == y
fn y (TyStr x) = x == y
fn y (TyUnk x) = x == y

duplicateInSym :: [Symbol] -> Bool
duplicateInSym ((TyInt x):xs) = (foldl (||) False (map (\u -> fn x u) xs)) || (duplicateInSym xs)
duplicateInSym ((TyFlt x):xs) = (foldl (||) False (map (\u -> fn x u) xs)) || (duplicateInSym xs)
duplicateInSym ((TyStr x):xs) = (foldl (||) False (map (\u -> fn x u) xs)) || (duplicateInSym xs)
duplicateInSym ((TyUnk x):xs) = (foldl (||) False (map (\u -> fn x u) xs)) || (duplicateInSym xs)
duplicateInSym [] = False

symbolTable :: [Declaration] -> [Symbol]
symbolTable (d:ds) = (symbolFromD d):(symbolTable ds)
symbolTable [] = []

symbolFromD :: Declaration -> Symbol
symbolFromD (Init v 1) = TyInt v
symbolFromD (Init v 2) = TyFlt v
symbolFromD (Init v 3) = TyStr v
symbolFromD _ = TyUnk ""

symbolExists :: String -> [Symbol] -> Symbol
symbolExists v ((TyInt x):ls) = if (x == v)
  then (TyInt "")
  else symbolExists v ls
symbolExists v ((TyFlt x):ls) = if (x == v)
  then (TyFlt "")
  else symbolExists v ls
symbolExists v ((TyStr x):ls) = if (x == v)
  then (TyStr "")
  else symbolExists v ls
symbolExists v _ = (TyUnk v)

tcAddSub :: Symbol -> Symbol -> Symbol
tcAddSub (TyInt _) (TyInt _) = (TyInt "")
tcAddSub (TyFlt _) (TyFlt _) = (TyFlt "")
tcAddSub (TyInt _) (TyFlt _) = (TyFlt "")
tcAddSub (TyFlt _) (TyInt _) = (TyFlt "")
tcAddSub (TyStr _) (TyStr _) = (TyStr "")
tcAddSub (TyUnk x) _ = (TyUnk x)
tcAddSub _ (TyUnk x) = (TyUnk x)
tcAddSub _ _ = (TyUnk "Type Mismatch in Addition/Subtraction.")

tcMultDiv :: Symbol -> Symbol -> Symbol
tcMultDiv (TyInt _) (TyInt _) = (TyInt "")
tcMultDiv (TyFlt _) (TyFlt _) = (TyFlt "")
tcMultDiv (TyInt _) (TyFlt _) = (TyFlt "")
tcMultDiv (TyFlt _) (TyInt _) = (TyFlt "")
tcMultDiv (TyUnk x) _ = (TyUnk x)
tcMultDiv _ (TyUnk x) = (TyUnk x)
tcMultDiv _ _ = (TyUnk "Type Mismatch in Multiplication/Division.")

typeCheckE :: Expr -> [Symbol] -> Symbol
typeCheckE (Add e t) s =
 let u = (typeCheckE e s) in
 let v = (typeCheckT t s) in
 tcAddSub u v
typeCheckE (Subtract e t) s =
 let u = (typeCheckE e s) in
 let v = (typeCheckT t s) in
 tcAddSub u v
typeCheckE (Trm t) s = typeCheckT t s

typeCheckT :: Term -> [Symbol] -> Symbol
typeCheckT (Multiply t f) s =
 let u = (typeCheckT t s) in
 let v = (typeCheckF f s) in
 tcMultDiv u v
typeCheckT (Divide t f) s =
 let u = (typeCheckT t s) in
 let v = (typeCheckF f s) in
 tcMultDiv u v
typeCheckT (Fctr f) s =
 typeCheckF f s

typeCheckF :: Factor -> [Symbol] -> Symbol
typeCheckF (It _) _ = TyInt ""
typeCheckF (Flt _) _ = TyFlt ""
typeCheckF (Str _) _ = TyStr ""
typeCheckF (Var v) s = symbolExists v s
typeCheckF (Expression e) s = typeCheckE e s

genVars :: [Symbol] -> [(String, String)]
genVars ((TyInt x):ss) = (x, (x ++ "X_O" ++ x)):(genVars ss)
genVars ((TyFlt x):ss) = (x, (x ++ "X_O" ++ x)):(genVars ss)
genVars ((TyStr x):ss) = (x, (x ++ "X_O" ++ x)):(genVars ss)
genVars ((TyUnk x):ss) = (x, (x ++ "X_O" ++ x)):(genVars ss)
genVars [] = []

renmVarsD :: [Declaration] -> [(String, String)] -> [Declaration]
renmVarsD ((Init v x):ds) vv' =
 let v' = (correspVar v vv') in
 (Init v' x):(renmVarsD ds vv')
renmVarsD [] _ = []

renmVarsK :: [Statement] -> [(String, String)] -> [Statement]
renmVarsK s ((v, v'):vs) = renmVarsK (renmVarsS s v v') vs
renmVarsK s [] = s

renmVarsS :: [Statement] -> String -> String -> [Statement]
renmVarsS ((Eval s1 e):ss) v v' = if (s1 == v)
 then (Eval v' (renmVarsE e v v')):(renmVarsS ss v v')
 else (Eval s1 (renmVarsE e v v')):(renmVarsS ss v v')
renmVarsS ((Wh f s):ss) v v' = (Wh (renmVarsF f v v') (renmVarsS s v v')):(renmVarsS ss v v')
renmVarsS ((IfE f s1 s2):ss) v v' = (IfE (renmVarsF f v v') (renmVarsS s1 v v') (renmVarsS s2 v v')):(renmVarsS ss v v')
renmVarsS ((Pr x):ss) v v' = if (x == v)
 then (Pr v'):(renmVarsS ss v v')
 else (Pr x):(renmVarsS ss v v')
renmVarsS ((Re x):ss) v v' = if (x == v)
 then (Re v'):(renmVarsS ss v v')
 else (Re x):(renmVarsS ss v v')
renmVarsS ((PrS s):ss) v v' = (PrS s):(renmVarsS ss v v')
renmVarsS [] _ _ = []

renmVarsE :: Expr -> String -> String -> Expr
renmVarsE (Add e t) v v' = Add (renmVarsE e v v') (renmVarsT t v v')
renmVarsE (Subtract e t) v v' = Subtract (renmVarsE e v v') (renmVarsT t v v')
renmVarsE (Trm t) v v' = Trm (renmVarsT t v v')

renmVarsT :: Term -> String -> String -> Term
renmVarsT (Multiply t f) v v' = Multiply (renmVarsT t v v') (renmVarsF f v v')
renmVarsT (Divide t f) v v' = Divide (renmVarsT t v v') (renmVarsF f v v')
renmVarsT (Fctr f) v v' = Fctr (renmVarsF f v v')

renmVarsF :: Factor -> String -> String -> Factor
renmVarsF (It x) _ _ = It x
renmVarsF (Flt x) _ _ = Flt x
renmVarsF (Str x) _ _ = Str x
renmVarsF (Var x) v v' = if (x == v) then (Var v') else (Var x)
renmVarsF (Expression e) v v' = Expression $ renmVarsE e v v'

correspVar :: String -> [(String, String)] -> String
correspVar v vv' = let (p, q) = (maybe ("", "") (\x -> x) (find (\(x, y) -> (x == v)) vv')) in q
 
renameVariables :: P -> P
renameVariables (Program d s) =
 let v = symbolTable d in
 let vv' = genVars v in
 (Program (renmVarsD d vv') (renmVarsK s vv'))



