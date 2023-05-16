# 1 - back-end

* Status: accepted <!-- optional -->
* Deciders: Lavynia, Laís, Wendel, Jhonatas, Luiz Fernando e Camila <!-- optional -->
* Date: 09/05/2023 21:31:02 <!-- optional -->
* Template used: [MADR 3.0.0](https://adr.github.io/madr/) <!-- optional -->

## Context and Problem Statement

Qual seria o melhor back-end para gestão de estados que fornecesse a possibilidade de guardar na sessão do dispositivo as respostas e pontuações?

## Decision Drivers <!-- optional -->

* Efetividade para não perder os dados
* Experiência com o back-end, pensando nos integrantes

## Considered Options

* Bloc
* Cubit
* Get

## Decision Outcome

A opção escolhida foi: Get, satisfazendo os direcionadores de decisões, por ser o gerenciador de estado mais fácil de se aprender e também bastante eficaz.

## Pros and Cons of the Options <!-- optional -->

### [Bloc]

* Bom, gerenciador de estados bastante completo e complexo, com muitas funcionalidades
* Ruim, pois de tão completo não atendia as necessidades do projeto
* Ruim, difícil de se aprender e implementar
* Bom, eficaz

### [Cubit]

* Bom, gerenciador de estados bastante complexo, com muitas funcionalidades
* Bom, versão reduzida do Bloc, mas ainda com implementação desnecessária no projeto
* Ruim, difícil de se aprender e implementar
* Bom, eficaz

### [GetX]

* Ruim, gerenciador de estados bem sucinto
* Bom, coube nas necessidades do projeto
* Bom, fácil de se aprender e implementar
* Bom, serve com seu propósito

## Links <!-- optional -->

* [Bloc vs GetX](https://medium.com/@sonawanedipak111/getx-vs-bloc-flutter-741e480bae67) <!-- example: Refined by [ADR-0005](0005-example.md) -->

<!-- markdownlint-disable-file MD013 -->
