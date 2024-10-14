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

## Prática com fatos, regras e consultas

### Programa `movies.pl`

Este código em Prolog declara os seguintes predicados:

- `movie/2`: fatos na forma `movie(MovieName,Year)`
- `actor/2`: fatos na forma `actor(MovieName, ActorName)`
- `actress/2`: fatos na forma `actress(MovieName, ActressName)`
- `genre/2`: fatos na forma `genre(MovieName, Genre)`
- `likes/2`: fatos na forma `likes(UserName, MovieName)`
- `user/1`: fatos na forma `user(UserName)`
- `drama_actor/1`: regra estabelecendo que `A` é um ator de drama se `A` for ator do filme `M` e este filme for do gênero drama.

     
### Consultas básicas


- No terminal, digite `swipl movies.pl` para abrir o programa `movies.pl` no interpretador de comandos do SWI-Prolog
- No prompt do SWI-Prolog (`?-`), digite consultas que vão retornar um resultado para uma pergunta. Por exemplo: "Em que ano foi lançado o filme Precious?"

  ``` prolog
  ?- movie(precious,A).
  A = 2009.
  ```

Teste as seguintes consultas:


1. Quais os filmes lançados no ano de 2001?

   `?- movie(M, 2001).`

2. Quais os filmes lançados nesta década? (digite `;` após a primeira resposta para buscar mais respostas)
   
   `?- movie(M, A), A >= 2020.`

3. Quais os filmes lançados no século passado? 
   
   `?- movie(M, A), A =< 2000.`


### Comandos no `swipl`

- Para sair do interpretador: `Ctrl-D` ou `halt.`
- Para (re-)carregar o programa `movies.pl` quando você estiver dentro do interpretador: `[movies].` (sem extensão .pl, e sem esquecer do ponto!)
- Para ativar o modo de execução passo-a-passo: `trace.`
- Para desativar o modo de execução passo-a-passo: `nodebug.`

### Por dentro da execução

Ative o modo de execução passo-a-passo para ver como o interpretador Prolog faz uma busca na base de fatos e regras:

```
?- trace.
true.
```

Execute a consulta `actor(shallow_hal,A)`. 

Digite `Enter` para avançar e `;` depois da primeira resposta, para buscar outras respostas.

```
[trace]  ?- actor(shallow_hal,A).
   Call: (10) actor(shallow_hal, _15438) ? creep
   Exit: (10) actor(shallow_hal, jack_black) ? creep
A = jack_black ;
   Redo: (10) actor(shallow_hal, _15438) ? creep
   Exit: (10) actor(shallow_hal, jason_alexander) ? creep
A = jason_alexander.
```

Desative o modo de execução passo-a-passo:

```
[trace]  ?- nodebug.
true.
```



### Mais consultas 

Escreva as seguintes consultas em Prolog:


1. Quais os atores do filme `fight_club`? 

2. O filme `interstellar` é uma comédia?

3. Quais os filmes lançados na década de 80 (entre 1981 e 1990, inclusive)?

4. Quais os atores ou atrizes do filme `black_widow`?

5. O ator `brad_pitt` é um ator de drama? 

6. Há quantos anos foi lançado o filme `the_avengers`? Consulte o material da aula passada para saber como fazer operações aritméticas em Prolog.

7. Em português, escreva uma pergunta que possa ser respondida com os predicados do programa `movies.pl`. Responda a pergunta com uma consulta em Prolog.

8. O ator `chris_evans` é um ator de comédia?



### Regras em `movies.pl`

No final do arquivo `movies.pl`:

1. Defina o predicado `drama_artist(A)`, que será verdadeiro se `A` for ator ou atriz em um filme de drama. 

2. Defina o predicado `movieaged(M, Y)`, em que `Y` será a idade (em anos) do filme `M`, no ano atual. 

3. Defina o predicado `recommend(U,M)`, para recomendar um filme `M` a um usuário `U`. Este predicado será verdadeiro se for encontrado um filme do mesmo gênero de um filme apreciado (`like`)pelo usuário `U`.


**Atenção!** Teste todos os predicados que você definir, observando se o resultado é igual ao esperado.



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
- Exemplo: suponha esta base

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


## Prática com listas


### Listas em `movies.pl`

Prolog suporta listas nativamente.  No programa `movies.pl`, há alguns predicados que manipulam listas.


Teste as seguintes consultas:


1. Quais os gêneros de filmes na base de dados? A resposta será uma lista na variável G.

   `?- allgenres(G).`

3. Qual o primeiro gênero na lista? A resposta estará na variável H.

   `?- allgenres(G), head(G, H).`

2. Quantos são os gêneros de filmes na base de dados?
   
   `?- countgenres(C).`


Mesmo tendo apenas um primeiro contato com Prolog, você consegue criar um predicado para contar o número de usuários na base de dados?



## Bibliografia


- Robert Sebesta. Conceitos de Linguagens de Programação. Bookman, 2018. Disponível no Portal de E-books da UFSM: http://portal.ufsm.br/biblioteca/leitor/minhaBiblioteca.html (Capítulo 16: Programação Lógica)
- Patrick Blackburn, Johan Bos, and Kristina Striegnitz. [Learn Prolog Now](http://www.learnprolognow.org).
- Markus Triska. [The Power of Prolog](https://www.metalevel.at/prolog).
