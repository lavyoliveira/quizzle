# 4 - qual-coexistencia

* Status: accepted <!-- optional -->
* Deciders: Lavynia, Laís, Wendel, Jhonatas, Luiz Fernando e Camila <!-- optional -->
* Date: 09/05/2023 21:32:54 <!-- optional -->
* Template used: [MADR 3.0.0](https://adr.github.io/madr/) <!-- optional -->

Technical Story: atributo de qualidade - coexistência <!-- optional -->

## Context and Problem Statement

Sob a ótica das características de qualidade do produto de software, mais especificamente da Compatibilidade, qual requisito melhor configura um atributo de qualidade essencial para que o aplicativo a ser desenvolvido funcione bem?

## Decision Drivers <!-- optional -->

* Visando as características do aplicativo
* Levando em consideração que, para o funcionamento do aplicativo, será fundamental a utilização do software "Talkback"
* Compreendendo que a parte terceira "Talkback" não apenas trocará informações com o aplicativo, ou responderá requisições avulsas, mas compartilhará recursos com ele, integrando parte de seu funcionamento.
<!-- numbers of drivers can vary -->

## Considered Options

* Coexistência
* Interoperabilidade
 <!-- numbers of options can vary -->

## Decision Outcome

Chosen option: "Coexistência", pois esse atributo avalia o quão bem o produto desenpenha suas funções enquanto compartilha ambiente e recursos comuns com outros produtos. Dado que o aplicativo Talkback integrará o funcionamento do jogo a ser desenvolvido, essa característica de qualidade se faz uma métrica essencial para avaliar o bom funcionamento do software.

### Positive Consequences <!-- optional -->

* No contexto de desenvolvimento, a seleção desse atributo de qualidade têm deixado a equipe mais atenta quanto a harmonia entre o funcionamento dos dois softwares, tornando-a o mais eficiente e eficaz possível.


### Negative Consequences <!-- optional -->

* A possibilidade de interoperabilidade com outros softwares, que talvez pudesse ser benéfica ao aplicativo no futuro, deixou de ser considerada por hora.

## Pros and Cons of the Options <!-- optional -->

### Coexistência

* Bom, pois descreve uma característica fundamental ao aplicativo
* Bom, pois sua consideração é relevante ao desenvolvimento correto do software
* Ruim, pois não é um atributo de qualidade fácil de se assegurar. É necessário dedicação ao estudo das ferramentas entre as quais se deseja harmonia
 <!-- numbers of pros and cons can vary -->

### Interoperabilidade

* Bom, pois são várias as possibilidades de melhoria de um produto de software através da interação com outros.
* Ruim, pois o atributo não se encaixa no escopo atual da aplicação em desenvolvimento.

<!-- markdownlint-disable-file MD013 -->
