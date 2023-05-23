# Heróis da Marvel

Olá! Me chamo Felipe Kaça, e este é um projeto-portfólio, onde aplico meus principais conhecimentos sobre Flutter. 

## O projeto
O projeto é bastante simples: mostra uma lista infinita de heróis da marvel. Além disso, possui uma lista horizontal na parte superior, 
com os 5 primeiros heróis retornados da API da marvel (http://gateway.marvel.com/v1/public/characters).

## Roadmap
Este projeto tem muitos caminhos para melhorias futuras, como: 
- Adicionar uma search bar para busca de heróis
- Página de detalhes do herói: podemos incluir também outros dados que são retornados da API, como as "Comics" que aquele herói possui.

Outra coisa interessante que podemos construir é um backend nosso que integra essa API, e montar, para cada herói, campos que possibilitem 
a construção de um fórum de cada um, onde os usuários poderiam adicionar comentários, avaliar os heróis, entre outras funcionalidades. Dessa forma, 
teriamos uma plataforma muito mais interativa. 

## Arquitetura
Seguindo principios de SOLID e Clean Code, o projeto é desenhado da seguinte forma:
- Core

Possui configurações gerais sobre o projeto, como constantes, strings, cores. Além disso, é composta também por arquivos de configuração inicial, como das bibliotecas Dio e Get it (explicadas abaixo)

- Features

Composta pelas funcionalidades do nosso aplicativo, onde cada uma possui seus diretórios "Data" (composta por repositórios e integrações), "Domain" (composta pela entidade que usamos), "Presentation" (composta pelo gerenciador de estados e as widgets).
Deste modo, temos todos os componentes necessários de forma separada por camadas. 

