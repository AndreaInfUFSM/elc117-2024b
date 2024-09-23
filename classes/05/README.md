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
https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2023b/master/classes/03b/README.md
-->

[![LiaScript](https://raw.githubusercontent.com/LiaScript/LiaScript/master/badges/course.svg)](https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/main/classes/05/README.md)


# Programação Funcional em Haskell

> Teste o que você entendeu até agora!

## Primeiro quiz

As questões a seguir são corrigidas automaticamente.





### Questão 1 


É possível executar um código Haskell que não tenha uma função `main`?

- [(x)] Sim
- [( )] Não
******************************************************

Sim, é possível. Você não precisa definir uma função `main` para poder executar um código Haskell, já que é possível executar qualquer função chamando-a no interpretador interativo.

*******************************************************





### Questão 2


Se você executar o código abaixo no interpretador interativo GHCi, qual será o resultado?

```haskell
length "abc" + length [1,2,3]
```

[[6]]
******************************************************

A função `length` obtém a quantidade de elementos de uma lista, que pode ser de qualquer tipo. Uma String em Haskell é uma lista de Char, portanto a função se aplica tanto a "abc" (3 elementos), como a [1,2,3] (também 3 elementos).

*******************************************************




### Questão 3


Marque abaixo as opções que designam listas válidas em Haskell:

- [[x]] `['a','b','c']`
- [[ ]] `["idade", 10]`
- [[x]] `[[1,2],[8,9]]`
******************************************************

Em Haskell, listas são homogêneas, compostas por dados do mesmo tipo. Por isso, a lista `["idade", 10]` não é válida, mas as outras alternativas são.

*******************************************************



### Questão 4


Na definição de uma função em Haskell, é necessário escrever `return` para retornar o resultado de uma função?

- [( )] Sim
- [(x)] Não
******************************************************

Não, ao contrário de muitas linguagens que suportam funções, em Haskell não se usa `return` para explicitar que a função deve retornar algum valor para o ponto em que foi chamada. Esse retorno acontece implicitamente.

*******************************************************



### Questão 5


Considere esta definição:

``` haskell
func :: String -> Bool 
func s = length s > 10
```

O resultado de `func "teste"` será:

- [( )] 10
- [( )] True
- [( )] 5
- [(x)] False
******************************************************

Esta função será `True` se o tamanho da String for maior que 10, portanto o resultado para a String "teste" será `False`.

*******************************************************



### Questão 6


Considere esta definição:

``` haskell
func :: Int -> Char -> String
func n c = replicate n c
```

O tipo de retorno desta função é:

- [( )] Int
- [( )] Char
- [(x)] String
******************************************************

Haskell permite escrever funções tipadas ou não. No caso de funções tipadas, os tipos envolvidos ficam na primeira linha de definição da função. Para saber o tipo de cada argumento e o tipo do resultado, você deve fazer uma correspondência entre a linha de cima e a linha de baixo: o primeiro tipo corresponde ao primeiro argumento e assim por diante, sendo que o último tipo é o tipo do resultado.

*******************************************************



### Questão 7



Considere novamente esta definição:

``` haskell
func :: Int -> Char -> String
func n c = replicate n c
```

Quais dos usos destas função são **inválidos**?

- [( )] func 3 'z'
- [(x)] func (2^2) "a"
- [( )] func (length [1,2,3]) 'a'
- [(x)] func pi 'r'
******************************************************

O tipo do argumento `n` é `Int` e do argumento `c` é `Char`. Assim, o segundo item é inválido porque o segundo argumento não é do tipo Char, mas sim do tipo String. O último item é inválido porque a função constante pi, que está no lugar do primeiro argumento, não é do tipo Int. 

*******************************************************




## Segundo quiz

**ATENÇÃO!!!**

> Esta parte não tem correção automática e deve ser feita em aula, junto com toda a turma! 

> **Aguarde instruções da professora para se conectar com a turma antes de responder**.


### Questão 1



A função `toUpper :: Char -> Char` está pré-definida e acessível via `import Data.Char`.

Esta função **recebe um único caracter** e retorna seu equivalente em maiúscula.

Suponha que você tenha a String "Paradigmas" e queira obter "PARADIGMAS" (tudo em maiúsculas). 

Qual o código em Haskell que faz isso?


- [(a)] a) `toUpper "Paradigmas"`
- [(b)] b) `map toUpper "Paradigmas"`





### Questão 2


Qual será o resultado de `filter (> pi) [1.5, 2.5, 3.5, 4.5]`?

- [(a)] a) [2.5, 3.5, 4.5, 5.5]
- [(b)] b) [3.5, 4.5]
- [(c)] c) []





### Questão 3



Suponha que você tenha uma lista de nomes (por exemplo,`["Fulano", "Beltrano"]`) e queira obter todos os nomes em maiúsculas (`["FULANO", "BELTRANO"]`).  Qual o código em Haskell que faz isso?


- [(a)] a) `filter toUpper ["Fulano", "Beltrano"]`
- [(b)] c) `map toUpper ["Fulano", "Beltrano"]`
- [(c)] b) `map (map toUpper) ["Fulano", "Beltrano"]`





### Questão 4

Considere que: 

- **Tuplas** são coleções de valores delimitados por parênteses e separados por vírgula, por exemplo: `("Haskell", 1990)`, `("blue",0,0,1)`, `(10.2, 23.9)`, etc..

- Um programa usa a tupla `("Fulano",True)` para indicar que a pessoa de nome "Fulano" está presente em uma aula. 

- Este programa mantém a seguinte lista de tuplas com a frequência de pessoas em uma aula: `[("Fulano",True),("Beltrano",False)]`. 

Qual dos códigos abaixo obtém a quantidade de pessoas presentes?


- [(a)] a) `length (filter (\(n,p) -> p) [("Fulano",True),("Beltrano",False)])`
- [(b)] b) `length (map (\(n,p) -> p) [("Fulano",True),("Beltrano",False)])`




### Ficou em dúvida?

Você ficou com dúvida? Ou não estava na aula?


<details>
<summary>Gabarito</summary>
<p>1b: Você precisa usar map para aplicar toUpper a cada caracter da String</p>
<p>2a: Este filter aplica a condição (> pi) a cada elemento da lista, selecionando 3.5 e 4.5, que são maiores que 3.14159</p>
<p>3c: Note que toUpper se aplica a um único Char. Uma String é uma lista de Char, ou seja [Char]. Aqui neste exemplo, temos uma lista de String, ou seja [String] ou \[\[Char\]\]. Por isso, o (map toUpper) mais interno corresponde a uma conversão de uma única String para maiúscula, e o map mais externo aplica o map interno a cada String da lista de String.</p>
<p>4a: Para selecionar os alunos presentes, aplicamos filter. O resultado será uma lista somente com alunos presentes (p == True), que será passada para length, que retornará o número de elementos. A condição neste filter usa uma sintaxe desconhecida até então, mas note que conhecer isso não é imprescindível para resolver esta questão, pois a única diferença entre as opções é o uso de map ou filter.</p>    
</details> 
