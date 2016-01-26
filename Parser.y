{
module Parser
(
 parse,
 pmain
) where

import Scanner

}

%name parse
%tokentype { S_Tokens }
%error { parseError }

%left '+' '-'
%left '*' '/'

%token
 V { T_Variable }
 ':' { T_Declaration }
 '=' { T_Assignment }
 ';' { T_Termination }
 '{' { T_LBrace }
 '}' { T_RBrace }
 '(' { T_LParen }
 ')' { T_RParen }
 P { T_Print }
 R { T_Read }
 '+' { T_Add }
 '-' { T_Subtract }
 '*' { T_Multiply }
 '/' { T_Divide }
 TyI { T_TypeInt }
 TyF { T_TypeFloat }
 I { T_If }
 T { T_Then }
 E { T_Else }
 J { T_EndIf }
 W { T_While }
 D { T_Do }
 X { T_Done }
 ID { T_Identifier $$ }
 int { T_Int $$ }
 float { T_Float $$ }
 string { T_String $$ }
 S_Error { S_Error $$ }

%%

Prg : Decs Stmts { Program ($1, $2) }

Decs : Decs DecE { $1 ++ [$2] }
 | DecE { [$1] }
 | {- empty -} { [] }

Stmts : Stmts StmtE { $1 ++ [$2] }
 | StmtE { [$1] }
 | {- empty -} { [] }

StmtE : ID '=' Exp ';' { Eval $1 $3 }
 | P ID ';' { Pr $2 }
 | R ID ';' { Re $2 }
 | P string ';' { PrS $2 }
 | R string ';' { PrS $2 }
 | W int D Stmts X { Wh (It $2) $4 }
 | W ID D Stmts X { Wh (Var $2) $4 }
 | I int T Stmts E Stmts J { IfE (It $2) $4 $6 }
 | I ID T Stmts E Stmts J { IfE (Var $2) $4 $6 }
 | I int T Stmts J { IfE (It $2) $4 [] }
 | I ID T Stmts J { IfE (Var $2) $4 [] }
 | '{' Stmts '}' { B $2 }

DecE : V ID ':' TyI ';' { Init $2 1 }
 | V ID ':' TyF ';' { Init $2 2 }

Exp : Exp '+' Term { Add $1 $3 }
 | Exp '-' Term { Subtract $1 $3 }
 | Term { Trm $1 }

Term : Term '*' Factor  { Multiply $1 $3 }
 | Term '/' Factor { Divide $1 $3 }
 | Factor { Fctr $1 }

Factor : int { It $1 }
 | float { Flt $1 }
 | ID { Var $1 }
 | '(' Exp ')' { Expression $2 }


{

parseError :: [S_Tokens] -> a
parseError k = error ("Parse Error starting at Token : " ++ (show k))

data P = Program ([Declaration], [Statement])
 deriving Show

data Declaration = Init String Int
 deriving Show

data Statement =
 Eval String Expr
 | Pr String
 | Re String
 | PrS String
 | ReS String
 | Wh Factor [Statement]
 | IfE Factor [Statement] [Statement]
 | B [Statement]
 deriving Show

data Expr =
 Add Expr Term
 | Subtract Expr Term
 | Trm Term
 deriving Show

data Term =
 Multiply Term Factor
 | Divide Term Factor
 | Fctr Factor
 deriving Show

data Factor =
 It Int
 | Flt Float
 | Var String
 | Expression Expr
 deriving Show

pmain = do
 s <- getContents
 print (parse (scan s))

}


