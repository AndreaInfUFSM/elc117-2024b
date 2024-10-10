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
https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/master/classes/10/README.md
-->

[![LiaScript](https://raw.githubusercontent.com/LiaScript/LiaScript/master/badges/course.svg)](https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/main/classes/10/README.md)

# Produção personalizada

Avaliação no primeiro bimestre:


- Prova de leitura/escrita de código (peso 5): 24/10
- Apresentação de exercícios (peso 2)
- Produção individual personalizada (peso 3)
  
  ⚠️ Prazo: 27/10


## Requisitos 


1. Aprofundamento em programação funcional
2. Tema original, adaptado a interesse/experiência de cada estudante
3. Evidências de progresso individual e construção/teste incremental do código
4. Realização em etapas

## Etapas

1. Proposta do tema neste formulário: https://forms.gle/kVVCAg5DErhKdhn97
2. Validação do tema pela professora (aguarde email)
3. Criação de repositório: https://classroom.github.com/a/jAISmYj0
4. Desenvolvimento da proposta (estudo/pesquisa e construção/teste incremental do código)
5. Elaboração de README.md
6. Entrega de repositório contendo código e README.md


### Sobre o README.md

Estrutura e conteúdo:

1. Identificação: nome e curso
2. Tema/objetivo: descrição do tema/objetivo do trabalho, conforme a proposta validada
3. Processo de desenvolvimento: comentários sobre o desenvolvimento, incluindo fontes consultadas e versões com erros
4. Resultado final: demonstrar execução em GIF animado ou vídeo curto (máximo 60s)
5. Referências e créditos (incluindo alguns prompts, se aplicável)

## Exemplos gerais de temas

Avance para ver exemplos de temas...

### Serviço web com Scotty

- Tema: desenvolver um serviço web simples que responda a requisições get/post usando Scotty
- Scotty é um framework em Haskell para construção backend web (inclui seu próprio servidor HTTP)
- Ideias de serviços:

  - Somente leitura (get): conversões, sorteios, buscas, quizzes, etc.
  - Leitura / escrita (get/post, com persistência em arquivo): leaderboard para game, log para quizzes/games, listas de tarefas, etc.

- Ver mais sobre isso [aqui](https://liascript.github.io/course/?https://raw.githubusercontent.com/AndreaInfUFSM/elc117-2024b/main/projects/scotty/README.md)

### Experiências com outros recursos de programação funcional / Haskell

- Tema: pesquisar e realizar exercícios com recursos de programação funcional em Haskell não explorados em aula

- Exemplos de recursos:

  - Pattern matching: https://learnyouahaskell.com/syntax-in-functions#pattern-matching
  - Types and typeclasses: https://learnyouahaskell.com/types-and-typeclasses
  - Function composition: https://www.youtube.com/watch?v=dR_aUQXw5fs
  - I/O (de preferência com arquivos): https://learnyouahaskell.com/input-and-output
  - Estruturas de dados: https://hackage.haskell.org/package/containers-0.4.0.0
  - Teste automatizado: https://github.com/hspec/HUnit (ou QuickCheck, entre outros)
  - Música em Haskell: https://www.youtube.com/watch?v=FYTZkE5BZ-0
  - Bibliotecas em Haskell nas mais variadas áreas: https://hackage.haskell.org/packages/
  - Gráficos 2D e animações: https://github.com/benl23x5/gloss
  - Muitos outros: pesquise!

### Comparativos de códigos

- Tema: comparar códigos em Haskell com outras linguagens funcionais ou imperativas
- Resolva exercícios que foram feitos em Haskell em outras linguagens de programação funcional como Clojure ou Elixir, por exemplo
- Compare também com códigos em linguagens predominantemente imperativas
- Seu README.md precisará ter muitos comentários e referências
- Atenção: lembre que é obrigatório demonstrar execução, com instalação local ou em nuvem (não é só gerar código!)

### Um programa pra chamar de seu

- Tema: alguma ideia de um programa que você gostaria de implementar
- Algum programa que você tenha curiosidade de implementar e/ou já tenha implementado em outra disciplina 
- Atenção ao tempo: cuidado para não ter uma ideia muito complicada que demande mais tempo do que o previsto
- Importante decompor o programa em partes e desenvolver incrementalmente





