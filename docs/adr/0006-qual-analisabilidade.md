# 6 - qual-analisabilidade

* Status: accepted <!-- optional -->
* Deciders: Lavynia, Laís, Wendel, Jhonatas, Luiz Fernando e Camila <!-- optional -->
* Date: 09/05/2023 21:36:39 <!-- optional -->
* Template used: [MADR 3.0.0](https://adr.github.io/madr/) <!-- optional -->

Technical Story: atributo de qualidade - analisabilidade <!-- optional -->

## Context and Problem Statement

A partir de um possível erro encontrado no sistema, que atributo de qualidade possui os requisitos certos para ajudar os administradores a encontrarem uma solução de maneira eficiente e eficaz?

## Decision Drivers <!-- optional -->

* Visando todo o sistema e sua complexidade
* Levando em consideração que existem vários administradores/desenvolvedores e que cada um deles ficou responsável por uma parte do código, sendo assim todos precisam conseguir entender o código e o sistema como um todo e encontrar os erros facilmente 

## Considered Options

* Analisabilidade
* Testabilidade

## Decision Outcome

Chosen option: “Analisabilidade” porque um sistema que tenha esse atributo de qualidade bem aplicado, permite aos administradores que identifiquem os problemas, entendam todo o funcionamento interno e enxerguem possíveis pontos de melhoria.

### Positive Consequences <!-- optional -->

A equipe de desenvolvimento trabalha com harmonia e eficiência já que todos conseguem entender, analisar e buscar melhorias para cada parte da aplicação.

### Negative Consequences <!-- optional -->

Para que o código esteja organizado, comentado e documentado, exige muito tempo e esforço de todos os desenvolvedores da equipe. Além disso, a análise detalhada de partes individuais levam a uma otimização excessiva em nível local, resultando em desempenho inferior por não levar em conta o impacto em outras partes do sistema.

## Pros and Cons of the Options <!-- optional -->

### Analisabilidade

* Bom, pois permite examinar, analisar e compreender o sistema
* Bom, pois traz facilidade na manutenção
* Bom, pois permite a busca contínua de melhorias
* Ruim, pois leva tempo e esforço

### Tetsabilidade

* Bom, pois facilita testes no sistema para verificar se atende aos requisitos 
* Ruim, pois tem foco específico em aplicar testes

<!-- markdownlint-disable-file MD013 -->
