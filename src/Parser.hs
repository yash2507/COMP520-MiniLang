{-# OPTIONS_GHC -w #-}
{-# OPTIONS -fglasgow-exts -cpp #-}
module Parser
(
 P(..),
 Declaration(..),
 Statement(..),
 Expr(..),
 Term(..),
 Factor(..),
 parse,
 pmain
) where

import Scanner
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11
	= HappyTerminal (S_Tokens)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11

action_0 (12#) = happyShift action_4
action_0 (4#) = happyGoto action_5
action_0 (5#) = happyGoto action_2
action_0 (8#) = happyGoto action_3
action_0 x = happyTcHack x happyReduce_3

action_1 (12#) = happyShift action_4
action_1 (5#) = happyGoto action_2
action_1 (8#) = happyGoto action_3
action_1 x = happyTcHack x happyFail

action_2 (18#) = happyShift action_10
action_2 (19#) = happyShift action_11
action_2 (27#) = happyShift action_12
action_2 (31#) = happyShift action_13
action_2 (34#) = happyShift action_14
action_2 (6#) = happyGoto action_8
action_2 (7#) = happyGoto action_9
action_2 x = happyTcHack x happyReduce_5

action_3 (12#) = happyShift action_4
action_3 (5#) = happyGoto action_7
action_3 (8#) = happyGoto action_3
action_3 x = happyTcHack x happyReduce_3

action_4 (34#) = happyShift action_6
action_4 x = happyTcHack x happyFail

action_5 (39#) = happyAccept
action_5 x = happyTcHack x happyFail

action_6 (13#) = happyShift action_24
action_6 x = happyTcHack x happyFail

action_7 x = happyTcHack x happyReduce_2

action_8 x = happyTcHack x happyReduce_1

action_9 (18#) = happyShift action_10
action_9 (19#) = happyShift action_11
action_9 (27#) = happyShift action_12
action_9 (31#) = happyShift action_13
action_9 (34#) = happyShift action_14
action_9 (6#) = happyGoto action_23
action_9 (7#) = happyGoto action_9
action_9 x = happyTcHack x happyReduce_5

action_10 (34#) = happyShift action_21
action_10 (37#) = happyShift action_22
action_10 x = happyTcHack x happyFail

action_11 (34#) = happyShift action_20
action_11 x = happyTcHack x happyFail

action_12 (34#) = happyShift action_18
action_12 (35#) = happyShift action_19
action_12 x = happyTcHack x happyFail

action_13 (34#) = happyShift action_16
action_13 (35#) = happyShift action_17
action_13 x = happyTcHack x happyFail

action_14 (14#) = happyShift action_15
action_14 x = happyTcHack x happyFail

action_15 (16#) = happyShift action_38
action_15 (21#) = happyShift action_39
action_15 (34#) = happyShift action_40
action_15 (35#) = happyShift action_41
action_15 (36#) = happyShift action_42
action_15 (37#) = happyShift action_43
action_15 (9#) = happyGoto action_35
action_15 (10#) = happyGoto action_36
action_15 (11#) = happyGoto action_37
action_15 x = happyTcHack x happyFail

action_16 (32#) = happyShift action_34
action_16 x = happyTcHack x happyFail

action_17 (32#) = happyShift action_33
action_17 x = happyTcHack x happyFail

action_18 (28#) = happyShift action_32
action_18 x = happyTcHack x happyFail

action_19 (28#) = happyShift action_31
action_19 x = happyTcHack x happyFail

action_20 (15#) = happyShift action_30
action_20 x = happyTcHack x happyFail

action_21 (15#) = happyShift action_29
action_21 x = happyTcHack x happyFail

action_22 (15#) = happyShift action_28
action_22 x = happyTcHack x happyFail

action_23 x = happyTcHack x happyReduce_4

action_24 (24#) = happyShift action_25
action_24 (25#) = happyShift action_26
action_24 (26#) = happyShift action_27
action_24 x = happyTcHack x happyFail

action_25 (15#) = happyShift action_59
action_25 x = happyTcHack x happyFail

action_26 (15#) = happyShift action_58
action_26 x = happyTcHack x happyFail

action_27 (15#) = happyShift action_57
action_27 x = happyTcHack x happyFail

action_28 x = happyTcHack x happyReduce_9

action_29 x = happyTcHack x happyReduce_7

action_30 x = happyTcHack x happyReduce_8

action_31 (18#) = happyShift action_10
action_31 (19#) = happyShift action_11
action_31 (27#) = happyShift action_12
action_31 (31#) = happyShift action_13
action_31 (34#) = happyShift action_14
action_31 (6#) = happyGoto action_56
action_31 (7#) = happyGoto action_9
action_31 x = happyTcHack x happyReduce_5

action_32 (18#) = happyShift action_10
action_32 (19#) = happyShift action_11
action_32 (27#) = happyShift action_12
action_32 (31#) = happyShift action_13
action_32 (34#) = happyShift action_14
action_32 (6#) = happyGoto action_55
action_32 (7#) = happyGoto action_9
action_32 x = happyTcHack x happyReduce_5

action_33 (18#) = happyShift action_10
action_33 (19#) = happyShift action_11
action_33 (27#) = happyShift action_12
action_33 (31#) = happyShift action_13
action_33 (34#) = happyShift action_14
action_33 (6#) = happyGoto action_54
action_33 (7#) = happyGoto action_9
action_33 x = happyTcHack x happyReduce_5

action_34 (18#) = happyShift action_10
action_34 (19#) = happyShift action_11
action_34 (27#) = happyShift action_12
action_34 (31#) = happyShift action_13
action_34 (34#) = happyShift action_14
action_34 (6#) = happyGoto action_53
action_34 (7#) = happyGoto action_9
action_34 x = happyTcHack x happyReduce_5

action_35 (15#) = happyShift action_50
action_35 (20#) = happyShift action_51
action_35 (21#) = happyShift action_52
action_35 x = happyTcHack x happyFail

action_36 (22#) = happyShift action_48
action_36 (23#) = happyShift action_49
action_36 x = happyTcHack x happyReduce_21

action_37 x = happyTcHack x happyReduce_24

action_38 (16#) = happyShift action_38
action_38 (21#) = happyShift action_39
action_38 (34#) = happyShift action_40
action_38 (35#) = happyShift action_41
action_38 (36#) = happyShift action_42
action_38 (37#) = happyShift action_43
action_38 (9#) = happyGoto action_47
action_38 (10#) = happyGoto action_36
action_38 (11#) = happyGoto action_37
action_38 x = happyTcHack x happyFail

action_39 (35#) = happyShift action_44
action_39 (36#) = happyShift action_45
action_39 (37#) = happyShift action_46
action_39 x = happyTcHack x happyFail

action_40 x = happyTcHack x happyReduce_31

action_41 x = happyTcHack x happyReduce_25

action_42 x = happyTcHack x happyReduce_26

action_43 x = happyTcHack x happyReduce_27

action_44 x = happyTcHack x happyReduce_28

action_45 x = happyTcHack x happyReduce_29

action_46 x = happyTcHack x happyReduce_30

action_47 (17#) = happyShift action_70
action_47 (20#) = happyShift action_51
action_47 (21#) = happyShift action_52
action_47 x = happyTcHack x happyFail

action_48 (16#) = happyShift action_38
action_48 (21#) = happyShift action_39
action_48 (34#) = happyShift action_40
action_48 (35#) = happyShift action_41
action_48 (36#) = happyShift action_42
action_48 (37#) = happyShift action_43
action_48 (11#) = happyGoto action_69
action_48 x = happyTcHack x happyFail

action_49 (16#) = happyShift action_38
action_49 (21#) = happyShift action_39
action_49 (34#) = happyShift action_40
action_49 (35#) = happyShift action_41
action_49 (36#) = happyShift action_42
action_49 (37#) = happyShift action_43
action_49 (11#) = happyGoto action_68
action_49 x = happyTcHack x happyFail

action_50 x = happyTcHack x happyReduce_6

action_51 (16#) = happyShift action_38
action_51 (21#) = happyShift action_39
action_51 (34#) = happyShift action_40
action_51 (35#) = happyShift action_41
action_51 (36#) = happyShift action_42
action_51 (37#) = happyShift action_43
action_51 (10#) = happyGoto action_67
action_51 (11#) = happyGoto action_37
action_51 x = happyTcHack x happyFail

action_52 (16#) = happyShift action_38
action_52 (21#) = happyShift action_39
action_52 (34#) = happyShift action_40
action_52 (35#) = happyShift action_41
action_52 (36#) = happyShift action_42
action_52 (37#) = happyShift action_43
action_52 (10#) = happyGoto action_66
action_52 (11#) = happyGoto action_37
action_52 x = happyTcHack x happyFail

action_53 (33#) = happyShift action_65
action_53 x = happyTcHack x happyFail

action_54 (33#) = happyShift action_64
action_54 x = happyTcHack x happyFail

action_55 (29#) = happyShift action_62
action_55 (30#) = happyShift action_63
action_55 x = happyTcHack x happyFail

action_56 (29#) = happyShift action_60
action_56 (30#) = happyShift action_61
action_56 x = happyTcHack x happyFail

action_57 x = happyTcHack x happyReduce_18

action_58 x = happyTcHack x happyReduce_17

action_59 x = happyTcHack x happyReduce_16

action_60 (18#) = happyShift action_10
action_60 (19#) = happyShift action_11
action_60 (27#) = happyShift action_12
action_60 (31#) = happyShift action_13
action_60 (34#) = happyShift action_14
action_60 (6#) = happyGoto action_72
action_60 (7#) = happyGoto action_9
action_60 x = happyTcHack x happyReduce_5

action_61 x = happyTcHack x happyReduce_14

action_62 (18#) = happyShift action_10
action_62 (19#) = happyShift action_11
action_62 (27#) = happyShift action_12
action_62 (31#) = happyShift action_13
action_62 (34#) = happyShift action_14
action_62 (6#) = happyGoto action_71
action_62 (7#) = happyGoto action_9
action_62 x = happyTcHack x happyReduce_5

action_63 x = happyTcHack x happyReduce_15

action_64 x = happyTcHack x happyReduce_10

action_65 x = happyTcHack x happyReduce_11

action_66 (22#) = happyShift action_48
action_66 (23#) = happyShift action_49
action_66 x = happyTcHack x happyReduce_20

action_67 (22#) = happyShift action_48
action_67 (23#) = happyShift action_49
action_67 x = happyTcHack x happyReduce_19

action_68 x = happyTcHack x happyReduce_23

action_69 x = happyTcHack x happyReduce_22

action_70 x = happyTcHack x happyReduce_32

action_71 (30#) = happyShift action_74
action_71 x = happyTcHack x happyFail

action_72 (30#) = happyShift action_73
action_72 x = happyTcHack x happyFail

action_73 x = happyTcHack x happyReduce_12

action_74 x = happyTcHack x happyReduce_13

happyReduce_1 = happySpecReduce_2  4# happyReduction_1
happyReduction_1 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1 happy_var_2
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5# happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1] ++ happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_0  5# happyReduction_3
happyReduction_3  =  HappyAbsSyn5
		 ([]
	)

happyReduce_4 = happySpecReduce_2  6# happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1] ++ happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_0  6# happyReduction_5
happyReduction_5  =  HappyAbsSyn6
		 ([]
	)

happyReduce_6 = happyReduce 4# 7# happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (T_Identifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Eval happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_3  7# happyReduction_7
happyReduction_7 _
	(HappyTerminal (T_Identifier happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Pr happy_var_2
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  7# happyReduction_8
happyReduction_8 _
	(HappyTerminal (T_Identifier happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Re happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  7# happyReduction_9
happyReduction_9 _
	(HappyTerminal (T_String happy_var_2))
	_
	 =  HappyAbsSyn7
		 (PrS happy_var_2
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 5# 7# happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (T_Int happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Wh (It happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 5# 7# happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (T_Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Wh (Var happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 7# 7# happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (T_Int happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (IfE (It happy_var_2) happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 7# 7# happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (T_Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (IfE (Var happy_var_2) happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 5# 7# happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (T_Int happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (IfE (It happy_var_2) happy_var_4 []
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 5# 7# happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (T_Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (IfE (Var happy_var_2) happy_var_4 []
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 5# 8# happyReduction_16
happyReduction_16 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (T_Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Init happy_var_2 1
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 5# 8# happyReduction_17
happyReduction_17 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (T_Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Init happy_var_2 2
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 5# 8# happyReduction_18
happyReduction_18 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (T_Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Init happy_var_2 3
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_3  9# happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Add happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  9# happyReduction_20
happyReduction_20 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Subtract happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  9# happyReduction_21
happyReduction_21 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Trm happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  10# happyReduction_22
happyReduction_22 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Multiply happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  10# happyReduction_23
happyReduction_23 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Divide happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  10# happyReduction_24
happyReduction_24 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Fctr happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  11# happyReduction_25
happyReduction_25 (HappyTerminal (T_Int happy_var_1))
	 =  HappyAbsSyn11
		 (It happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  11# happyReduction_26
happyReduction_26 (HappyTerminal (T_Float happy_var_1))
	 =  HappyAbsSyn11
		 (Flt happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  11# happyReduction_27
happyReduction_27 (HappyTerminal (T_String happy_var_1))
	 =  HappyAbsSyn11
		 (Str happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  11# happyReduction_28
happyReduction_28 (HappyTerminal (T_Int happy_var_2))
	_
	 =  HappyAbsSyn11
		 (It (- happy_var_2)
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  11# happyReduction_29
happyReduction_29 (HappyTerminal (T_Float happy_var_2))
	_
	 =  HappyAbsSyn11
		 (Flt (- happy_var_2)
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  11# happyReduction_30
happyReduction_30 (HappyTerminal (T_String happy_var_2))
	_
	 =  HappyAbsSyn11
		 (Str (reverse happy_var_2)
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  11# happyReduction_31
happyReduction_31 (HappyTerminal (T_Identifier happy_var_1))
	 =  HappyAbsSyn11
		 (Var happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  11# happyReduction_32
happyReduction_32 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Expression happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 39# 39# notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	T_Variable -> cont 12#;
	T_Declaration -> cont 13#;
	T_Assignment -> cont 14#;
	T_Termination -> cont 15#;
	T_LParen -> cont 16#;
	T_RParen -> cont 17#;
	T_Print -> cont 18#;
	T_Read -> cont 19#;
	T_Add -> cont 20#;
	T_Subtract -> cont 21#;
	T_Multiply -> cont 22#;
	T_Divide -> cont 23#;
	T_TypeInt -> cont 24#;
	T_TypeFloat -> cont 25#;
	T_TypeString -> cont 26#;
	T_If -> cont 27#;
	T_Then -> cont 28#;
	T_Else -> cont 29#;
	T_EndIf -> cont 30#;
	T_While -> cont 31#;
	T_Do -> cont 32#;
	T_Done -> cont 33#;
	T_Identifier happy_dollar_dollar -> cont 34#;
	T_Int happy_dollar_dollar -> cont 35#;
	T_Float happy_dollar_dollar -> cont 36#;
	T_String happy_dollar_dollar -> cont 37#;
	S_Error happy_dollar_dollar -> cont 38#;
	_ -> happyError' (tk:tks)
	}

happyError_ 39# tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = return
    (<*>) = ap
instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(S_Tokens)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

parse tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [S_Tokens] -> a
parseError (k:kl) = error (show k)
parseError _ = error ("Parse Error")

data P = Program [Declaration] [Statement]
 deriving Show

data Declaration = Init String Int
 deriving Show

data Statement =
 Eval String Expr
 | Pr String
 | Re String
 | PrS String
 | Wh Factor [Statement]
 | IfE Factor [Statement] [Statement]
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
 | Str String
 | Var String
 | Expression Expr
 deriving Show

pmain = do
 s <- getContents
 print (parse (scan s))
{-# LINE 1 "templates/GenericTemplate.hs" #-}


















-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 







-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif






















infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 1#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 1# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j ) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Happy_GHC_Exts.Int# ->                    -- token number
         Happy_GHC_Exts.Int# ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 1# tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 1# tk st sts stk
     = happyFail 1# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n ((_):(t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (1# is the error token)

-- parse error if we are in recovery and we fail again
happyFail 1# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  1# tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action 1# 1# tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action 1# 1# tk (HappyState (action)) sts ( (HappyErrorToken (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.

