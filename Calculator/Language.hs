module Language where

-- O tipo das expressoes

data Expr = Cte  Double
          | CteB Bool
          | Var  String
          | Bin  Op Expr Expr
          | BinR Op Expr
          deriving (Show)

data Op = Add   -- +
        | Sub   -- -
        | Mul   -- *
        | Div   -- /
        | Power -- ^
        | Neg   -- !
        | Con   -- ||
        | Dis   -- &&
        | Csign -- Operador unario para mudar o sinal
        | Igual -- =
        | Diff  -- !=
        | Maior -- >
        | Menor -- <
        | MaEq  -- >=
        | MeEq  -- <=
        deriving (Show)

-- The type of commands
-- TODO: read command: read <var>
-- TODO: block (sequence) command: { <c1> ; <c2> ; ... ; <cn> } (n >= 0)
-- TODO: conditional command: if <expr> then <cmd> else <cmd>
-- TODO: repetion command: while <expr> do <cmd>
data Cmd = Assign String Expr
           | Print Expr
         deriving (Show)
