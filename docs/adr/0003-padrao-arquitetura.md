# 3 - padrao-arquitetura

* Status: accepted <!-- optional -->
* Deciders: Lavynia, Laís, Wendel, Jhonatas, Luiz Fernando e Camila <!-- optional -->
* Date: 09/05/2023 21:32:01 <!-- optional -->
* Template used: [MADR 3.0.0](https://adr.github.io/madr/) <!-- optional -->

## Context and Problem Statement

Qual seria um padrão arquitetural para o software que correspondesse a essência do aplicativo e que considerasse nossos atributos de qualidade?

## Decision Drivers <!-- optional -->

* Pensando num padrão arquitetural para um aplicativo pequeno
* Levando em consideração a pouca experiência dos integrantes da equipe
* Explorando uma arquitetura que colaborasse com a boa prática de desenvolvimento dos atributos de qualidade

## Considered Options

* MVC
* Clean Architecture

## Decision Outcome

Opção escolhida: MVC, pois apesar de serem utilizados módulos de forma a melhorar o acoplamento, o MVC colabora para aplicativos mais simples e que não hajam preocupações de escalabilidade. Software iniciantes combinam bem com o padrão arquitetural MVC.

## Pros and Cons of the Options <!-- optional -->

### MVC

* Bom, pois se trata de uma arquitetura com muito uso e muito material de apoio
* Bom, por ser uma arquitetura simples de ser implementada
* Ruim, em questões de complexidade de software, pois é feito com enfoque nos de menor complexidade
* Bom, pois a complexidade do aplicativo é bem pequena, então o padrão se encaixa

### Clean Architecture

* Bom, pois se trata de uma arquitetura bastante completa
* Ruim, pois é uma arquitetura que demanda muito tempo no começo
* Bom, pois a arquitetura facilita o desacoplamento dos módulos
* Bom, pois colabora na evolução do software em questões de manutenção

## Links <!-- optional -->

* [Why using MVC](https://rohaaan.hashnode.dev/mastering-the-mvc-pattern-in-flutter-a-guide-to-better-code-organization)<!-- example: Refined by [ADR-0005](0005-example.md) -->

<!-- markdownlint-disable-file MD013 -->
