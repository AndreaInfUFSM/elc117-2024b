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
https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2023b/master/classes/09/README.md
-->

[![LiaScript](https://raw.githubusercontent.com/LiaScript/LiaScript/master/badges/course.svg)](https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/main/classes/09/README.md)

# Programação Funcional em Haskell (3)




> Este material é a terceira parte de uma introdução à **programação funcional** em Haskell.
>
> O conteúdo tem partes interativas e pode ser visualizado de vários modos usando as opções no topo da página.



 
                                                          
                                                          
## Mais sobre listas

- Relembrando: listas são suportadas nativamente e muito usadas em Haskell
- Muitas funções manipulam listas existentes: 
  
  - `head`, `tail`, `init`, `last`, etc.
  - veja mais em https://hackage.haskell.org/package/base-4.18.0.0/docs/Prelude.html#g:13


- Haskell também tem recursos sintáticos muito úteis para criar e gerar listas - é o que veremos no restante desta aula


![Desenho em estilo "rabisco" de uma centopeia estilizada, com a cabeça decorada com uma flor e corpo contendo 4 segmentos, cada segmento com um par de pés usando botas/meias. No desenho, estão indicadas 4 funções básicas com listas em Haskell: head (primeiro elemento, cabeça da lista), tail (restante da lista, sem a cabeça), init (lista sem o último elemento) e last (último elemento da lista). ](http://s3.amazonaws.com/lyah/listmonster.png "Fonte: List monster by Miran Lipovača (s3.amazonaws.com/lyah/listmonster.png)")





## Listas: notação `..`

- Usada entre colchetes
- Sintaxe para geração de listas em conjuntos ordenados
- Semelhante a "range" (intervalo) em outras linguagens
- Também conhecida como "Ellipsis notation": https://en.wikipedia.org/wiki/Ellipsis_%28computer_programming%29
- Usada com valores literais ou expressões

Exemplo no GHCi:

```haskell
> [1..5]
[1,2,3,4,5]
```

 

### Forma `[n..m]`

> Lista de `n` a `m` com passo 1


Exemplos:

```haskell
> [1..5]
[1,2,3,4,5]
> ['a'..'e']
"abcde"
> [5..1]
[]
```

Mais exemplos, agora com números fracionários:

```haskell
> [1.1..5]
[1.1,2.1,3.1,4.1,5.1]
> [1.4..5]
[1.4,2.4,3.4,4.4,5.4]
> [1.5..5]
[1.5,2.5,3.5,4.5,5.5]
> [1.6..5]
[1.6,2.6,3.6,4.6]
> [pi..4]
[3.141592653589793,4.141592653589793]
> [pi+1..5]
[4.141592653589793,5.141592653589793]

```
Note que: 

- o valor final pode não constar na lista gerada - é um limite que pode ou não ser excedido pelo último elemento, considerando arredondamentos em representações de ponto flutuante 
- podemos ter funções/expressões de cada lado do `..` (por exemplo, `[pi, pi+1..pi+5]`)


### Forma `[n,m..p]`

> Lista de `n` a `p`, com passo (`m`-`n`), positivo ou negativo




Exemplos:

```haskell
 [2,4..10]
[2,4,6,8,10]
> [3,6..16]
[3,6,9,12,15]
> [5,4..1]
[5,4,3,2,1]
> [3,2.5..1]
[3.0,2.5,2.0,1.5,1.0]
```

### Exemplos com funções

A notação `..` é muito usada dentro de funções.

**Exemplo 1**: lista de `Int`

Arquivo .hs

```haskell
func :: Int -> Int -> [Int]
func x c = [0, x .. x*(c-1)]
```

Execução no GHCi

```haskell
> func 2 5
[0,2,4,6,8]
```
Lista começa em `0`, tem passo `2`  e vai até `2*(5-1)=8`.

---

**Exemplo 2**: lista de `Float`, expressão com tipos diferentes

Arquivo .hs

```haskell
func :: Int -> Float -> [Float]
func c x = [0.0, x .. x * fromIntegral (c-1)]
```

Execução no GHCi

```haskell
> func 5 0.5
[0.0,0.5,1.0,1.5,2.0]
```

> Lembre: Não podemos misturar `Int` e `Float` em uma lista! 

> Função `fromIntegral` é usada para converter um tipo inteiro em um tipo fracionário.


### Conversões de tipos

Em Haskell, as conversões de tipos precisam ser explícitas.

| Funções | Descrição |
|---------|-----------|
| `fromIntegral`, `fromInteger` | Conversão de inteiros para fracionários | 
| `ceiling`, `floor`, `truncate`, `round` | Conversão de números reais fracionários para um tipo inteiro |




```haskell
mysequence :: Int -> [Float]
mysequence c = [pi .. fromIntegral c * pi]

-- Função principal
main = do
  putStrLn "Here is an example:"
  print (mysequence 2)
  
```


Outros exemplos no GHCi:

```haskell
> ceiling 7.8
8
> floor 7.8
7
> truncate 7.8
7
> round 7.8
8
> ceiling (-7.8)
-7
> floor (-7.8)
-8
> truncate (-7.8)
-7
> round (-7.8)
-8
```


### Listas infinitas

Haskell permite usar a notação `..` para expressar listas infinitas!

Forma geral: `[n..]` ou `[n,m..]`

**Exemplo 1**: lista infinita com passo `1` (default)

```haskell
> [10..]
[10,11,12,13 ^C Interrupted.
> [0.5..]
[0.5,1.5,2.5 ^C Interrupted.
```
Obs.: No GHCi, use Ctrl-C para interromper a geração infinita.

---

**Exemplo 2**: lista infinita com passo `-1` (9-10)


```haskell
> [10,9..]
[10,9,8 ^C Interrupted.
```

---

#### Com `take`


**Exemplo 3**: usando função [take](https://hackage.haskell.org/package/base-4.18.0.0/docs/Prelude.html#v:take) para obter somente os 5 primeiros elementos da lista infinita


```haskell
Prelude> take 5 [11..]
[11,12,13,14,15]
```

---

Afinal, para que serve uma lista infinita?

- Gerar uma lista indefinidamente não parece muito útil...
- Mas geralmente queremos apenas uma parte dela
- Recurso útil para não nos preocuparmos com limites na hora de programar
- Possível porque Haskell tem *lazy evaluation*



## Lazy Evaluation

- Haskell é uma linguagem implementada com *lazy evaluation* (avaliação preguiçosa)
- Técnica que retarda a avaliação de uma expressão até que seu valor seja realmente necessário
- Termos afins: *call-by-need*, *non-strict evaluation*
- Veja mais sobre isso em: https://en.wikipedia.org/wiki/Lazy_evaluation

- Vantagens:

  - Desempenho: evita cálculos desnecessários
  - Uso de memória: valores criados somente quando necessário
  - Poder de expressão da linguagem


![Desenho no estilo cartoon mostrando uma poltrona e 3 personagens: à esquerda na imagem, um homem deitado com a cabeça em um travesseiro no chão e com os pés na poltrona; à direita, um gato e um rato dormindo. Sobre o homem, há um balão com o pensamento: "I'm not lazy. I'm like a cat. Ready to pounce into action."](img/its_hard_work_being_lazy.jpg "Fonte: www.thedailystar.net/sites/default/files/styles/very_big_1/public/feature/images/its_hard_work_being_lazy.jpg")




## List Comprehension

> Recurso inspirado na representação de conjuntos em matemática!

Representação de conjuntos:

-  "por extensão": elementos são enumerados
-  "por compreensão": expressão que descreve os elementos do conjunto

Exemplos em matemática:

- Expressão: `{x | x ∈ {2,3,5,7,11} ∧ x ≥ 4}`

  Conjunto: `{5,7,11}`

- Expressão: `{x + x | x ∈ {2,3,5,7,11} ∧ x ≥ 3  ∧  x﹤7}`

  Conjunto: `{6,10}`


### Sintaxe básica


List comprehensions em Haskell têm esta forma geral:

`[ expression | generators, conditions ]` 

Onde:

- `generators`: especificam uma lista de origem, usando `<-` (p.ex. `x <- [0..9]`)
- `expression`: especifica o que será feito com cada elemento proveniente do lado direito
- `conditions`: especificam condições para filtragem de listas de origem (opcionais)


Exemplo:

```haskell
> [x*2 | x <- [0..9]]
[0,2,4,6,8,10,12,14,16,18]
```

Conjunto compreendido por:

- Valores de `x*2` tal que
- `x` pertence à lista geradora `[0..9]`


> Atenção aos nomes de variáveis! Note que a variável `x` aparece tanto do lado direito como do lado esquerdo do `|`. 


### Forma equivalente a `map`

Note que:

```haskell
> [x*2 | x <- [0..9]]
[0,2,4,6,8,10,12,14,16,18]
```

Equivale a:

```haskell
> map (*2) [0..9]
[0,2,4,6,8,10,12,14,16,18]
```

Como em `map`:

- Para cada `x` pertencente à lista geradora `[0..9]`
- Coloque `x*2` na lista resultante


### Forma equivalente a `filter`

> Podemos aplicar condições na lista geradora à direita

Note que:

```haskell
> [x | x <- [2,3,5,7,11], x >= 4]
[5,7,11]
```

Equivale a:


```haskell
> filter (>=4) [2,3,5,7,11]
[5,7,11]
```

Como em `filter`:

- Para cada `x` pertencente à lista geradora `[2,3,5,7,11]`
- Se `x >= 4`, coloque `x` na lista resultante

### Forma equivalente a laços aninhados

> Podemos ter mais variáveis e mais geradores à direita


```haskell
> [ x+y | x <- [0..2], y <- [10,11]]
[10,11,11,12,12,13]
```

```haskell
> [(x,y) | x <- [0..2], y <- [0..2]]
[(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),(2,0),(2,1),(2,2)]
```

```haskell
> [(x,y) | x <- [0,1], y <- [0..2]]
[(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
```

Isso é equivalente a um produto cartesiano em matemática!

`{(x,y) | x ∈ X ∧ y ∈ Y}`

> Semelhante a **laços aninhados** na programação imperativa!



### Exemplos com funções

**Exemplo 1**: Equivalente a `filter`, agora dentro de função:

Arquivo .hs:

```haskell
removeChar :: Char -> [Char] -> [Char]
removeChar c str = [x | x <- str, x /= c]
```

No GHCi:

```haskell
> removeChar 'a' "abababa"
"bbb"
```


**Exemplo 2**: Equivalente a `map`, com expressão condicional à esquerda:

Arquivo .hs:

```haskell
filterImg :: [Int] -> [Int]
filterImg bitmap = [if pixel < 10 then 0 else pixel | pixel <- bitmap]

```

No GHCi:

```haskell
> filterImg [1,3,4,20,40,40,40,3,2]
[0,0,0,20,40,40,40,0,0]

```


### Resumindo

List comprehension:

- Recurso muito poderoso, capaz de expressar sucintamente operações que precisariam de uma ou mais funções
- Uma única notação com várias possibilidades - análogo a um canivete suíço!
- Existe em várias outras linguagens, como Python, por exemplo
- Veja mais aqui: https://en.wikipedia.org/wiki/List_comprehension


![Imagem de um canivete suíço com várias ferramentas em um único objeto.](img/SAK_1_6795__S2.jpg "Fonte: imageengine.victorinox.com/mediahub/33849/560Wx490H/SAK_1_6795__S2.jpg")


## Quizzes 

Avance para ver as questões...

### Sem consulta

Tente responder estas questões **sem consultar nenhum material**. Caso responda incorretamente, tire dúvidas consultando o material ou colegas/professora.


1. Qual o resultado da expressão abaixo executada no GHCi?

   ```haskell
   [2*y | y <- [2..4]]
   ```

   - [( )] [2,3,4]
   - [(x)] [4,6,8]
   - [[?]] A expressão declara uma lista formada por valores de 2*y tal que y pertence a lista [2,3,4].


2. A expressão abaixo é equivalente a aplicar filter em [2..4] e passar o resultado para map (2*y)?

   ```
   [2*y | y <- [2..4], even y]
   ```

   - [(x)] Sim
   - [( )] Não
   - [[?]] Sim, esta list comprehension substitui tanto filter quanto map.

3. Qual será o resultado da expressão abaixo executada no GHCi?

   ```
   zipWith (\x y -> x + y) [1,2,3] (take 3 [11..])
   ```

   - [(x)] [12,14,16]
   - [( )] [11,12,13]
   - [[?]] zipWith recebe uma função e 2 listas 

4. Que recursos de programação funcional em Haskell estão presentes na expressão abaixo?

   ```
   zipWith (\x y -> x + y) [1,2,3] (take 3 [11..])
   ```

   - [( )] Função de alta ordem, função lambda, list comprehension
   - [(x)] Lista infinita, função lambda, função de alta ordem
   - [[?]] Lista infinita ([11..]), função lambda ((\x y -> x + y)), função de alta ordem (zipWith)



5. A expressão abaixo vai gerar erro se removermos a função `fromIntegral`?

   ```
   [0.1..fromIntegral (length [1,2,3])]
   ```

   - [(X)] Sim
   - [( )] Não
   - [[?]] A função length retorna Int e, sem conversão explícita, a lista não será homogênea.









### Com consulta

Esta parte vai exigir um pouco mais de atenção e conhecimento. 

É recomendável revisar o material antes e buscar referências sobre funções que você não conhece. 

Caso responda incorretamente, teste os códigos por partes no interpretador interativo GHCi.



1. Qual o resultado da expressão abaixo executada no GHCi? 

   ```haskell
   sum [x^2+1 | x <- [0..3]]
   ```

   [[18]]

2. Qual o resultado da expressão abaixo executada no GHCi? 

   ```haskell
   length [x+1 | x <- [5..1]]
   ```

   [[0]]

3. Qual o resultado da expressão abaixo executada no GHCi? 

   ```haskell
   length [(x,x^2) | x <- take 4 [2,4..]]
   ```
   
   [[4]]

4. Qual o resultado da expressão abaixo executada no GHCi? 

   ```haskell
   foldl1 (+) [y | (x,y) <- [(1,2), (3,4)]]
   ```
    
   [[6]]


5. Qual o resultado das linhas de código abaixo executadas no GHCi?



   ```haskell
   listOfTuples = [(0,1,"red"),(1,2,"green"),(8,4,"red")]
   length [color | (_,_,color) <- listOfTuples, color == "red"]   
   ```

   [[2]]


6. Qual o resultado da expressão abaixo executada no GHCi? 

   ```haskell
   head [ a ++ b | a <- ["lazy","big"], b <- ["frog", "dog"]]
   ```

   [["lazyfrog"]]

7. Qual o resultado das linhas de código abaixo executadas no GHCi?

   ```haskell
   tupla = head [(x,y) | x <- [1..5], even x, y <- [(x + 1)..6], odd y]
   (\(x,y) -> x+y) tupla
   ```

   [[5]]


8. Sabendo que a função `concat` recebe uma lista de listas e concatena as sub-listas em uma única lista, qual o resultado das linhas de código abaixo executadas no GHCi? 

   ```haskell
   word = concat [if elem x "aeiou" then [x,'-'] else [x] | x <- "paralelo"]
   init $ take 3 word
   ```

   [["pa"]]






## Prática

- Entre no Codespaces do repositório que você criou na última prática

- Crie uma nova pasta e copie os seguintes arquivos para dentro da pasta:

  - [MyFunctions.hs](src/MyFunctions.hs)
  - [TestMyFunctions.hs](src/TestMyFunctions.hs)

- Complete o arquivo [MyFunctions.hs](src/MyFunctions.hs) com o que é solicitado

### Teste interativo no GHCi

- Para testar o arquivo [MyFunctions.hs](src/MyFunctions.hs) no GHCi:

  ```
  ghci MyFunctions.hs  
  ```



### Teste automatizado

- O programa `TestMyFunctions.hs` usa uma biblioteca de teste automatizado de software (HUnit) para testar as funções que você criou.

- Para instalar a biblioteca, digite no terminal:

  ```
  cabal update && cabal install --lib HUnit
  ```

- Para executá-lo, digite o seguinte no terminal:

  ```
  runhaskell TestMyFunctions.hs
  ```

- Se tudo der certo, a saída será a seguinte:
  
  ``` text
  Cases: 5  Tried: 5  Errors: 0  Failures: 0
  Cases: 6  Tried: 6  Errors: 0  Failures: 0
  Cases: 11  Tried: 11  Errors: 0  Failures: 0
  ```

## Bibliografia


Consulte as seções abaixo no livro [Learn you a Haskell for Great Good!](http://learnyouahaskell.com), de Miran Lipovača:

- [List comprehension](http://learnyouahaskell.com/starting-out#im-a-list-comprehension)
- [Funções de alta ordem (map, filter, etc.)](http://learnyouahaskell.com/higher-order-functions)
- [Funções anônimas](http://learnyouahaskell.com/higher-order-functions#lambdas)
- [Tuplas](http://learnyouahaskell.com/starting-out#tuples) 

