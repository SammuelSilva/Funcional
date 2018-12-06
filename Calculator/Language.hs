module Language where

-- O tipo das expressoes

--unnary operator for changing the sign (-)
data Csign = Ctec Double
           | CExp Csign Expr

-- power (associação a direita)
data Power = Ctep Double
           | PExp Expr Power --Power de uma expressao

-- logical operators (&&, ||) e operacao de negacao (!)
data Logc = Ctel Bool
          | Varl String
          | Neg Logc
          | Con Logc Logc
          | Dis Logc Logc

--Operadores Relacionais (=, !=, >, >=, <, <=)
data Relt = Cter  Double
          | Varr  String
          | Exprc Expr
          | Igual Relt Relt -- =
          | Diff  Relt Relt -- !=
          | Maior Relt Relt -- >
          | Menor Relt Relt -- <
          | MaEq  Relt Relt -- >=
          | MeEq  Relt Relt -- <=
          deriving (Show)

data Expr = Cte Double
          | Var String
          | Bin Op Expr Expr
          deriving (Show)

data Op = Add
        | Sub
        | Mul
        | Div
        deriving (Show)

-- The type of commands
-- TODO: read command: read <var>
-- TODO: block (sequence) command: { <c1> ; <c2> ; ... ; <cn> } (n >= 0)
-- TODO: conditional command: if <expr> then <cmd> else <cmd>
-- TODO: repetion command: while <expr> do <cmd>
data Cmd = Assign String Expr
         | Print Expr
         deriving (Show)
