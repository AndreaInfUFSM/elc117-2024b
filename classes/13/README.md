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
https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/master/classes/13/README.md
-->


[![LiaScript](https://raw.githubusercontent.com/LiaScript/LiaScript/master/badges/course.svg)](https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/main/classes/13/README.md)


# Programação Lógica (3)





> Este material é parte uma introdução ao paradigma de **programação lógica** em linguagem Prolog.
>
> O conteúdo tem partes interativas e pode ser visualizado de vários modos usando as opções no topo da página.


## Quizzes sobre a prática

- Questões sobre a parte [Escreva suas consultas](#3)
- Questões sobre a parte: [Adicione regras](#4)

### Primeira parte: consultas

A parte "Escreva suas consultas" na prática da aula passada tinha **7 questões**. A seguir temos um quiz sobre 3 delas.

                 {{1}}
************************************************

Qual das alternativas abaixo responde a pergunta: "Quais os filmes lançados na década de 80 (entre 1981 e 1990, inclusive)?"

- [( )] `?- movie(Id,M,A), A >= 1981, A <= 1990.`
- [( )] `?- movie(Id,M,A), A >= 1981, A =< 1990`
- [(x)] `?- movie(Id,M,A), A >= 1981, A =< 1990.`
- [( )] `?- movie(Id,M,A), A >= 1981, A <= 1990`
***********************

Prolog usa o operador relacional `=<` para verificar se um valor é igual ou menor que outro. Além disso, as cláusulas devem terminar com um `.`

Exemplo de resultado:

```
?- movie(Id,M,A), A >= 1981, A =< 1990.
Id = 7,
M = dead_poets_society,
A = 1989 ;
false.
```

***********************


************************************************





                 {{2}}
************************************************

Qual das alternativas abaixo responde corretamente à pergunta: "Quais os atores ou atrizes do filme `the_hunger_games`"?

- [( )] `?- movie(Id,the_hunger_games,_), actor(Id,A), actress(Id,A).`
- [( )] `?- movie(Id,the_hunger_games,_), actor(Id,Actor); actress(Id,Actress).`
- [( )] `?- movie(Id,the_hunger_games,_), actor(Id,A); actress(Id,A).`
- [(x)] `?- movie(Id,the_hunger_games,_), (actor(Id,Actor);actress(Id,Actress)).`
***********************

Prolog usa `;` para expressar um "ou" lógico. As condições são avaliadas da esquerda para a direita. Nesta consulta, usamos parênteses para expressar que o "ou" se refere às condições com os predicados actress e actor. Sem os parênteses, a consulta retornaria ficaria equivalente a `(movie(Id,the_hunger_games,_), (actor(Id,Actor));actress(Id,Actress)).` (devido à avaliação da esquerda para a direita).

Exemplo de resultado:

```
?- movie(Id,the_hunger_games,_), (actor(Id,Actor);actress(Id,Actress)).
Id = 3,
Actor = josh_hutcherson ;
Id = 3,
Actor = liam_hemsworth ;
Id = 3,
Actress = jennifer_lawrence.
```

***********************

************************************************



                 {{3}}
************************************************

A consulta abaixo responde à pergunta: "Há quantos anos foi lançado o filme `big_fish`"?

```
?- movie(big_fish), Idade is 2024 - A.
```

- [( )] Sim
- [(x)] Não
***********************

Não, porque o predicado `movie` tem 3 argumentos, mas nesse exemplo só foi passado um. Além disso, a variável `A` não poderá ser deduzida.

A seguir uma consulta correta para responder à pergunta:

```
?- movie(_,big_fish,A), Idade is 2024 - A.
A = 2003,
Idade = 21.
```

***********************

************************************************

### Segunda parte: regras

A parte "Adicione regras em movies.pl" da prática tinha 3 questões. A seguir temos um quiz sobre 2 delas.


                 {{1}}
************************************************

Qual das opções abaixo **não** define corretamente o predicado `drama_artist(A)`, que será verdadeiro se `A` for ator ou atriz em um filme de drama. 

- [( )] `drama_artist(A) :- (actor(M, A); actress(M, A)), genre(M, drama).`
- [(x)] `drama_artist(A) :- genre(M, drama), actor(M, A), actress(M, A).`
- [( )] `drama_artist(A) :- genre(M, drama), (actor(M,A); actress(M,A)).`
***********************

Este predicado precisa de um "ou" (`;`) entre os predicados `actor` e `actress`.

***********************

************************************************




                 {{2}}
************************************************

Complete abaixo o predicado `recommend(U,M)`, para recomendar um filme de nome `M` a um usuário `U`. 

Este predicado será verdadeiro se for encontrado um filme do mesmo gênero de um filme apreciado (`like`) pelo usuário `U`. 

Sua resposta deve ser preenchida no campo marcado com "?".

recommend(U,M) :- likes(U,A), genre(A,G), movie(I,M,_), genre(I, [[ G ]]), not(A=I).
***********************

Este predicado:

1. busca um filme `A` apreciado pelo usuário `U` (`likes(U,A)`)
2. obtém o gênero `G` do filme `A` (`genre(A,G)`)
3. busca um filme `I` de nome `M`, desprezando sua data de lançamento (`movie(I,M,_)`)
4. verifica se o gênero de `I` é `G`, ou seja, igual ao gênero de `A` (`genre(I,G)`)
5. impõe a condição `not(A=I)`, para garantir que a recomendação seja de um filme diferente daquele que já consta como apreciado pelo usuário

***********************


************************************************







## Prática

Baixe o programa [songs.pl](src/songs.pl) e adicione-o no seu Codespace de Prolog.

Este código em Prolog declara os seguintes predicados:

- `song/2`: fatos na forma `song(SongName, Year)`
- `duration/3`: fatos na forma `duration(SongName, Minutes, Seconds)`
- `artist/2`: fatos na forma `artist(SongName, ArtistName)`


### Modifique `songs.pl`

No final do arquivo `songs.pl`:

1. Defina o predicado `duration_in_secs(SongName, Secs)`, de forma que `Sesc` seja a duração da música `SongName` em segundos. Lembre de usar `is` para aritmética em Prolog.

2. Adicione o seguinte predicado para testar seu código:

   ```prolog
   playlist_duration(Time) :-
     findall(S, duration_in_secs(_, S), L), sum_list(L, Time). 
   ```

   Se tudo estiver certo, você deverá poder executar a seguinte consulta:

   ```
   ?- playlist_duration(T).
   T = 3532.
   ```



3. Adicione o predicado recursivo `filterShorts(L1, L2)`, em que `L1` é uma lista de números `L1` e  `L2` é uma lista contendo somente os números menores que `200` de `L1`.

   ```prolog
   filterShorts([],[]).
   filterShorts(L1,L2) :-
     L1 = [H|T],
     H < 200,
     filterShorts(T, Aux),
     L2 = [H|Aux].
    
   filterShorts(L1,L2) :-
     L1 = [H|T],
     H >= 200,
     filterShorts(T, L2).
   ```

   Explicação:

   - Este predicado é definido com um fato e duas regras.
   - O fato serve como condição de parada da recursão: uma filtragem de lista vazia é uma lista vazia.
   - A notação `[H|T]` unifica com uma lista não-vazia, sendo `H` o primeiro elemento (head) da lista e `T` o restante (tail). Podemos usar esta notação para "decompor" uma lista em head e tail.
   - As duas regras expressam condições alternativas que podem ocorrer. Essas regras poderiam ser combinadas em uma única regra com um `;` (ou), mas ficaria menos legível.

4. Adicione o seguinte predicado para testar seu código:

   ```prolog
   playlist_shorts(L) :- 
     findall(S, duration_in_secs(_, S), A), filterShorts(A, L).
   ```

   Se tudo foi adicionado corretamente, você deverá poder executar a seguinte consulta:

   ```
   ?- playlist_shorts(L).
   L = [176, 190, 162, 179]
   ```



5. Escreva uma consulta para obter os nomes das músicas cuja duração seja menor que 200 segundos.


6. Adicione um predicado `short(Song)` que seja verdadeiro se `Song` for uma música com duração menor que 200 segundos.




## Bibliografia


- Robert Sebesta. Conceitos de Linguagens de Programação. Bookman, 2018. Disponível no Portal de E-books da UFSM: http://portal.ufsm.br/biblioteca/leitor/minhaBiblioteca.html (Capítulo 16: Programação Lógica)
- Patrick Blackburn, Johan Bos, and Kristina Striegnitz. [Learn Prolog Now](http://www.learnprolognow.org).
- Markus Triska. [The Power of Prolog](https://www.metalevel.at/prolog).
