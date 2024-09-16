module Main where
  
-- Eleva um numero ao quadrado
-- Aqui temos um comentario!
square :: Int -> Int
square x = x^2

-- Verifica se um numero eh par 
-- Ilustra uso de if/then/else para expressar condicional 
-- A funcao 'mod' retorna o resto da divisao inteira
-- A função seguinte apresenta uma versão melhorada
isEven :: Int -> Bool
isEven n = if mod n 2 == 0 then True else False

-- Versão melhorada da função anterior
-- A comparação == resulta True/False, por isso
-- o if-then-else é desnecessário neste caso
isEvenBetter :: Int -> Bool
isEvenBetter n = mod n 2 == 0

-- Gera um numero a partir de um caracter 
-- Note esta estrutura condicional em Haskell, usando'guardas' (|)
encodeMe :: Char -> Int
encodeMe c 
   | c == 'S'  = 0
   | c == 'N'  = 1
   | otherwise = undefined

-- Calcula o quadrado do primeiro elemento da lista
-- Note que '[Int]' designa uma lista de elementos do tipo Int 
squareFirst :: [Int] -> Int
squareFirst lis = (head lis)^2

-- Verifica se uma palavra tem mais de 10 caracteres
isLongWord :: String -> Bool -- isso é o mesmo que: isLongWord :: [Char] -> Bool
isLongWord s = length s > 10

main = do
  putStrLn "Teste abaixo as funções"
