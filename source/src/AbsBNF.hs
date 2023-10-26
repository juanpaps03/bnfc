-- File generated by the BNF Converter (bnfc 2.9.5).

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- | The abstract syntax of language BNF.

module AbsBNF where

import Prelude (Char, Double, Integer, String)
import qualified Prelude as C (Eq, Ord, Show, Read)
import qualified Data.String

data LGrammar = LGr [LDef]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data LDef = DefAll Def | DefSome [Ident] Def | LDefView [Ident]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Grammar = Grammar [Def]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Def
    = Rule Label Cat [Item]
    | Comment String
    | Comments String String
    | Internal Label Cat [Item]
    | Token Ident Reg
    | PosToken Ident Reg
    | Entryp [Ident]
    | Separator MinimumSize Cat String
    | Terminator MinimumSize Cat String
    | Coercions Ident Integer
    | Rules Ident [RHS]
    | Function Ident [Arg] Exp
    | Layout [String]
    | LayoutStop [String]
    | LayoutTop
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Item = Terminal String | NTerminal Cat
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Cat = ListCat Cat | IdCat Ident
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Label
    = LabNoP LabelId
    | LabP LabelId [ProfItem]
    | LabPF LabelId LabelId [ProfItem]
    | LabF LabelId LabelId
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data LabelId = Id Ident | Wild | ListE | ListCons | ListOne
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data ProfItem = ProfIt [IntList] [Integer]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data IntList = Ints [Integer]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Arg = Arg Ident
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Exp
    = Cons Exp Exp
    | App Ident [Exp]
    | Var Ident
    | LitInt Integer
    | LitChar Char
    | LitString String
    | LitDouble Double
    | List [Exp]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data RHS = RHS [Item]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data MinimumSize = MNonempty | MEmpty
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Reg
    = RSeq Reg Reg
    | RAlt Reg Reg
    | RMinus Reg Reg
    | RStar Reg
    | RPlus Reg
    | ROpt Reg
    | REps
    | RChar Char
    | RAlts String
    | RSeqs String
    | RDigit
    | RLetter
    | RUpper
    | RLower
    | RAny
  deriving (C.Eq, C.Ord, C.Show, C.Read)

newtype Ident = Ident String
  deriving (C.Eq, C.Ord, C.Show, C.Read, Data.String.IsString)

