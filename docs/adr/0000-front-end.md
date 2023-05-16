# 0 - front-end

* Status: accepted <!-- optional -->
* Deciders: Lavynia, Laís, Wendel, Jhonatas, Luiz Fernando e Camila <!-- optional -->
* Date: 09/05/2023 21:21:23 <!-- optional -->
* Template used: [MADR 3.0.0](https://adr.github.io/madr/) <!-- optional -->

Technical Story: flutter.dev <!-- optional -->

## Context and Problem Statement

Qual seria uma tecnologia de front-end que poderia abrangir a questão da acessibilidade sem problemas e que fosse mais fácil de ser desenvolvida pensando nas habilidades dos integrantes?

## Decision Drivers <!-- optional -->

* Acessibilidade, pensando no aplicativo para pessoas com deficiência visual
* Experiência com aplicativos mobile, pensando nos integrantes

## Considered Options

* React Native
* Flutter
* Kotlin
* Swift

## Decision Outcome

Opção escolhida: Flutter, porque existem bibliotecas nativas do framework para trabalhar tanto com o desenvolvimento front, back e também os testes, além de possuir mecanismos de acessibilidade.

## Pros and Cons of the Options <!-- optional -->

### [React Native]

* Bom, porque é bem fácil de se fazer o deploy em produção na App Store por conta do expo
* Bom, pois engloba aparelhos IOS e Android
* Ruim, por conta da acessibilidade
* Ruim, por conta dos conhecimentos da equipe serem poucos relacionados ao framework

### [Flutter]

* Ruim, porque é bem complicado de se fazer o deploy em produção na App Store
* Bom, pois engloba aparelhos IOS e Android
* Bom, por conta da acessibilidade
* Bom, por conta dos conhecimentos da equipe serem poucos relacionados ao framework

### [Kotlin]

* Ruim, pois é uma linguagem nativa para IOS
* Ruim, por conta dos conhecimentos da equipe serem poucos relacionados ao framework

## Links <!-- optional -->

* [Flutter vs React Native](https://cynoteck.com/pt/blog-post/flutter-vs-react-native-navigate-the-options/#:~:text=O%20React%20Native%20depende%20de,voc%C3%AA%20deve%20sempre%20escolher%20Flutter)

<!-- markdownlint-disable-file MD013 -->
