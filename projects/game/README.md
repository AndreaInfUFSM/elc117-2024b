<!--
author:   Andrea Charão

email:    andrea@inf.ufsm.br

version:  0.0.1

language: PT-BR

narrator: Brazilian Portuguese Female

comment:  Material de apoio para a disciplina
          ELC106 - Algoritmo e Programação,
          da Universidade Federal de Santa Maria

translation: English  translations/English.md

-->
<!--
nvm use v14.21.1
liascript-devserver --input README.md --port 3001 --live
link:     https://cdn.jsdelivr.net/gh/liascript/custom-style/custom.min.css
          https://cdn.jsdelivr.net/gh/andreainfufsm/elc106-2023a/classes/12/custom.css

-->

[![LiaScript](https://raw.githubusercontent.com/LiaScript/LiaScript/master/badges/course.svg)](https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/main/projects/game/README.md)

# Projeto final de programação orientada a objetos (peso 6.0)


> Este documento traz instruções sobre o projeto final de programação que compõe a avaliação no segundo bimestre da disciplina de Paradigmas de Programação (2024b).





## Objetivos

Este projeto tem como objetivos:

- desenvolver um jogo temático em Java orientado a objetos
- usar o framework [libGDX](https://libgdx.com/)
- trabalhar preferencialmente em dupla 
- explorar o tema proposto de acordo com sua criatividade e interesses
- atender requisitos explicitados a seguir

## Requisitos

1. Tema: o jogo deve se relacionar com locais turísticos que estão se desenvolvendo na região, como por exemplo: [Geoparque Quarta Colônia](https://www.geoparquequartacolonia.com.br), [Geoparque Caçapava](https://geoparquecacapava.com.br/), [Distrito Criativo Centro-Gare](http://www.distritocentrogare.com.br), [Jardim Botânico da UFSM](https://www.ufsm.br/orgaos-suplementares/jardim-botanico), entre outros.

2. O jogo deve envolver algum tipo de quiz, mesmo que seja restrito a alguma parte do jogo. Alguns exemplos:
   
   - Riddles in the sky: https://wordwall.net/resource/77367/english/riddles-in-the-sky
   - Who is this Pokemom?: https://wordwall.net/resource/309956/who-is-this-pokemon
   - Planets - Who am I?: https://wordwall.net/resource/11126786/science/planets-who-am-i
   - KS3 Evolution Whack a mole: https://wordwall.net/resource/56164104/biology/ks3-evolution-whack-a-mole
   - Adventure Quiz: https://polargames.com.br/preview/quiz-adventure-en/ (tem bug!)
   - entre outros - use a criatividade!


3. O código deve ser organizado em várias classes, aplicando adequadamente os conceitos de programação orientada a objetos.

4. O jogo deverá funcionar na web, aproveitando os recursos que a libGDX oferece para jogos multiplataforma. A interação deve ser preferencialmente com **mouse/touch**, para possibilitar uso do jogo sem teclado.

5. O jogo deve ser publicado na Game Jam criada para esta turma: https://itch.io/jam/games-paradigmas-programacao-ufsm-2024b



## Desenvolvimento


- Você pode usar qualquer IDE à sua escolha para desenvolver o trabalho, desde que tenha suporte a Java, Git e Gradle. Na dúvida, use VS Code. Também é possível usar o Codespaces para gerar a versão web do jogo.

- Você deverá iniciar se ambientando com a libGDX: https://libgdx.com/dev/ (siga as instruções até conseguir executar um jogo de exemplo).

- Este trabalho deverá ser desenvolvido incrementalmente, usando Git para versionamento e GitHub Classroom para criação e hospedagem remota dos repositórios.

- Para criar o repositório de desenvolvimento do jogo, é importante que os integrantes da dupla já estejam minimamente ambientados com o GitHub. Um(a) dos integrantes deverá criar o repositório do grupo clicando neste link e informando um nome para o grupo: https://classroom.github.com/a/LkJswR6s  O(a) segundo(a) integrante da dupla deverá clicar no mesmo link e selecionar o nome do grupo criado pelo(a) colega.

- O repositório deverá ter commits de cada integrante da dupla, distribuídos ao longo do prazo de execução do trabalho. **Não deixe para iniciar o trabalho próximo à data de entrega!**


## Entrega e apresentação


- Deadline: 11/12

  - Este é o prazo para conclusão do desenvolvimento - último commit/push para o repositório
  - O repositório deverá incluir um README.md estruturado em seções, contendo título do jogo, identificação de autoria (nome e curso), comentários sobre o processo de desenvolvimento, diagrama de classes e referências

- Apresentações: 12/12

  - Demonstração do game para a turma
  - Apresentação do diagrama de classes



## Rubricas de avaliação

<!-- data-type="none" -->
| Descrição   | Nota   |
| :--------- | :--------- |
| Trabalho original, completamente alinhado com objetivos, requisitos e recomendações de desenvolvimento, contendo evidências de empenho e domínio de programação orientada a objetos | 10 a 12 |
| Trabalho original, alinhado com objetivos e com a maior parte dos requisitos e recomendações de desenvolvimento, contendo evidências de empenho e domínio de programação orientada a objetos | 7 a 9 |
| Trabalho alinhado com objetivos, mas com poucos requisitos e recomendações atendidos, mesmo assim contendo alguma evidência de empenho e conhecimento de programação orientada a objetos  | 5 a 7 |
| Trabalho não entregue, ou com indícios de desonestidade acadêmica / aproveitamento excessivo de código de terceiros, ou feito de última hora (sem evidências de empenho e progresso)  | 0 a 5 |

## Regras de Conduta


- É permitido consulta a qualquer material/ferramenta que contribua para seu progresso neste trabalho, desde que você cite as fontes **detalhadamente** na documentação. Isso inclui dar créditos a colegas, sites e geradores de código, incluindo prompts.

- Trechos de código copiados/gerados devem ter comentários indicando a fonte, e devem ser compreendidos na íntegra.

- Deve ficar claro que a entrega tem partes de sua própria autoria (adaptação, integração, etc.). Você deve ter domínio de todo o código entregue - jamais entregue código que você não entende.

- A entrega de trabalho que não é produto de seu próprio esforço/aprendizado será considerado meio **fraudulento** para lograr aprovação, enquadrado como **infração disciplinar discente grave**, conforme Art. 11, inciso XVI do [Código de Ética e Convivência Discente da UFSM](https://www.ufsm.br/pro-reitorias/proplan/codigo-de-etica-e-convivencia-discente-da-universidade-federal-de-santa-maria).
