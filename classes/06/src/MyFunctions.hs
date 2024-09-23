module MyFunctions where

-- 1. Profissionais de saúde consideram que um indivíduo tem febre quando sua [temperatura corporal está acima de 37,8oC](https://drauziovarella.uol.com.br/doencas-e-sintomas/febre/). Escreva uma função `isFever :: Float -> Bool` que receba um valor de temperatura e retorne se o indivíduo tem febre ou não (atenção ao tipo do resultado!)


-- 2. Escreva uma função `checkFever :: [Float] -> [Float]` que, dada uma lista de temperaturas de indivíduos, selecione aquelas que representam febre. Resolva esta questão usando a função definida no exercício anterior.


-- 3. Escreva uma função `checkFever' :: [Float] -> [Float]` que resolva a questão anterior usando a sintaxe de função lambda (atenção ao apóstrofe no final do nome da função - em Haskell é comum usar isso para marcar diferentes versões de uma função).


-- 4. Crie uma função `itemize :: [String] -> [String]` que receba uma lista de strings e adicione tags HTML `<li>` e `</li>` antes e depois de cada string. Resolva esta questão usando lambda.


-- 5. Escreva uma função `bigCircles :: Float -> [Float] -> [Float]` que receba um número e uma lista de raios de círculos. Essa função deverá retornar somente aqueles raios de círculos cuja área seja maior que o número passado como primeiro argumento. Resolva esta questão usando lambda.


-- 6. Escreva uma função `quarentine :: [(String,Float)] -> [(String,Float)]` que receba uma lista de tuplas com nomes de pessoas e suas temperaturas corpóreas, e selecione aquelas tuplas que correspondem a pessoas com febre.


-- 7. Escreva uma função `agesIn :: [Int] -> Int -> [Int]` que receba uma lista de anos de nascimento de algumas pessoas e um ano de referência. Esta função deverá produzir uma lista com idades calculadas considerando o ano de referência (idades aproximadas, já que só consideram o ano, não a data completa de nascimento). Resolva esta questão usando lambda.


-- 8. Escreva uma função `superNames :: [String] -> [String]` que receba uma lista de nomes e adicione o prefixo "Super " às strings que começarem com a letra `A` (maiúscula), deixando as demais inalteradas. A lista resultante, portanto, terá a mesma quantidade de strings da lista original.


-- 9. Escreva uma função `onlyShorts :: [String] -> [String]` que receba uma lista de strings e retorne outra lista contendo somente as strings cujo tamanho seja menor que 5.

