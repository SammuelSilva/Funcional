module Interpreter where

import Language

-- Tipo para representar a memoria (associacao entre os noems das variaveis e os valores)
type Memory = [(String, Double)]

-- memoria inicia, vazia
initialMemory :: Memory
initialMemory = []

-- validacao da expressao
eval :: Memory -> Expr -> Double
eval _ (Cte x) = x
eval m (Var v) =
  case lookup v m of
    Just x -> x
    Nothing -> 0
eval m (Bin op x y) =
  case op of
    Add -> vx + vy
    Sub -> vx - vy
    Mul -> vx * vy
    Div -> vx / vy
  where
    vx = eval m x
    vy = eval m y

-- Comando para realizar a execucao
execute :: Memory -> Cmd -> IO Memory
execute m (Assign v e) = return ((v, eval m e) : m)
execute m (Print e) = do print (eval m e)
                         return m
