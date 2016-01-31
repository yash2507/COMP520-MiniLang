{
module Scanner
(
 S_Tokens(..),
 scan,
 smain
) where
}

%wrapper "basic" -- macros for use in the token definitions

$digitWo0 = [1-9] -- digits without Zero
$digitW0 = [0-9]  -- digits with 0
$alpha = [a-zA-Z \_] -- alphabetic characters
$stringChars = [a-zA-Z \_ \, \. \! \?]

tokens :-

 $white+ ;
 [\#] .* ;
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
 string { \s -> T_TypeString }
 $digitW0 { \s -> T_Int (read s) }
 $digitWo0 $digitW0+ { \s -> T_Int (read s) }
 [\.] $digitW0+ { \s -> T_Float (read ('0':s)) } -- For floats that are of form '. D+'
 $digitWo0 $digitW0* [\.] $digitW0* { \s -> T_Float (read (s++['0'])) } -- For floats that are of the form 'D+ . D*'
 0 [\.] $digitW0* { \s -> T_Float (read (s++['0'])) } -- For floats that are of the form '0. D*'
 [\"] $stringChars* [\"] { \s -> T_String s }
 [\=] { \s -> T_Assignment }
 [\+] { \s -> T_Add }
 [\-] { \s -> T_Subtract }
 [\*] { \s -> T_Multiply }
 [\/] { \s -> T_Divide }
 [\(] { \s -> T_LParen }
 [\)] { \s -> T_RParen }
 $alpha [$alpha $digitW0 \’]* { \s -> T_Identifier s }
 . { \s -> S_Error s }

{
-- Each action has type :: String -> S_Tokens

-- The token type:
data S_Tokens =
 T_Variable |
 T_Declaration |
 T_Assignment |
 T_Termination |
 T_LParen |
 T_RParen |
 T_Print |
 T_Read |
 T_Add |
 T_Subtract |
 T_Multiply |
 T_Divide |
 T_TypeInt |
 T_TypeFloat |
 T_TypeString |
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
 T_String String |
 T_Comment String |
 S_Error String
 deriving (Eq,Show)

scan t = alexScanTokens t

smain = do
 s <- getContents
 print (scan s)
}


