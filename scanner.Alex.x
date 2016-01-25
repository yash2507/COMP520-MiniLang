{
module Main (main) where
}

%wrapper "basic" -- macros for use in the token definitions

$digitWo0 = [1-9] -- digits without Zero
$digitW0 = [0-9]  -- digits with 0
$alpha = [a-zA-Z] -- alphabetic characters

tokens :-

 $white+ ;
 [\#] .* { \s -> T_Comment s }
 var { \s -> T_Variable }
 [\:] { \s -> T_Declaration }
 [\;] { \s -> T_Termination }
 print { \s -> T_Print }
 read { \s -> T_Read }
 if { \s -> T_If }
 then { \s -> T_Then }
 else { \s -> T_Else }
 endif { \s -> T_EndIf }
 while { \s -> T_While }
 do { \s -> T_Do }
 done { \s -> T_Done }
 int { \s -> T_TypeInt }
 float { \s -> T_TypeFloat }
 0 | $digitWo0 $digitW0* { \s -> T_Int (read s) }
 [\.] $digitW0+ { \s -> T_Float (read ('0':s)) } -- For floats that are of form . D+
 $digitW0+ [\.] $digitW0* { \s -> T_Float (read s) } -- For floats that are of form D+ . D*
 $digitWo0 $digitW0* [\.] { \s -> T_Float (read (s++['0'])) }
 [\=] { \s -> T_Assignment }
 [\+] { \s -> T_Add }
 [\-] { \s -> T_Subtract }
 [\*] { \s -> T_Multiply }
 [\/] { \s -> T_Divide }
 $alpha [$alpha $digitW0 \_ \’]* { \s -> T_Identifier s }
-- .+ { \s -> ScanError s }

{
-- Each action has type :: String -> Token

-- The token type:
data Token =
 T_Variable |
 T_Declaration |
 T_Assignment |
 T_Termination |
 T_Print |
 T_Read |
 T_Add |
 T_Subtract |
 T_Multiply |
 T_Divide |
 T_TypeInt |
 T_TypeFloat |
 T_If |
 T_Then |
 T_Else |
 T_EndIf |
 T_While |
 T_Do |
 T_Done |
 T_Identifier String |
 T_Int Int |
 T_Float Float |
 T_Comment String |
 ScanError String
 deriving (Eq,Show)

main = do
 s <- getContents
 print (alexScanTokens s)
}


