module Main where

import Parser (parse)
import MyFunParser (cmd)
import Interpreter (execute, initialMemory)

main :: IO ()
main =
  do -- Faz a leitura da entrada do programa (input)
     input <- getContents
     -- realiza a analise sintaxica do programa
     case parse cmd input of
       -- Se suceder: executa o programa
       Just (program, "") ->
         do mem <- execute initialMemory program
            -- Imprime a memoria final para debuggar
            print mem
       -- Se falhar: Mostra uma mesagem de erro
       _ -> putStrLn "syntax error"
