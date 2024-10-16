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



<!--
nvm use v14.21.1
liascript-devserver --input README.md --port 3001 --live
https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/master/classes/12/README.md
-->


[![LiaScript](https://raw.githubusercontent.com/LiaScript/LiaScript/master/badges/course.svg)](https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/main/classes/12/README.md)


# Programação Lógica (2)




## Unificação

- Unificação é um conceito fundamental em Prolog, que: 

  - verifica se 2 termos são compatíveis/unificáveis
  - atribui valores a variáveis buscando tornar os termos idênticos

- Unificação ocorre "por trás" da execução de um programa e também explicitamente com `=`

### Operador `=`

- Não tem o mesmo sentido do `=` usado nas linguagens imperativas
- Usado para provocar unificação, geralmente com variáveis
- Resultado pode ser `true`, `false` ou valores atribuídos a variáveis 

### Variável anônima (`_`)

Mais sobre variáveis em Prolog

- Iniciam por maiúsculas, p.ex. `X`, `Solucao`, etc.
- Também podem iniciar por `_` (underline, sublinhado), p.ex. `_casas`, `_X` (sintaxe pouco usada)

Variável pode ser "anônima" (sem nome)

- Usa apenas o símbolo `_`
- Usado como "placeholder", quando não nos interessa o valor, só a posição

### Exemplos

```
?- A = 1.
A = 1.

?- B = A + 1.
B = A+1.

?- B is A + 1.
ERROR: Arguments are not sufficiently instantiated
ERROR: In:
ERROR:    [8] _4054 is _4060+1
ERROR:    [7] <user>

?- A = 1, B is A + 1.
A = 1,
B = 2.

?- A = 1, A = A + 1.
false.

?- A = [1,2], length(A,L).
A = [1, 2],
L = 2.

?- A = [1,2,X], X is 2+1.
A = [1, 2, 3],
X = 3.

?- casa(_, azul, _) = casa(bob, _, gato).
true.

?- casa(_, azul, _) = casa(bob, azul, gato).
true.

?- casa(_, azul, _) = casa(bob, X, _), X = verde.
false.

?- casa(_, azul, _) = casa(bob, azul, _, _).
false.
```



## Listas

- Suportadas nativamente em Prolog
- Representam sequências finitas de elementos
- Podem ser homogêneas ou heterogêneas (elementos de diversos tipos: constantes, variáveis, predicados)
- Sintaxe básica: delimitação com colchetes 

  - Com elementos separados por vírgula, p.ex.:

    ``` prolog
    [elem1, elem2, elem3]
    [drama, comedy, scifi, adventure]
    [casa(1,azul),casa(2,verde)]
    [1,a,2,b]
    [A, 2]
    ```
  - Com variáveis e `|` para separação entre head e tail, p.ex.:

    ``` prolog
    [H | [b,c,d]]
    [1 | T]
    [H | [b,c,d]]
    ```



### Predicados com listas

- Lembre que predicados em Prolog se assemelham a procedimentos (não a funções)
- Se quisermos que "retornem" algum valor, devemos usar variáveis nos argumentos

#### `length/2`

- Predicado usado para obter/verificar o tamanho (número de elementos) de uma lista
- Sintaxe: `length(List,Length)`, onde `Length` é o tamanho da lista `List`
- Documentação: https://www.swi-prolog.org/pldoc/man?predicate=length/2
- Exemplos executados no interpretador SWI-Prolog:

  ```
  ?- length([a,b,c],Len).
  Len = 3.
  
  ?- length([movie(the_avengers)],Len).
  Len = 1.

  ?- length([movie(the_avengers)],2).
  false.

  ?- length(["abc"],Len).
  Len = 1.

  ?- length(["abc","def"],2).
  true.

  ```


#### `member/2`

- Predicado usado para verificar a existência de um elemento na lista
- Sintaxe: `member(Elem,List)`, onde `Elem` é um elemento da lista `List`
- Documentação: https://www.swi-prolog.org/pldoc/man?predicate=member/2
- Exemplos executados no interpretador SWI-Prolog:

  ```
  ?- member(a, [a,b,c,d]).
  true.

  ?- member(x, [a,b,c,d]).
  false.

  ?- member(E,[a,b,c,d]).
  E = a ;
  E = b ;
  E = c ;
  E = d.

  ```

#### `nextto/3`

- Predicado usado para verificar se 2 elementos são consecutivos
- Sintaxe: `nextto(X, Y, List)`, verdadeiro se `X` antecede `Y` na lista `List`
- Documentação: https://www.swi-prolog.org/pldoc/man?predicate=nextto/3
- Exemplos executados no interpretador SWI-Prolog:

  ```
  ?- nextto(b,c,[a,b,c,d]).
  true .

  ?- nextto(b,X,[a,b,c,d]).
  X = c ;
  false.

  ?- nextto(b,X,[a,b,1,a,b,2]).
  X = 1 ;
  X = 2 ;
  false.
  ```


#### `permutation/2`

- Predicado usado para gerar permutações de uma lista
- Sintaxe: `permutation(Xs, Ys)`, onde `Xs` é uma permutação de `Ys`
- Documentação: https://www.swi-prolog.org/pldoc/doc_for?object=permutation/2
- Exemplos executados no interpretador SWI-Prolog:

  ```
  ?- permutation([a,b,c],[b,c,a]).
  true .

  ?- permutation([a,b,c],L).
  L = [a, b, c] ;
  L = [a, c, b] ;
  L = [b, a, c] ;
  L = [b, c, a] ;
  L = [c, a, b] ;
  L = [c, b, a] ;
  false.

  ?- permutation(L,[a,b,c]).
  L = [a, b, c] ;
  L = [a, c, b] ;
  L = [b, a, c] ;
  L = [c, a, b] ;
  L = [b, c, a] ;
  L = [c, b, a] ;
  false.
  ```

#### `findall/3`


- Predicado usado para gerar uma lista com valores de uma variável em uma consulta
- Veja mais em: https://www.educba.com/prolog-findall/
- Exemplo: suponha esta base de dados

  ```
  age(edgard, 23).
  age(edward, 25).
  ```
- Consulta no interpretador SWI-Prolog:

  ```
  ?- findall(A, age(_,A), L).
  L = [23, 25].
  ```



#### Outros predicados com listas

- Prolog tem vários outros predicados pré-definidos que manipulam listas
- Descubra-os na documentação: https://www.swi-prolog.org/pldoc/man?section=lists




### Exemplos: Logic Puzzles


Você já ouviu falar do "Enigma de Einstein" ou "Charada de Einstein"? 

É um problema de lógica que circula pela Internet há muitos anos, no estilo "clickbait", afirmando (sem nenhuma evidência) que foi criado por Albert Einstein e que só uma pequena parcela da população consegue resolvê-lo.

Imagine então quantas pessoas conseguem resolvê-lo em Prolog? :-)

A seguir veremos uma versão simplificada, mas você pode encontrar uma versão completa em: https://rachacuca.com.br/logica/problemas/teste-de-einstein/

#### Primeira versão



Problema:

- Existem 3 casas alinhadas, cada uma com uma cor diferente: vermelha, verde e azul.
- Em cada casa vive uma pessoa: Alice, Bob e Carla.
- Cada pessoa tem um pet: gato, cachorro, hamster.
- Bob vive na casa vermelha.
- A pessoa que tem um gato vive na casa do meio.
- Carla vive na casa ao lado da casa azul.
- A pessoa que vive na casa verde tem um cachorro.
- Qual a cor, o morador e o pet de cada casa?




                 {{1}}
************************************************

Solução em Prolog, usando listas:

``` prolog
ao_lado(X, Y, List) :- nextto(X, Y, List). % X à esquerda de Y
ao_lado(X, Y, List) :- nextto(Y, X, List). % Y à esquerda de X

solucao(Casas) :-
  Casas = [_,casa(_,_,gato),_],
  member(casa(_,verde,cachorro),Casas),
  member(casa(_,azul,_),Casas),
  member(casa(_,_,hamster),Casas),
  member(casa(alice,_,_),Casas),
  member(casa(bob,vermelha,_),Casas),
  member(casa(carla,_,_),Casas),
  ao_lado(casa(carla,_,_),casa(_,azul,_),Casas). 
```
************************************************


                 {{2}}
************************************************

Quantas soluções existem? Vejamos no SWI-Prolog:

```
?- solucao(X).
X = [casa(carla, verde, cachorro), casa(alice, azul, gato), casa(bob, vermelha, hamster)] ;
X = [casa(bob, vermelha, hamster), casa(alice, azul, gato), casa(carla, verde, cachorro)] ;
false.

?- findall(X, solucao(X), Solucoes), length(Solucoes, Len).
Solucoes = [[casa(carla, verde, cachorro), casa(alice, azul, gato), casa(bob, vermelha, hamster)], [casa(bob, vermelha, hamster), casa(alice, azul, gato), casa(carla, verde, cachorro)]],
Len = 2.
```

> Prolog nos ajuda a buscar alternativas que satisfaçam condições!

************************************************

#### Segunda versão



Problema com algumas condições modificadas:

- Existem 3 casas alinhadas, cada uma com uma cor diferente: vermelha, verde e azul.
- Em cada casa vive uma pessoa: Alice, Bob e Carla.
- Cada pessoa tem um pet: gato, cachorro, hamster.
- Bob vive na casa vermelha.
- A pessoa que tem um gato vive na casa do meio.
- Carla **tem um hamster** e vive na casa ao lado da casa azul.
- **A primeira casa é verde**.
- Qual a cor, o morador e o pet de cada casa?




                 {{1}}
************************************************

Solução em Prolog, usando listas:

``` prolog
ao_lado(X, Y, List) :- nextto(X, Y, List). % X à esquerda de Y
ao_lado(X, Y, List) :- nextto(Y, X, List). % Y à esquerda de X

solucao(Casas) :-
  Casas = [casa(_,verde,_),casa(_,_,gato),_],
  member(casa(_,_,cachorro),Casas),
  member(casa(_,azul,_),Casas),
  member(casa(_,_,hamster),Casas),
  member(casa(alice,_,_),Casas),
  member(casa(bob,vermelha,_),Casas),
  member(casa(carla,_,hamster),Casas),
  ao_lado(casa(carla,_,_),casa(_,azul,_),Casas).  
```
************************************************


                 {{2}}
************************************************

Quantas soluções existem? Vejamos no SWI-Prolog:

```
?- solucao(Casas).
Casas = [casa(carla, verde, hamster), casa(alice, azul, gato), casa(bob, vermelha, cachorro)] ;
false.

?- findall(X,solucao(X), Solucoes), length(Solucoes, Len).
Solucoes = [[casa(carla, verde, hamster), casa(alice, azul, gato), casa(bob, vermelha, cachorro)]],
Len = 1.
```

************************************************



## Prática com fatos, regras e consultas

### Programa `movies.pl`

Baixe o programa [movies.pl](src/movies.pl) e adicione-o no seu Codespace de Prolog.

Este código em Prolog declara os seguintes predicados sobre filmes:

- `movie/3`: fatos na forma `movie(MovieId, MovieName, Year)`
- `actor/2`: fatos na forma `actor(MovieId, ActorName)`
- `actress/2`: fatos na forma `actress(MovieId, ActressName)`
- `genre/2`: fatos na forma `genre(MovieId, Genre)`
- `likes/2`: fatos na forma `likes(UserName, MovieId)`
- `drama_actor/1`: regra estabelecendo que `A` é um ator de drama se `A` for ator do filme `M` e este filme for do gênero drama.


### Comandos no `swipl`

- Para carregar o programa `moviesl.pl` no interpretador: `swipl movies.pl`
- Para sair do interpretador: `Ctrl-D` ou `halt.`
- Para (re-)carregar o programa `movies.pl` quando você estiver dentro do interpretador: `[movies].` (sem extensão .pl, e sem esquecer do ponto!)
- Use setas para cima ou para baixo para navegar pelo histórico de consultas.
- Para ativar o modo de execução passo-a-passo: `trace.`
- Para desativar o modo de execução passo-a-passo: `nodebug.`

### Teste consultas básicas


- No terminal, digite `swipl movies.pl` para abrir o programa `movies.pl` no interpretador interativo do SWI-Prolog
- No prompt do SWI-Prolog (`?-`), digite consultas que vão retornar um resultado para uma pergunta. Por exemplo: "Em que ano foi lançado o filme Parasite?"

  ``` prolog
  ?- movie(1,parasite,A).
  A = 2009.
  ```

Teste as seguintes consultas:


1. Quais os filmes lançados no ano de 2014?

   `?- movie(Id, M, 2014).`

2. Quais os filmes lançados na década atual? (digite `;` após a primeira resposta para buscar mais respostas)
   
   `?- movie(Id, M, A), A >= 2020.`

3. Quais os filmes lançados no século passado? 
   
   `?- movie(Id, M, A), A =< 2000.`

4. Quais os atores do filme `tusk`?

   `?- movie(Id,tusk,_), actor(Id,Name).`

   Observações:
   
   - Note que o símbolo `_` é uma variável anônima, usada quando não queremos obter um valor para ela, mas apenas sinalizar que existe um argumento na posição.

   - Note que usamos a variável `Id` para "conectar" as duas condições nesta consulta. Quando a execução do programa testar um valor para `Id` na primeira condição, este valor será mantido na segunda condição.




### Fique por dentro da execução

Ative o modo de execução passo-a-passo para ver como o interpretador Prolog faz uma busca na base de fatos e regras:

```
?- trace.
true.
```

Execute a consulta `actor(11,A)`. Digite `Enter` para avançar e `;` depois da primeira resposta, para buscar outras respostas.

```
[trace] 1 ?- actor(11,A).
   Call: (10) actor(11, _8588) ? creep
   Exit: (10) actor(11, brad_pitt) ? creep
A = brad_pitt ;
   Redo: (10) actor(11, _8588) ? creep
   Exit: (10) actor(11, eli_roth) ? creep
A = eli_roth.
```

Desative o modo de execução passo-a-passo:

```
[trace]  ?- nodebug.
true.
```



### Escreva suas consultas 

Nestes exercícios:

- você vai escrever consultas em Prolog para responder às perguntas
- as consultas vão utilizar os predicados definidos no programa, com argumentos constantes ou variáveis, de acordo com a pergunta
- para encadear mais de um predicado/condição, use `,` para expressar um "e" lógico ou `;` para expressar um "ou" lógico


Escreva estas consultas:


1. O filme `schindlers_list` é uma comédia?



2. Quais os atores (masculinos) do filme `inglorious_basterds`? 


3. Quais os filmes lançados na década de 80 (entre 1981 e 1990, inclusive)? Dica: veja operadores relacionais no material da aula passada.



4. Quais os atores ou atrizes do filme `the_hunger_games`?



5. O ator `brad_pitt` é um ator de drama? 



6. Há quantos anos foi lançado o filme `big_fish`? Consulte o material da aula passada para saber como fazer operações aritméticas em Prolog.



7. O ator `liam_neeson` é um ator de comédia?



### Adicione regras em `movies.pl`

No final do arquivo `movies.pl`:

1. Defina o predicado `drama_artist(A)`, que será verdadeiro se `A` for ator ou atriz em um filme de drama. 



2. Defina o predicado `movieAgeByName(M, Age)`, em que `Age` será a idade (em anos) do filme de nome `M`, no ano atual. 



3. Defina o predicado `recommend(U,M)`, para recomendar um filme de nome `M` a um usuário `U`. Este predicado será verdadeiro se for encontrado um filme do mesmo gênero de um filme apreciado (`like`) pelo usuário `U`.



**Atenção!** Teste todos os predicados que você definir, observando se o resultado é igual ao esperado.



## Prática com listas 

Como já vimos, Prolog suporta listas nativamente.  No programa `movies.pl`, há alguns predicados que manipulam listas.

Avance para testar esses predicados e adicionar outro.

### Teste e adicione

Teste as seguintes consultas:


1. Quais os gêneros de filmes na base de dados? A resposta será uma lista na variável G.

   `?- allgenres(G).`

2. Qual o primeiro gênero na lista? A resposta estará na variável H (head da lista G). 

   `?- allgenres(G), G = [H | _].`

3. Quantos são os gêneros de filmes na base de dados?
   
   `?- countgenres(C).`

4. Com base nos códigos anteriores, adicione um predicado para contar o número de usuários na base de dados.



## Bibliografia


- Robert Sebesta. Conceitos de Linguagens de Programação. Bookman, 2018. Disponível no Portal de E-books da UFSM: http://portal.ufsm.br/biblioteca/leitor/minhaBiblioteca.html (Capítulo 16: Programação Lógica)
- Patrick Blackburn, Johan Bos, and Kristina Striegnitz. [Learn Prolog Now](http://www.learnprolognow.org).
- Markus Triska. [The Power of Prolog](https://www.metalevel.at/prolog).
