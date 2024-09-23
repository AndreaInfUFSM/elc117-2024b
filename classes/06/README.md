<!--
author:   Andrea Charão

email:    andrea@inf.ufsm.br

version:  0.0.1

language: PT-BR

narrator: Brazilian Portuguese Female

comment:  Material de apoio para a disciplina
          ELC117 - Paradigmas de Programação
          da Universidade Federal de Santa Maria

translation: English  translations/English.md

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

-->

<!--
nvm use v14.21.1
liascript-devserver --input README.md --port 3001 --live
https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2023b/master/classes/06/README.md
-->

[![LiaScript](https://raw.githubusercontent.com/LiaScript/LiaScript/master/badges/course.svg)](https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/main/classes/06/README.md)


# Programação Funcional em Haskell (2)




> Este material é uma introdução à **programação funcional** em Haskell.
>
> O conteúdo tem partes interativas e pode ser visualizado de vários modos usando as opções no topo da página.


## Continuando com funções de alta ordem

- São funções que recebem outras funções como argumento e/ou produzem funções como resultado
- Exemplos: `map`, `filter`, `foldr`, `zipWith`, entre muitas outras.
- Recurso/conceito característico da programação funcional


![Funções de alta ordem são poderosas! Para ilustrar isso, esta imagem mostra 3 super-heróis da série Power Rangers.](img/PR22_3.png "Imagine aqui seu time favorito de super-herois!")



### Função `map`

> Aplica uma dada função a cada elemento de uma lista, construindo outra lista 

```haskell
ghci> f x = x + 1
ghci> map f [0, 5, 8, 3, 2, 1]
[1,6,9,4,3,2]
```

Veja mais sobre `map` em outras linguagens: <a href="https://www.wikiwand.com/en/Map_(higher-order_function)">https://www.wikiwand.com/en/Map_(higher-order_function)</a>

#### Visualize
![Imagem animada mostrando a função map aplicando a função f(x) = x + 1 a uma lista contendo os valores 0, 5, 8, 3, 2, 1. Internamente, map percorre a lista como num laço, do primeiro ao último elemento. A cada iteração desse "laço imaginário", temos um novo valor de x.  Primeiro x = 0 e  f(x) = 0 + 1, o que resulta no valor 1 na primeira posição da lista resultante. Isso continua para x = 5, x = 8, e assim por diante, compondo a lista resultante, que terá os valores 1, 6, 9, 4, 3, 2.](img/Mapping-steps-loillibe-new.gif "Fonte: https://upload.wikimedia.org/wikipedia/commons/0/06/Mapping-steps-loillibe-new.gif")





              --{{0}}--
A imagem animada ao lado mostra a função `map` aplicando a função f(x) = x + 1 a uma lista contendo os valores 0, 5, 8, 3, 2, 1. Internamente (por dentro do `map`), a lista é percorrida iterativamente, como num laço, do primeiro ao último elemento. A cada iteração desse "laço imaginário", temos um novo valor de x.  Primeiro, x = 0  e  f(x) = 0 + 1, o que resulta no valor 1 na primeira posição da lista resultante. Isso continua para x = 5, x = 8, e assim por diante, compondo pouco a pouco a lista resultante, que terá os valores 1, 6, 9, 4, 3, 2.

### Aplicação parcial / currying

> Podemos usar aplicação parcial junto com funções de alta ordem

```haskell
ghci> add x y = x + y
ghci> map (add 2) [0, 5, 8, 3, 2, 1]
[1,6,9,4,3,2]
```

Isso é possível porque Haskell implementa um  conceito avançado em programação, chamado de [*currying*](https://en.wikipedia.org/wiki/Currying): basicamente, uma função com múltiplos argumentos equivale a múltiplas funções com um argumento.


Veja mais sobre isso em: https://youtu.be/m12c99qgHBU

??[](https://youtu.be/m12c99qgHBU)


### Função `filter`

> Aplica uma dada função booleana (condição) a cada elemento de uma lista, construindo outra lista contendo somente os elementos que satisfazem a condição

```haskell
ghci> f x = mod x 2 == 0
ghci> filter f [0, 5, 8, 3, 2, 1]
[0,8,2]
```

Veja mais sobre `filter` em outras linguagens: <a href="https://www.wikiwand.com/en/Filter(higher-order_function)">https://www.wikiwand.com/en/Filter_(higher-order_function)</a>


#### Visualize

![Imagem animada mostrando a função filter aplicando a função f x = mod x 2 == 0 a uma lista contendo os valores 0, 5, 8, 3, 2, 1. Note que a função f faz um teste de condição com o operador `==`, portanto é uma função que retorna True ou False. A função mod calcula o resto de uma divisão, então na verdade f x está verificando se um número é par (resto 0 na divisão por 2) ou ímpar. Internamente (por dentro do `filter`), a lista é percorrida iterativamente, como num laço, do primeiro ao último elemento. A cada iteração, `filter` varia o valor de x que serve de argumento para f. Se o resultado de f para um dado x for True, esse valor de x será inserido na lista resultante. Em caso contrário, não será inserido.  Portanto, a lista resultante neste exemplo terá os valores 0, 8, 2, pois são os casos em que f x resulta True. Os elementos 5, 3 e 1 resultam False quando testados com a função f, por isso não fazem parte da lista resultante.](https://upload.wikimedia.org/wikipedia/commons/5/52/Filter-steps-loillierbe.gif "Fonte: https://upload.wikimedia.org/wikipedia/commons/5/52/Filter-steps-loillierbe.gif")




              --{{0}}--
A imagem animada ao lado mostra a função filter aplicando a função f x = mod x 2 == 0 a uma lista contendo os valores 0, 5, 8, 3, 2, 1. Note que a função f faz um teste de condição com o operador `==`, portanto é uma função que retorna True ou False. A função mod calcula o resto de uma divisão, então na verdade f x está verificando se um número é par (resto 0 na divisão por 2) ou ímpar. Internamente (por dentro do `filter`), a lista é percorrida iterativamente, como num laço, do primeiro ao último elemento. A cada iteração, `filter` varia o valor de x que serve de argumento para f. Se o resultado de f para um dado x for True, esse valor de x será inserido na lista resultante. Em caso contrário, não será inserido.  Portanto, a lista resultante neste exemplo terá os valores 0, 8, 2, pois são os casos em que f x resulta True. Os elementos 5, 3 e 1 resultam False quando testados com a função f, por isso não fazem parte da lista resultante.


### Exemplo com map e filter

> O que faz o programa abaixo?

``` haskell
import Data.Char
import Text.Printf

isVowel :: Char -> Bool
isVowel c = elem c "aeiouAEIOU"

-- Função principal
main = do
  print "Please type a word:"
  -- putStrLn "Please type a word:"
  word <- getLine
  let nv = length (filter isVowel word)
      msg1 = word ++ " in uppercase is " ++ map toUpper word
      msg2 = word ++ " has " ++ show nv ++ " vowels"
      msg3 = (printf "%s has %d vowels" word nv) :: String
  print msg1
  print msg2
  print msg3 
```

 --{{0}}--
Observações sobre este código:

 --{{0}}--
Usa `import` dos módulos`Data.Char` e `Text.Printf` para usar as funções `toUpper` e `printf`, respectivamente

 --{{0}}--
Tem uma função `main` que possui um bloco de ações (`do`)

 --{{0}}--
Usa `getLine` para ler uma linha (`String`) da entrada padrão

 --{{0}}--
Usa `let` para definir expressões que serão usadas depois

 --{{0}}--
Usa `++` para concatenar Strings (que são listas de Char)

 --{{0}}--
Usa `show` para obter a representação em `String` de um dado numérico

 --{{0}}--
Ilustra o uso da função `printf`, que tem o mesmo nome da famosa função em C, mas neste caso se comporta como `sprintf` do C (resultado é armazenado, não mostrado).


### Funções `foldr1`/`foldl1`

- Aplicam função de 2 argumentos sucessivamente aos itens da lista, produzindo um só valor 
- `foldr1` inicia pela direita da lista, `foldl1` inicia pela esquerda
- Também chamadas de reduções (`reduce`) em outras linguagens

```haskell
ghci> f x y = x + y
ghci> foldl1 f [2, 3, 4]
9
ghci> foldl1 f [47, 11, 42, 13]
113
```

> O que acontece se fizermos subtração em vez de adição? O resultado será o mesmo começando da esquerda ou da direita?

Veja mais sobre folds/reduce em outras linguagens: <a href="https://www.wikiwand.com/en/Reduce(higher-order_function)">https://www.wikiwand.com/en/Reduce_(higher-order_function)</a>


              --{{0}}--
As funções que fazem folds recebem como argumento uma função que opera sobre pares de argumentos de uma lista, diferentemente de map ou filter que operam sobre um argumento somente. 

              --{{0}}--
Por dentro dos folds, também há um processamento iterativo das listas, sendo que a cada iteração há 2 valores envolvidos: um valor anterior e um novo valor. 

              --{{0}}--
No exemplo com foldl1 ao lado, começamos pela esquerda da lista com os valores 2 e 3, que serão os valores de x e y para f. Isso resultará no valor 5. Na próxima iteração, esse valor 5 será o valor de x para f, e o valor de y será 4 (próximo elemento da lista). O resultado final será 5 (resultado anterior) + 4 (elemento da lista), que é 9.

              --{{0}}--
Se trocarmos foldl1 por foldr1, esse processamento comecará pelo elemento mais à direita (o último da lista). No caso da função f, que faz uma adição, o resultado será o mesmo começando da esquerda ou da direita. 

              --{{0}}--
E se fizermos subtração em vez de adição? O resultado será o mesmo começando da esquerda ou da direita?


### Função `zipWith`

- Recebe uma função e duas listas como argumento
- A função deve receber 2 argumentos 
- Aplica a função a cada par de elementos correspondentes nas 2 listas recebidas, produzindo outra lista
- Tamanho da lista resultante é limitado pela menor lista recebida (restante dos elementos ignorados)

```haskell
ghci> add x y = x + y
ghci> zipWith add [10,11,12] [1,2,3]
[11,13,15]
ghci> zipWith add [10,11,12] [1,2]
[11,13]
ghci> zipWith (-) [10,11,12] [1,2]
[9,9]
ghci> zipWith (+) [10,11,12] [3,3]
[13,14]
```

              --{{0}}--
No exemplo, primeiro é definida a função `add`, que recebe 2 argumentos e produz a soma deles. 


              --{{0}}--
Depois, a função `zipWith` vai aplicar `add` a pares de elementos das 2 listas, ou seja, vai calcular: `add 10 1`, `add 11 2`, `add 12 3`, criando a lista resultante `[11,13,15]`. 


              --{{0}}--
A cada par de elementos processados, imagine que `zipWith` estará chamando `add` com diferentes valores para seus argumentos `x` e `y`.


              --{{0}}--
Os 2 últimos exemplos são versões abreviadas, usando operadores de subtração e adição, que recebem 2 argumentos. 


              --{{0}}--
Imagine que o sinal de subtração ou de adição é um "nome abreviado" de uma função.  Em Haskell, `10 - 1` equivale a `((-) 10 1)`.


### Quiz 

1. Se você aplicar `map` a uma lista de 5 elementos, o resultado pode ser uma lista vazia?

   - [( )] Sim
   - [(x)] Não
     ******************************************************

     Não pode, porque map produz um novo elemento para cada elemento da lista de entrada.

     *******************************************************   



 


2. A função `map` pode ser aplicada como no exemplo abaixo?

   ```
   add x y = x + y
   map add [1,2,3]
   ```

   - [( )] Sim
   - [(x)] Não
     ******************************************************

     Não pode, porque `map` espera uma função que possa ser aplicada a cada elemento da lista, um de cada vez. A função deve precisar de somente um argumento, que virá da lista.

     *******************************************************  


3. A função `map` pode ser aplicada como no exemplo abaixo?

   ```
   add x y = x + y
   map (add 2) [1,2,3]
   ```

   - [(x)] Sim
   - [( )] Não
     ******************************************************

     Sim, porque neste caso passamos uma aplicação parcial da função `add`, que já tem o primeiro argumento constante.

     *******************************************************     



4. A função `filter` pode produzir uma lista de tipo diferente da lista passada como argumento?

   - [( )] Sim
   - [(x)] Não
     ******************************************************

     Não, a função `filter` apenas seleciona elementos de uma dada lista, não produz novos valores com outros tipos.

     *******************************************************      


5. A função `foldr1` pode receber como argumento a função `sqrt`?

   - [( )] Sim
   - [(x)] Não
     ******************************************************

     Não, porque a função `sqrt` recebe apenas um argumento, mas a função foldr1 aplica uma função que recebe 2 argumentos.

     *******************************************************     


6. A função `zipWith` pode receber como argumento uma função `subtrai :: Int -> Int -> Int`?

   - [(x)] Sim
   - [( )] Não
     ******************************************************

     Sim, porque `subtrai` recebe 2 argumentos. Esses argumentos serão provenientes das listas processadas com `zipWith`, que deverão ser do tipo `[Int]` para compatibilidade com `subtrai`.

     *******************************************************     



## Funções anônimas (lambda)


- Expressam funções sem nome, ou seja, anônimas

  ``` haskell
  ghci> (\x -> x^2) 2
  4
  ```

- Também conhecidas como funções *lambda* 
- Usadas como:

   - argumento para funções de alta ordem
   - resultado de função de alta ordem






### Sintaxe geral

Sintaxe geral para definir uma função lambda:

`(\arg1 ... argn -> expressão-usando-argumentos)`

> O símbolo `\` (contrabarra) lembra um lambda no alfabeto grego, né? 

Exemplos no ambiente interativo GHCi:

Sem lambda

``` haskell
ghci> square x = x * x
ghci> map square [1,2,3]
[1,4,9]
```

Com lambda

``` haskell
ghci> map (\x -> x * x) [1,2,3]
[1,4,9]
```

### Reescrevendo funções com lambda



| Sem lambda | Com lambda |
| ---- | --------- | 
| `add2 x = x + 2` | `(\x -> x + 2)` | 
| `map add2 [1,2]` | `map (\x -> x + 2) [1,2]`  | 
| `gt60 a = a > 60` | `(\a -> a > 60)` | 
| `filter gt60 [10,65]` | `filter (\a -> a > 60) [10,65]` |
| `add x y = x + y` | `(\x y -> x + y)` |
| `foldr1 add [1,2]` | `foldr1 (\x y -> x + y) [1,2]` |
| `zipWith add [1,2] [3,4]` | `zipWith (\x y -> x + y) [1,2] [3,4]` | 


### Em outras linguagens

- Funções lambda fazem parte de muitas linguagens de programação
- Veja mais em: https://en.wikipedia.org/wiki/Anonymous_function




### Quiz


1. Considere este código:

   ```haskell
   square :: Int -> Int
   square x = x^2
  
   squareAll :: [Int] -> [Int]
   squareAll lis = map square lis 
   ```

   Qual será o resultado de: 
   
   `head (squareAll [1,2,3])` ?

   [[1]]

   Qual será o resultado de:
   
   `last (filter (>10) (squareAll [2, 3, 4]))` ?

   [[16]]

   Qual será o resultado de:

   `sum (filter (\x -> square x > 10 && square x < 30) [1, 2, 3, 4, 5, 6])` ?

   [[9]]


2. Considere este código:

   ```haskell
   isDoctor :: String -> Bool
   isDoctor nome = (take 2 nome) == "Dr"
   ```

   Qual será o resultado de:

   `length (filter isDoctor ["Mr. Hyde", "Dr. Jekyll", "Dr. Octopus"])` ?

   [[2]]

   Qual será o resultado de: 

   `length (filter (\x -> not (isDoctor x)) ["Dr. Jekyll", "Dr. Octopus"])` ?

   [[0]]





## Tuplas

- Sequência de elementos entre parênteses, separados por vírgula
- Tuplas agrupam dados que podem ser de diferentes tipos, em um único "registro"
- Semelhante a `struct` em C, mas sem identificação dos campos 


Exemplos:

```haskell
("Fulano",32)
("Reitoria",-29.72083,-53.71479)
```

### Operações com tuplas

Para tuplas com apenas 2 elementos, podemos obter o primeiro ou o segundo com as funções `fst` e `snd`:

```haskell
ghci> fst ("Fulano",32) 
"Fulano"
ghci> fst (1,2,3)
error!
ghci> snd ("Fulano",32)
32
```

### Tuplas e lambda

> Tuplas com muitos elementos não são comuns, mas...

E se tivermos mais de 2 elementos? Podemos usar lambda para obter o terceiro, quarto, etc.

```haskell
ghci> (\(n,lat,long) -> long) ("Reitoria",-29.72083,-53.71479)
-53.71479
```

### Quiz

- Nos exemplos abaixo, temos 2 tuplas de tipo `(String, Int)`. 
- Uma lista com estas tuplas tem tipo `[(String,Int)]`. 


1. Qual o resultado do código abaixo executado no GHCi?

   ```haskell
   filter (\(_,age) -> age > 60) [("Fulano", 32),("Beltrano", 64)] -- 2 tuplas (String,Int)
   ```

   - [( )] `[64]`
   - [(x)] `[("Beltrano",64)]`
   - [( )] `("Beltrano",64)`
   *******************************************

   A função `filter` sempre retorna uma lista. Neste caso, a lista contém a tupla selecionada pela função lambda, que recebe uma tupla e retorna o resultado `True` ou `False` da condição aplicada ao segundo elemento (`age`).

   *******************************************


2. Qual o resultado do código abaixo executado no GHCi?

   ```haskell
   hey you = "Hey " ++ you 
   greet people = map hey people   
   greet (map (\(name,_) -> name) [("Fulano", 32),("Beltrano", 64)]) 
   ```

   - [(x)] `["Hey Fulano","Hey Beltrano"]`
   - [( )] `[("Fulano", 32),("Beltrano", 64)]`
   - [( )] `("Hey Fulano", "Hey Beltrano")`
   *******************************************

   A função `hey` concatena a String `"Hey "` com o valor de `you`. A função `greet` aplica a função `hey` a cada um dos elementos da lista `people`. Por fim, a última linha aplica `greet` a uma lista resultante de um `map` com uma função lambda que obtém o primeiro elemento de uma tupla. Isso vai retornar a lista `["Fulano","Beltrano"]`, que vai ser passado como argumento para `greet`. Todo este código poderia ser reduzido a `map (\(name,_) -> "Hey " ++ name) [("Fulano", 32),("Beltrano", 64)]`

   *******************************************




## Prática

- Entre no Codespaces do repositório que você criou na última prática

- Crie uma pasta `haskell02` e copie estes arquivos para dentro da pasta:

  - [MyFunctions.hs](src/MyFunctions.hs)
  - [TestMyFunctions.hs](src/TestMyFunctions.hs)

- Complete o arquivo [MyFunctions.hs](src/MyFunctions.hs) com o que é solicitado

- Para testar o arquivo [MyFunctions.hs](src/MyFunctions.hs) no GHCi:

  ```
  cd haskell02
  ghci MyFunctions.hs  
  ```

- Ou melhor ainda, com teste automatizado:

  ```
  cd haskell02
  runhaskell TestMyFunctions.hs
  ```






## Bibliografia


Consulte as seções abaixo no livro [Learn you a Haskell for Great Good!](http://learnyouahaskell.com), de Miran Lipovača:

- [Funções de alta ordem (map, filter, etc.)](http://learnyouahaskell.com/higher-order-functions) 
- [Funções anônimas](http://learnyouahaskell.com/higher-order-functions#lambdas)
- [Tuplas](http://learnyouahaskell.com/starting-out) (procure por Tuples)

